require 'colors'
colors = require('colors/safe')
global._ = global.l_ = global.lodash = require 'lodash'

nokit = require 'nokit'
nokit.require 'url'
global.fs = nokit.fs

promise = require './promise'
kit = require './kit'

# io.js lib
path = require './path'
url = nokit.url


module.exports = _.assign {}, kit, promise, {
    kit: nokit
    fs
    colors
    path
    url
    _: global.lodash
}
