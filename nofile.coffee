K = require './lib'
coffee = require 'coffee-script'
doc = require 'nodoc'

IOLICENSE =
    """
    /**
     * @license
     * io.js https://github.com/iojs/io.js/blob/v1.x/LICENSE
     */

    """

task 'iojs', 'Download libs of io.js', ->
    K.download 'https://raw.githubusercontent.com/iojs/io.js/v1.x/lib/path.js', './io/', processor: (data)->
        data = IOLICENSE + data
        data.replace(/const/g, 'var')


noCoffee = (opt) -> (file) ->
    file.dest.ext = '.js'
    file.set coffee.compile file.contents, opt

task 'build', "Build Project", ->
    kit.warp 'lib/**'
    .pipe noCoffee bare: true
    .to 'dist'

task 'doc', "Generate api document", ->
    fs.glob 'lib/**'
    .then (fpaths)->
        Promise.all fpaths.map (fpath)->
            doc.render fpath, moduleName: ''
        .then (resArr)->
            resArr.join '\n'
    .then (data)->
        fs.readFile 'Readme.tpl'
        .then (f1)->
            fs.writeFile 'Readme.md',  _.template('' + f1)(api: data)

task 'default', ['build', 'iojs', 'doc']
