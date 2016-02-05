fs = require 'fs'
path = require 'path'
process = require 'child_process'
scriptDir = path.join __dirname, '../../scripts/'

module.exports =
    "runScript" : (file, args, options)->
        scriptPath = if path.isAbsolute file then file else path.join scriptDir, file

        (callback)->
            process.execFile scriptPath, args, options, (err,stdout,stderr)->
                unless err
                    callback null, {stdout : stdout, stderr : stderr}
                else
                    callback err, null

    "readFile": (file, options)->
        (callback)->
            fs.readFile file, options, (err,data)->
                unless err
                    callback null, data
                else
                    callback err,null
