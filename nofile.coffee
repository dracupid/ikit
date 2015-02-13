require 'nokit/global'
doc = require 'nodoc'

task 'build', "Build Project", ->
    kit.warp 'lib/**'
    .load drives.coffee()
    .run 'dist'

task 'doc', "Generate api document", ->
    kit.glob 'lib/**'
    .then (fpaths)->
        Promise.all fpaths.map (fpath)->
            doc.render fpath, moduleName: ''
        .then (resArr)->
            resArr.join '\n'
    .then (data)->
        kit.readFile 'Readme.tpl'
        .then (f1)->
            kit.writeFile 'Readme.md',  _.template('' + f1)(api: data)

task 'default', ['build', 'doc']
