nokit = require 'nokit'
path = require './path'

isDir = (path)->
    path[path.length - 1] is '/'

###*
 * Download file by url
 * @param  {string} url   link url
 * @param  {string} fpath file path to write data, directory should end with `/`
 * @param  {Object} opts  options
 * @return {Promise}
 * @option processor process data before writing to file
 * @example
 * ```javascript
 * download('http://zeptojs.com/zepto.js', './lib')
 * ```
###
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
