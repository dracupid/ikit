ikit
=================

A wilful node toolkit.

[![Dependency Status](https://david-dm.org/dracupid/ikit.svg?style=flat)](https://david-dm.org/dracupid/ikit)
[![devDependency Status](https://david-dm.org/dracupid/ikit/dev-status.svg)](https://david-dm.org/dracupid/ikit#info=devDependencies)


##API


- #### <a href="lib/index.coffee?source#L7" target="_blank"><b>global.\_ (alias: l_, lodash ) </b></a>
  lodash

- #### <a href="lib/index.coffee?source#L14" target="_blank"><b>global.fs</b></a>
  [nofs](https://github.com/ysmood/nofs)

- #### <a href="lib/index.coffee?source#L27" target="_blank"><b>colors</b></a>
  colors/safe

- #### <a href="lib/index.coffee?source#L31" target="_blank"><b>kit</b></a>
  [nokit](https://github.com/ysmood/nokit)

- #### <a href="lib/index.coffee?source#L35" target="_blank"><b>path</b></a>
  io.js path lib

- #### <a href="lib/index.coffee?source#L39" target="_blank"><b>url</b></a>
  io.js url lib




- #### <a href="lib/kit.coffee?source#L19" target="_blank"><b>download</b></a>
  Download file by url

  - **<u>param</u>**: `url` { _string_ }

    link url

  - **<u>param</u>**: `fpath` { _string_ }

    file path to write data, directory should end with `/`

  - **<u>param</u>**: `opts` { _Object_ }

    options

  - **<u>return</u>**: { _Promise_ }

  - **<u>option</u>**: 

    processor process data before writing to file

  - **<u>example</u>**: 

    ```javascript
    download('http://zeptojs.com/zepto.js', './lib')
    ```







- #### <a href="lib/promise.coffee?source#L5" target="_blank"><b>global.Promise</b></a>
  es6 Promise Object

- #### <a href="lib/promise.coffee?source#L14" target="_blank"><b>promisify</b></a>
  promisify a function with callback

  - **<u>param</u>**: `fn` { _Function_ }

    Function

  - **<u>param</u>**: `self` { _Object_ }

    this object

  - **<u>return</u>**: { _Function_ }

    promisified function



## License
MIT
