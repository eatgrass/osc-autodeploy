koa = require 'koa'
logger = require 'koa-logger'
router = require('koa-router')()
bodyParser = require('koa-body')()
process = require 'child_process'

app = koa()
app.use logger()

router .post '/ci/oschina', bodyParser, ->
    hook = JSON.parse @request.body.hook

    if hook.hook_name is "push_hooks"
        push hook.push_data

    @body = "ok!"
    yield return

push = (data)->
    repository = data.repository.name
    if data.ref is 'dev'
        commits.forEach (commit)->
            if commit.message.indexOf "deploy yh-mall for testing:" >=0
                out = yield runScript "./scripts/Hello.sh"
                console.log out


#Thunkified child_process.execFile
runScript = (file,args,options)->
    (callback)->
        process.execFile file, args, options, (err,stdout,stderr)->
            unless err
                callback null, {stdout : stdout, stderr : stderr}
            else
                callback err, null


app.use router.routes()

app.listen 8421
