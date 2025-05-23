# Pageimages

**ProcessWire Core Class**

- [Official Docs](https://processwire.com/api/ref/pageimages/)

## Overview

`Pageimages` represents a collection of images attached to a Page field. Used for managing multiple image uploads.

## Usage

```php
foreach($page->images as $image) {
    // $image is a Pageimage object
}
```

## Common Methods
- `add($image)`: Add an image.
- `delete($image)`: Remove an image.

## See Also
- [Pageimage](./pageimage-class.md)
