isType = (val, typeName)->
    Object::toString.call(val) is "[object #{typeName}]"

module.exports =
    defaults: (tar, def)->
        for k of def
            tar[k] is undefined and tar[k] = def[k]
        tar

    assign: (tar, srcs)->
        Array::reduce.call arguments, (tar, src)->
            Object.keys(Object(src)).reduce (tar, k)->
                tar[k] = src[k];
                tar
            , tar

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
