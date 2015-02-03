nokit = require 'nokit'
path = require './path'

isDir = (path)->
    path[path.length - 1] is '/'

download = (url, fpath, opts = {})->
    if l_.isObject fpath
        opts = fpath
        fpath = null

    l_.defaults opts,
        processor: (a)-> a

    fileName = path.basename url
    fpath ?= path.join process.cwd(), fileName

    if isDir fpath
        fpath = path.join fpath, fileName

    nokit.request url
    .then (data)->
        fs.outputFile fpath, opts.processor data


module.exports = {
    download
}
