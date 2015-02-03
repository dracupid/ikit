var colors, kit, nokit, path, promise, url;

require('colors');

colors = require('colors/safe');


/**
 * lodash
 * @alias l_, lodash
 */

global._ = global.l_ = global.lodash = require('lodash');

nokit = require('nokit');

nokit.require('url');


/**
 * [nofs](https://github.com/ysmood/nofs)
 */

global.fs = nokit.fs;

promise = require('./promise');

kit = require('./kit');

path = require('./path');

url = nokit.url;

module.exports = _.assign({}, kit, promise, {

  /**
   * colors/safe
   */
  colors: colors,

  /**
   * [nokit](https://github.com/ysmood/nokit)
   */
  kit: nokit,

  /**
   * io.js path lib
   */
  path: path,

  /**
   * io.js url lib
   */
  url: url,
  fs: fs,
  _: l_
});
