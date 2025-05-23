# Common Patterns

This document covers common patterns and best practices in ProcessWire development.

## Template Organization

### Basic Template Structure
```php
<?php namespace ProcessWire;

// Template file: basic-page.php
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= $page->title ?> - <?= $page->rootParent->title ?></title>
    <link rel="stylesheet" href="<?= $config->urls->templates ?>css/styles.css">
</head>
<body>
    <?php include('./_header.php') ?>
    
    <main class="content">
        <h1><?= $page->title ?></h1>
        
        <?php if($page->body): ?>
            <div class="body">
                <?= $page->body ?>
            </div>
        <?php endif; ?>
    </main>
    
    <?php include('./_footer.php') ?>
    
    <script src="<?= $config->urls->templates ?>js/scripts.js"></script>
</body>
</html>
```

## Reusable Components

### Include Files
```php
// _header.php
<header class="header">
    <nav class="main-nav">
        <?php
        $home = $pages->get('/');
        $items = $home->children();
        
        foreach($items as $item) {
            $class = $item->id == $page->rootParent->id ? 'active' : '';
            echo "<a href='{$item->url}' class='$class'>{$item->title}</a>";
        }
        ?>
    </nav>
</header>
```

### Template Inheritance
```php
// _main.php (base template)
<!DOCTYPE html>
<html>
<head>
    <title><?= $page->title ?></title>
    <?= $this->section('head') ?>
</head>
<body>
    <?= $this->section('content') ?>
    <?= $this->section('scripts') ?>
</body>
</html>

// blog-post.php
<?php namespace ProcessWire;

// Set the template to use
$view->setLayout('./_main.php');

// Set content for sections
$view->set('head', "<link rel='stylesheet' href='/css/blog.css'>");

$view->start('content');
?>
<article>
    <h1><?= $page->title ?></h1>
    <div class="content">
        <?= $page->body ?>
    </div>
</article>
<?php
$view->end();
?>
```

## Advanced Selectors

### Complex Queries
```php
// Find pages with multiple conditions
$products = $pages->find("template=product, 
    (price>100, price<500), 
    featured=1, 
    sort=-created, 
    limit=12");

// Find by date range
$start = strtotime('first day of this month');
$end = strtotime('last day of this month');
$events = $pages->find("template=event, 
    date>=$start, 
    date<=$end, 
    sort=date");

// Find with custom fields
$featuredProducts = $pages->find("template=product, 
    featured_until>=" . time() . ", 
    sort=title");
```

## Working with Files

### File Uploads
```php
// Handle file upload
if($input->post->submit) {
    if($user->isLoggedin()) {
        $file = $input->files->file;
        if($file['error'] == 0) {
            $ext = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));
            $basename = $sanitizer->pageName($file['name'], true);
            $filename = $basename . '.' . $ext;
            $path = $config->paths->assets . 'uploads/' . $filename;
            
            if(move_uploaded_file($file['tmp_name'], $path)) {
                // File uploaded successfully
                $message = "File uploaded: $filename";
            }
        }
    }
}

// Display form
?>
<form method='post' enctype='multipart/form-data'>
    <input type='file' name='file'>
    <button type='submit' name='submit'>Upload</button>
</form>
<?php if(isset($message)) echo "<p>$message</p>"; ?>
```

## Caching

### Page Caching
```php
// Enable template caching
echo "<!-- This content is cached -->";
$cache = $modules->get('MarkupCache');
$cacheName = "recent_products";

if(!$content = $cache->get($cacheName, 3600)) { // Cache for 1 hour
    $products = $pages->find("template=product, limit=6, sort=-created");
    ob_start();
    ?>
    <div class='product-grid'>
        <?php foreach($products as $product): ?>
            <div class='product'>
                <h3><?= $product->title ?></h3>
                <?php if($product->image): ?>
                    <img src='<?= $product->image->size(300,200)->url ?>' alt='<?= $product->title ?>'>
                <?php endif; ?>
            </div>
        <?php endforeach; ?>
    </div>
    <?php
    $content = ob_get_clean();
    $cache->save($content);
}

echo $content;
```

## Security

### Secure File Access
```php
// Serve files securely
$file = $sanitizer->filename($input->get->file);
$path = $config->paths->files . $file;

if(file_exists($path) && strpos(realpath($path), $config->paths->files) === 0) {
    // Check if user has permission
    if($user->hasPermission('download-files')) {
        header('Content-Type: ' . mime_content_type($path));
        header('Content-Disposition: attachment; filename="' . basename($path) . '"');
        readfile($path);
        exit;
    } else {
        throw new Wire404Exception('Access denied');
    }
} else {
    throw new Wire404Exception('File not found');
}
```

## Performance Optimization

### Lazy Loading
```php
// Lazy load images
$products = $pages->find("template=product, limit=12");

foreach($products as $product) {
    echo "<div class='product'>";
    echo "<h3>{$product->title}</h3>";
    if($product->image) {
        $thumb = $product->image->size(400, 300);
        echo "<img src='data:image/svg+xml;base64,PHN2ZyB3aWR0aD0nNDAwJyBoZWlnaHQ9JzMwMCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJz48L3N2Zz4=' 
             data-src='{$thumb->url}'
             class='lazyload' 
             alt='{$product->title}'>";
    }
    echo "</div>";
}

// Add lazysizes.js to your footer
$this->config->scripts->add('https://cdnjs.cloudflare.com/ajax/libs/lazysizes/5.3.2/lazysizes.min.js');
```

### Batch Processing
```php
// Process large numbers of pages in batches
$total = $pages->count("template=product");
$limit = 100;
$processed = 0;

while($processed < $total) {
    $products = $pages->find("template=product, start=$processed, limit=$limit");
    
    foreach($products as $product) {
        // Process each product
        $product->of(false);
        $product->processed = 1;
        $product->save();
        $processed++;
    }
    
    // Clear memory
    $pages->uncacheAll();
    
    // Optional: Add delay to reduce server load
    if(function_exists('usleep')) usleep(10000); // 10ms
}
```
