koa = require 'koa'
logger = require 'koa-logger'
router = require('koa-router')()
bodyParser = require('koa-body')()
oschina = require './services/oschina'
oscRunner = require './runners/oschina'

app = koa()
app.use logger()
osc_ci=oschina()

router .post '/ci/oschina', osc_ci, ->
    result = yield oscRunner.run @request.ciTasks
    console.log result
    @body = "ok!"
    yield return

app.use router.routes()

app.listen 8421
