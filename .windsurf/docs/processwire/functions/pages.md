# pages()

**ProcessWire Functions-API Function**

- [Official Docs](https://processwire.com/api/ref/pages/)

## Overview

`pages()` is a shorthand function to get the Pages API object, same as `$pages`.

## Usage

```php
$aboutPage = pages()->get('/about/');
echo $aboutPage->title;
```

## See Also
- [$pages Variable](https://processwire.com/api/ref/pages/)
- [page() Function](./page-function.md)
