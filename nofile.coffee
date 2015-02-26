doc = require 'nodoc'
kit = require 'nokit'
drives = kit.require 'drives'
{_, Promise} = kit

module.exports = (task)->

    task 'build', "Build Project", ->
        kit.warp 'lib/**'
        .load drives.reader isCache: false
        .load drives.coffeelint config: 'coffeelint-strict.json'
        .load drives.coffee()
        .run 'dist'
        .catch ->

    task 'doc', "Generate api document", ->
        kit.glob 'lib/**'
        .then (fpaths)->
            Promise.all fpaths.map (fpath)->
                doc.render fpath,
                    moduleName: ''
                    rule:
                        removePrefix: /\w+\./
            .then (resArr)->
                resArr.join '\n'
        .then (data)->
            kit.readFile 'Readme.tpl'
            .then (f1)->
                kit.writeFile 'Readme.md',  _.template('' + f1)(api: data)

    task 'default', ['build', 'doc']
