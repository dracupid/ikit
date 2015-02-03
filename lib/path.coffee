path = do ->
    try
        require '../io/path'
    catch
        require 'path'
module.exports = path
