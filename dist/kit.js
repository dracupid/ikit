var download, isDir, nokit, path;

nokit = require('nokit');

path = require('./path');

isDir = function(path) {
  return path[path.length - 1] === '/';
};

download = function(url, fpath, opts) {
  var fileName;
  if (opts == null) {
    opts = {};
  }
  if (l_.isObject(fpath)) {
    opts = fpath;
    fpath = null;
  }
  l_.defaults(opts, {
    processor: function(a) {
      return a;
    }
  });
  fileName = path.basename(url);
  if (fpath == null) {
    fpath = path.join(process.cwd(), fileName);
  }
  if (isDir(fpath)) {
    fpath = path.join(fpath, fileName);
  }
  return nokit.request(url).then(function(data) {
    return fs.outputFile(fpath, opts.processor(data));
  });
};

module.exports = {
  download: download
};
