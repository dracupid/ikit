ikit
=================

A wilful node toolkit.

[![Dependency Status](https://david-dm.org/dracupid/ikit.svg?style=flat)](https://david-dm.org/dracupid/ikit)
[![devDependency Status](https://david-dm.org/dracupid/ikit/dev-status.svg)](https://david-dm.org/dracupid/ikit#info=devDependencies)


##API





- #### <a href="lib/kit.coffee?source#L52" target="_blank"><b>getRealUrl</b></a>
  [getRealUrl description]

  - **<u>param</u>**: `url` { _[type]_ }

    [description]

  - **<u>return</u>**: { _[type]_ }

    [description]

  - **<u>example</u>**: 

    github
    - git://drcupid/npm-up/lib/cli.coffee
    - git://drcupid/npm-up/package.json#v1.2.0
    http, https
    - http://zeptojs.com/zepto.js
    [dracupid's res repo](https://github.com/dracupid/res)
    - res://config/coffeelint.json

- #### <a href="lib/kit.coffee?source#L84" target="_blank"><b>kit.download</b></a>
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

- #### <a href="lib/kit.coffee?source#L111" target="_blank"><b>kit.init</b></a>
  init `ikit.cson` file

  - **<u>param</u>**: `ext` { _string='.cson'_ }

    extname of ikit file

  - **<u>return</u>**: { _Promise_ }



## License
MIT
