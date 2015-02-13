nokit = require 'nokit'
nokit.require 'colors'

preDefined =
    _: nokit._
    lodash: nokit._
    Promise: nokit.Promise
    FS: nokit.fs
    PATH: nokit.path

nokit._.assign global, preDefined

kit = require './kit'

module.exports = lodash.assign {}, kit, preDefined
