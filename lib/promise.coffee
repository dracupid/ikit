require('es6-promise').polyfill()
###*
 * es6 Promise Object
###
global.Promise

module.exports =
    ###*
     * promisify a function with callback
     * @param  {Function} fn   Function
     * @param  {Object}   self this object
     * @return {Function}       promisified function
    ###
    promisify: (fn, self)->
        ()->
            args = Array::slice.call arguments

            if l_.isFunction args[args.length - 1]
                return fn.apply self, args

            new Promise (resolve, reject)->
                args.push (err, rs)->
                    if err then reject err else resolve rs
                fn.apply self, args
