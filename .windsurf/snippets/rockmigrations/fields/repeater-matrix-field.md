---
title: Repeater Matrix Field
description: Create a matrix/repeater with different block types using RockMigrations
tags: [field, repeater, matrix, rockmigrations]
---

```php
// First define the fields for the matrix blocks
'text_block' => [
  'type' => 'textarea',
  'label' => 'Text Content',
  'tags' => 'MatrixExample',
],

// Then create the matrix field
'content_blocks' => [
  'type' => 'RepeaterMatrix',
  'label' => 'Content Blocks',
  'repeaterAddLabel' => 'Add Block',
  'matrix' => [
    'text' => [
      'label' => 'Text Block',
      'fields' => ['text_block'],
    ],
    'image' => [
      'label' => 'Image Block',
      'fields' => ['image_field'],
    ],
  ],
],
```

**Options:**
- `matrix`: Array of block types, each with label and fields
- `repeaterAddLabel`: Text for the "Add" button
- `tags`: For grouping related fields
