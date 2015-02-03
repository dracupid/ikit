var colors, kit, nokit, path, promise, url;

require('colors');

colors = require('colors/safe');

global._ = global.l_ = global.lodash = require('lodash');

nokit = require('nokit');

nokit.require('url');

global.fs = nokit.fs;

promise = require('./promise');

kit = require('./kit');

path = require('./path');

url = nokit.url;

module.exports = _.assign({}, kit, promise, {
  colors: colors,
  kit: nokit,
  path: path,
  url: url,
  fs: fs,
  _: l_
});
