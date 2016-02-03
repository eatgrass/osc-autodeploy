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
    if data.ref is 'refs/heads/dev'
        data.commits.forEach (commit)->
            if (commit.message.indexOf "deploy yh-mall for testing:") >=0
                process.execFile "./scripts/Hello.sh", (err,stdout,stderr)->
                    console.log err if err
                    console.log stdout if stdout
                    console.log stderr if stderr


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
