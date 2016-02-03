koa = require 'koa'
logger = require 'koa-logger'
router = require('koa-router')()
bodyParser = require('koa-body')()

app = koa()
app.use logger()

router .post '/ci/oschina', bodyParser, ->
    console.log @request.body
    @body = "ok!"


app.use router.routes()

app.listen 8421
