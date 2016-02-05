{readFile} = require '../../utils'
yaml = require 'js-yaml'
compose = require 'koa-compose'
bodyParser = require('koa-body')()
path = require 'path'
_ = require 'lodash'

module.exports = (options) ->
    compose [bodyParser, _middleware options]

_middleware = (options)->
    configPath = options?.configPath or path.join __dirname, '../../../ci-configs.yml'
    (next)->
        {project} = @query
        if project
            unless @app.context.ci
                configs = yield readFile configPath, 'utf8'
                @app.context.ci = yaml.safeLoad configs
            ci = @app.context.ci[project]
            hook = JSON.parse @request.body.hook
            data = hook.push_data

            specs = _.filter ci.specs, (spec)->
                branchMatched = _.some spec.branches, (branch)->
                    _.includes data.ref, branch
                _.includes(data.commits[0].message, spec.trigger) and spec.enable is true and branchMatched

            @request.ciTasks = _.map specs, (spec)->
                spec.script
        yield next
