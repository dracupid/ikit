K = require './lib'
coffee = require 'coffee-script'

task 'iojs', 'Download libs of io.js', ->
    K.download 'https://raw.githubusercontent.com/iojs/io.js/v1.x/lib/path.js', './io/', processor: (data)->
        data.replace(/const/g, 'var')


noCoffee = (opt) -> (file) ->
    file.dest.ext = '.js'
    file.set coffee.compile file.contents, opt

task 'build', "Build Project", ->
    kit.warp 'lib/**'
    .pipe noCoffee bare: true
    .to 'dist'

task 'default', ['build', 'iojs']
