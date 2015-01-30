module.exports =
    defaults: (target, def)->
        Object.keys(Object(def)).reduce (target, key)->
            target[key] ?= def[key];
            target
        , target

    assign: (target, sources)->
        Array::reduce.call arguments, (target, source)->
            Object.keys(Object(source)).reduce (target, key)->
                target[key] = source[key];
                target
            , target
