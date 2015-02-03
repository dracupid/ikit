Particle
=================

A wilful node toolkit.

- colors support
- global
    - Promise: es6-promise
    - \_ or lodash or l_ : lodash
    - fs: nofs
- local
    + colors: colors/safe
    + kit: nokit
    + path: io.js path lib
    + url: io.js url lib

##API





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







- #### <a href="lib/promise.coffee?source#L10" target="_blank"><b>promisify</b></a>
  promisify a function with callback

  - **<u>param</u>**: `fn` { _Function_ }

    Function

  - **<u>param</u>**: `self` { _Object_ }

    this object

  - **<u>return</u>**: { _Function_ }

    promisified function



## License
MIT
