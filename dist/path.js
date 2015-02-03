var path;

path = (function() {
  try {
    return require('../io/path');
  } catch (_error) {
    return require('path');
  }
})();

module.exports = path;
