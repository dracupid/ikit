require('es6-promise').polyfill();

module.exports = {
  promisify: function(fn, self) {
    return function() {
      var args;
      args = Array.prototype.slice.call(arguments);
      if (l_.isFunction(args[args.length - 1])) {
        return fn.apply(self, args);
      }
      return new Promise(function(resolve, reject) {
        args.push(function(err, rs) {
          if (err) {
            return reject(err);
          } else {
            return resolve(rs);
          }
        });
        return fn.apply(self, args);
      });
    };
  }
};
