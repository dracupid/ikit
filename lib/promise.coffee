require('es6-promise').polyfill()

module.exports =
    promisify: (fn, self)->
        ()->
            args = Array::slice.call arguments

            if l_.isFunction args[args.length - 1]
                return fn.apply self, args

            new Promise (resolve, reject)->
                args.push (err, rs)->
                    if err then reject err else resolve rs
                fn.apply self, args
