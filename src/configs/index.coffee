yaml = require 'js-yaml'
fs = require 'fs'
path = require 'path'
util = require 'util'

fnConfig = ->
    filePath = path.join __dirname, "../../", "ci-configs.yml"
    config = fs.readFileSync filePath, 'utf8'

    doc = yaml.safeLoad config
    console.log process.cwd()
    console.log path.parse(__filename)

fnConfig()

module.exports=fnConfig
