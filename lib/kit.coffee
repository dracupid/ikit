nokit = require 'nokit'
jhash = kit.require 'jhash'

kit = {}

coffee = require 'coffee-script'

require.extensions['.cson'] = (module, filename)->
    cson = '' + FS.readFileSync filename
    cson = "module.exports =\n" + cson.replace /\n/g, '\n\t'
    answer = coffee.compile cson, filename
    module._compile answer, filename

ikitRc = do ->
    try
        require PATH.join process.cwd(), 'ikit'
    catch
        {}

isDir = (fpath)->
    fpath[fpath.length - 1] is '/'

githubUrl = (user, repo, fpath, version)->
    version or version = 'master'
    "https://raw.githubusercontent.com/#{user}/#{repo}/#{version}/#{fpath}"


###*
 * [getRealUrl description]
 * @param  {[type]} url [description]
 * @return {[type]}     [description]
 * @example
 * ```
 * github
 * - git://drcupid/npm-up/lib/cli.coffee
 * - git://drcupid/npm-up/package.json#v1.2.0
 * http, https
 * - http://zeptojs.com/zepto.js
 * [dracupid's res repo](https://github.com/dracupid/res)
 * - res://config/coffeelint.json
 * ```
###
getRealUrl = (url)->
    url = url.trim()
    [protocol, upath, version] = url.split /:\/\/|#/

    switch protocol
        when 'http', 'https'
            return url
        when 'git'
            [user, repo, fpath...] = upath.split '/'
            return githubUrl user, repo, fpath.join('/'), version
        when 'res'
            return githubUrl 'dracupid', 'res', upath, version


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
kit.download = (url, fpath, opts = {})->
    if lodash.isObject fpath
        opts = fpath
        fpath = null

    lodash.defaults opts,
        processor: (a)-> a

    fileName = PATH.basename url

    fpath or fpath = PATH.resolve process.cwd(), fileName

    if isDir fpath
        fpath = PATH.join fpath, fileName

    nokit.request url
    .then (data)->
        FS.outputFile fpath, opts.processor data
        fpath

kit.hashFile = (fileName)->
    FS.readFile fileName
    .then jhash.hash.bind jhash

###*
 * init `ikit.cson` file
 * @param  {string='.cson'} ext extname of ikit file
 * @return {Promise}
###
kit.init = (ext = '.cson')->
    ext[0] == '.' or ext = '.' + ext

    if FS.existsSync 'ikit' + ext
        nokit.err 'ikit.json already exists!'.red
        return Promise.reject()

    name = 'ikit' + ext
    defaultFile = PATH.join __dirname, '../assets', 'ikitRc', name

    if not FS.existsSync defaultFile
        return Promise.reject 'ext not supported!'
    else
        FS.copy defaultFile, PATH.join process.cwd(), name

kit.clone = ()->
    if arguments.length > 1
        return kit.download.call @, arguments

    FS.readJSON 'ikit.json'
    .then (rc)->
        promise = []
        urls = rc.clone
        if Array.isArray urls
            urls.forEach (url)->
                promise.push kit.download getRealUrl(url)
        else if typeof urls is 'string'
            promise.push kit.download getRealUrl(urls)
        else
            for url, fpath of urls
                promise.push kit.download getRealUrl(url), fpath
        Promise.all promise

kit.pull = ()->

module.exports = kit
