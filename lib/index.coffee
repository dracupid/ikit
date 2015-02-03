require 'colors'
colors = require 'colors/safe'
###*
 * lodash
 * @alias l_, lodash
###
global._ = global.l_ = global.lodash = require 'lodash'

nokit = require 'nokit'
nokit.require 'url'
###*
 * [nofs](https://github.com/ysmood/nofs)
###
global.fs = nokit.fs

promise = require './promise'
kit = require './kit'

# io.js lib
path = require './path'
url = nokit.url

module.exports = _.assign {}, kit, promise, {
    ###*
     * colors/safe
    ###
    colors
    ###*
     * [nokit](https://github.com/ysmood/nokit)
    ###
    kit: nokit
    ###*
     * io.js path lib
    ###
    path
    ###*
     * io.js url lib
    ###
    url

    fs
    _: l_
}
