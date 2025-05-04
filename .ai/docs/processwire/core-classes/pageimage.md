# Pageimage

**ProcessWire Core Class**

- [Official Docs](https://processwire.com/api/ref/pageimage/)

## Overview

`Pageimage` represents a single image attached to a Page field, including image-specific methods.

## Usage

```php
foreach($page->images as $image) {
    echo $image->url;
}
```

## Common Methods
- `size($width, $height)`: Get a resized version of the image.
- `url`: The image URL.

## See Also
- [Pageimages](./pageimages-class.md)
