# Basic Usage Examples

This document provides fundamental examples of working with ProcessWire.

## Page Operations

### Create a New Page
```php
// Create a new page
$p = new Page();
$p->template = 'basic-page';
$p->parent = $pages->get('/products/');
$p->title = 'New Product';
$p->save();
```

### Update a Page
```php
// Update an existing page
$p = $pages->get('/about/');
$p->of(false); // Turn off output formatting
$p->title = 'Updated Title';
$p->save();
```

### Delete a Page
```php
// Delete a page
$p = $pages->get('/old-page/');
if($p->id) {
    $pages->delete($p);
}
```

## Finding Pages

### Basic Find
```php
// Find all pages with template 'blog-post'
$posts = $pages->find("template=blog-post, sort=-date");

// Output results
foreach($posts as $post) {
    echo "<h2>{$post->title}</h2>";
    echo $post->summary;
}
```

### Advanced Selectors
```php
// Find with multiple conditions
$products = $pages->find("template=product, price>100, featured=1, sort=title");

// Find by date
$recent = $pages->find("template=news, created>today-1week, sort=-created");

// Find with pagination
$perPage = 10;
$start = ($input->pageNum - 1) * $perPage;
$items = $pages->find("template=item, limit=$perPage, start=$start");
```

## Working with Fields

### Basic Field Access
```php
// Get field values
$title = $page->title;
$body = $page->get('body');

// Check if field has value
if($page->images) {
    // Do something with images
}
```

### Images
```php
// Single image
$image = $page->image;
if($image) {
    echo "<img src='{$image->size(400,300)->url}' alt='{$image->description}'>";
}

// Multiple images
if($page->images->count()) {
    foreach($page->images as $img) {
        echo "<img src='{$img->size(200,200)->url}' alt='{$img->description}'>";
    }
}
```

### Page References
```php
// Single page reference
$author = $page->author;
echo "Author: {$author->title}";

// Multiple page references
$related = $page->related_products;
foreach($related as $product) {
    echo $product->title;
}
```

## Forms

### Basic Form
```php
// Process form submission
if($input->post->submit) {
    $name = $sanitizer->text($input->post->name);
    $email = $sanitizer->email($input->post->email);
    
    // Validate
    $errors = [];
    if(empty($name)) $errors[] = 'Name is required';
    if(!$email) $errors[] = 'Valid email is required';
    
    if(!count($errors)) {
        // Process form
        $p = new Page();
        $p->template = 'contact-submission';
        $p->parent = $pages->get('/contact/submissions/');
        $p->title = $name;
        $p->email = $email;
        $p->message = $sanitizer->textarea($input->post->message);
        $p->save();
        
        // Redirect to thank you page
        $session->redirect('/thank-you/');
    }
}

// Display form
?>
<?php if(isset($errors) && count($errors)): ?>
    <div class="errors">
        <?php foreach($errors as $error): ?>
            <p><?= $error ?></p>
        <?php endforeach; ?>
    </div>
<?php endif; ?>

<form method='post' action='./'>
    <p>
        <label>Name: <input type='text' name='name' value='<?= $input->post->name ?>'></label>
    </p>
    <p>
        <label>Email: <input type='email' name='email' value='<?= $input->post->email ?>'></label>
    </p>
    <p>
        <label>Message: <textarea name='message'><?= $input->post->message ?></textarea></label>
    </p>
    <p>
        <button type='submit' name='submit' value='1'>Send</button>
    </p>
</form>
<?php
```

## Navigation

### Simple Navigation
```php
// Basic navigation
$home = $pages->get('/');
$items = $home->children();

foreach($items as $item) {
    $class = $item->id == $page->rootParent->id ? 'active' : '';
    echo "<li class='$class'><a href='{$item->url}'>{$item->title}</a></li>";
}
```

### Breadcrumbs
```php
// Breadcrumbs
$breadcrumbs = $page->parents();
foreach($breadcrumbs as $crumb) {
    echo "<a href='{$crumb->url}'>{$crumb->title}</a> &raquo; ";
}
echo $page->title;
```

## Pagination

### Basic Pagination
```php
// Find pages with pagination
$limit = 10;
$start = ($input->pageNum - 1) * $limit;
$items = $pages->find("template=blog-post, sort=-date, limit=$limit, start=$start");

// Output items
foreach($items as $item) {
    echo "<h2><a href='{$item->url}'>{$item->title}</a></h2>";
    echo $item->summary;
}

// Render pagination
$pagination = $items->renderPager([
    'nextItemLabel' => 'Next',
    'previousItemLabel' => 'Prev',
    'listMarkup' => "<ul class='pagination'>{out}</ul>",
    'itemMarkup' => "<li class='{class}'>{out}</li>",
    'linkMarkup' => "<a href='{url}'><span>{out}</span></a>"
]);
echo $pagination;
```
