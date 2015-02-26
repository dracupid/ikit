ikit
=================

A wilful node toolkit.

[![Dependency Status](https://david-dm.org/dracupid/ikit.svg?style=flat)](https://david-dm.org/dracupid/ikit)
[![devDependency Status](https://david-dm.org/dracupid/ikit/dev-status.svg)](https://david-dm.org/dracupid/ikit#info=devDependencies)


##API





- #### <a href="lib/kit.coffee?source#L40" target="_blank"><b>kit.hashFile</b></a>
  [hashFile description]

  - **<u>param</u>**: `fileName` { _[type]_ }

    [description]

  - **<u>return</u>**: { _[type]_ }

    [description]

- #### <a href="lib/kit.coffee?source#L90" target="_blank"><b>kit.download</b></a>
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

- #### <a href="lib/kit.coffee?source#L117" target="_blank"><b>kit.init</b></a>
  init `ikit.cson` file

  - **<u>param</u>**: `ext` { _string='.cson'_ }

    extname of ikit file

  - **<u>return</u>**: { _Promise_ }

- #### <a href="lib/kit.coffee?source#L137" target="_blank"><b>kit.clone</b></a>
  [clone description]

  - **<u>param</u>**: `update` { _[type]=false_ }

    [description]

  - **<u>return</u>**: { _[type]_ }

    [description]

- #### <a href="lib/kit.coffee?source#L158" target="_blank"><b>kit.pull</b></a>
  [pull description]

  - **<u>return</u>**: { _[type]_ }

    [description]



## License
MIT
