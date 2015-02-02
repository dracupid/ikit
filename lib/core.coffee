isType = (val, typeName)->
    Object::toString.call(val) is "[object #{typeName}]"

module.exports =
    fn_defaults: (tar, defs)->
        Array::reduce.call arguments, (tar, def)->
            Object.keys(def).reduce (tar, k)->
                (tar[k] is undefined) and tar[k] = def[k]
                tar
            , tar
    defaults: (tar, defs...)->
        for def in defs
            for k, v of def
                (tar[k] is undefined) and tar[k] = v
        tar

    fn_assign: (tar, srcs)->
        Array::reduce.call arguments, (tar, src)->
            Object.keys(src).reduce (tar, k)->
                (src.hasOwnProperty.call src, k) and tar[k] = src[k]
                tar
            , tar
    assign: (tar, srcs...)->
        for src in srcs
            for k, v of src
                (src.hasOwnProperty.call src, k) and tar[k] = v
        tar

    isArray: (arg, duck)->
        unless duck then return Array.isArray arg

        length = arg and arg.length
        (typeof length is 'number') and (0 <= length <= Math.pow(2, 53) - 1)

    isString: (arg)->
        isType arg, 'String'

    isObject: (arg)->
        typeof arg is 'object'

    isFunction: (arg)->
        isType arg, 'Function'

    isUndefined: (arg)->
        arg == undefined

    isRegExp: (arg)->
        arg instanceof RegExp
