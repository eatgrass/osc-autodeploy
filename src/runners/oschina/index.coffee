_ = require 'lodash'
{runScript} = require '../../utils'


# TODO handle the result
module.exports =
    run : (tasks)->
        taskThunks = _.map tasks, (task)->
            # run scripts flow
            runScript task.path, task.args, task.options
        taskThunks
