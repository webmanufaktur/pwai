# $files API Variable

The `$files` API variable provides file system operations in ProcessWire.

## Overview

- **Type**: `WireFileTools`
- **Purpose**: File system operations and file management
- **Availability**: Always available in templates and modules

## Basic File Operations

### Checking Files
```php
// Check if file exists
if($files->exists('/path/to/file.txt')) {
    // File exists
}

// Get file size in bytes
$size = $files->size('/path/to/file.txt');

// Get file modification time
$mtime = $files->mtime('/path/to/file.txt');
```

### Reading Files
```php
// Read entire file
$content = $files->fileGetContents('/path/to/file.txt');

// Read file into array of lines
$lines = $files->file('/path/to/file.txt');

// Include a PHP file
$result = $files->include('/path/to/script.php', [
    'var1' => 'value1',
    'var2' => 'value2'
]);
```

### Writing Files
```php
// Write content to file
$result = $files->filePutContents('/path/to/file.txt', 'Hello World');

// Append to file
$result = $files->filePutContents('/path/to/file.txt', 'New line\n', FILE_APPEND);

// Create a temporary file
$tempFile = $files->tempfile('/path/to/dir/', 'prefix_');
```

## Directory Operations

### Creating Directories
```php
// Create a directory
$success = $files->mkdir('/path/to/new/directory');

// Create directory recursively
$success = $files->mkdir('/path/to/new/directory', true);

// Create with specific permissions
$success = $files->mkdir('/path/to/new/directory', true, 0755);
```

### Reading Directories
```php
// Get all files in directory
$allFiles = $files->find('/path/to/dir/');

// Get files matching pattern
$phpFiles = $files->find('/path/to/dir/', [
    'extensions' => ['php'],
    'recursive' => 1
]);

// Get directories only
$dirs = $files->find('/path/to/dir/', [
    'type' => 'dir'
]);
```

### Removing Directories
```php
// Remove empty directory
$success = $files->rmdir('/path/to/empty/dir');

// Remove directory recursively
$success = $files->rmdir('/path/to/dir', true);
```

## File Uploads

### Handling Uploads
```php
// Check if file was uploaded
if($files->uploaded('file_field')) {
    $upload = $files->upload('file_field', '/path/to/upload/dir/');
    if($upload) {
        // File uploaded successfully
        $filename = $upload;
    }
}

// With custom filename
$upload = $files->upload('file_field', '/path/to/upload/dir/', 'custom-name.jpg');
```

### File Validation
```php
// Validate upload
$valid = $files->validateUpload('file_field', [
    'maxFiles' => 1,
    'maxSize' => '2M',
    'overwrite' => false,
    'extensions' => ['jpg', 'jpeg', 'png', 'gif']
]);

if($valid) {
    $upload = $files->upload('file_field', '/path/to/upload/dir/');
}
```

## File Paths

### Path Manipulation
```php
// Normalize path
$path = $files->normalizePath('/var/www//site//templates///file.txt');

// Make path relative to site root
$relative = $files->unixPath('/var/www/site/templates/file.txt');

// Get file extension
$ext = $files->extname('document.pdf');

// Get filename without extension
$name = $files->filename('/path/to/document.pdf');
```

## File Permissions

### Setting Permissions
```php
// Set file permissions
$success = $files->chmod('/path/to/file.txt', 0644);

// Set directory permissions recursively
$success = $files->chmod('/path/to/dir', 0755, true);
```

## File Compression

### Creating Archives
```php
// Create ZIP archive
$zipFile = $files->zip('/path/to/archive.zip', [
    '/path/to/file1.txt',
    '/path/to/file2.jpg'
]);

// Create ZIP from directory
$zipFile = $files->zip('/path/to/archive.zip', '/path/to/dir/');
```

### Extracting Archives
```php
// Extract ZIP archive
$files->unzip('/path/to/archive.zip', '/path/to/extract/dir/');
```

## File Hashing

### Generating Hashes
```php
// Get file hash
$hash = $files->hash('/path/to/file.txt', 'sha256');

// Get file hash of contents
$contentHash = $files->hashData('some content', 'md5');
```

## Best Practices

1. **Security**
   - Always validate file uploads
   - Use proper file permissions
   - Sanitize file paths

2. **Error Handling**
   - Check return values of file operations
   - Use try/catch for critical operations

3. **Performance**
   - Use file caching when appropriate
   - Minimize file operations in loops

## Common Use Cases

### File Upload Handler
```php
function handleFileUpload($fieldName, $uploadDir) {
    $files = wire('files');
    
    if(!$files->uploaded($fieldName)) {
        return ['success' => false, 'error' => 'No file uploaded'];
    }
    
    $valid = $files->validateUpload($fieldName, [
        'maxFiles' => 1,
        'maxSize' => '5M',
        'extensions' => ['jpg', 'jpeg', 'png', 'pdf']
    ]);
    
    if(!$valid) {
        return ['success' => false, 'error' => 'Invalid file'];
    }
    
    $filename = $files->upload($fieldName, $uploadDir);
    
    if($filename) {
        return [
            'success' => true,
            'filename' => $filename,
            'path' => $uploadDir . $filename
        ];
    }
    
    return ['success' => false, 'error' => 'Upload failed'];
}
```

### Recursive Directory Copy
```php
function copyDirectory($source, $destination) {
    $files = wire('files');
    
    if(!is_dir($source)) return false;
    
    if(!is_dir($destination)) {
        $files->mkdir($destination, true);
    }
    
    $dir = opendir($source);
    
    while(($file = readdir($dir)) !== false) {
        if($file != '.' && $file != '..') {
            $srcFile = $source . '/' . $file;
            $destFile = $destination . '/' . $file;
            
            if(is_dir($srcFile)) {
                copyDirectory($srcFile, $destFile);
            } else {
                copy($srcFile, $destFile);
            }
        }
    }
    
    closedir($dir);
    return true;
}
```

### Finding Files by Content
```php
function findInFiles($directory, $searchTerm) {
    $files = wire('files');
    $found = [];
    
    $allFiles = $files->find($directory, [
        'extensions' => ['php', 'html', 'txt', 'md'],
        'recursive' => 10
    ]);
    
    foreach($allFiles as $file) {
        $content = $files->fileGetContents($file);
        if(strpos($content, $searchTerm) !== false) {
            $found[] = $file;
        }
    }
    
    return $found;
}
```

## Configuration

### File Settings in config.php
```php
// File upload settings
$config->fileContentTypes = [
    'jpg' => 'image/jpeg',
    'jpeg' => 'image/jpeg',
    'gif' => 'image/gif',
    'png' => 'image/png',
    'pdf' => 'application/pdf'
];

// Maximum upload size
$config->maxUploadSize = '10M';

// Allowed file extensions
$config->uploadExtensions = 'jpg jpeg gif png pdf doc docx xls xlsx';

// Secure file upload settings
$config->uploadBadExtensions = 'php phar phtml php3 php4 php5 php7 php8 pl py cgi exe';
```

### File Permissions
```php
// Default file permissions
$config->chmodFile = '0664';
$config->chmodDir = '0775';
```

### File Upload Security
```php
// Disable PHP execution in upload directories
$config->uploadBadExtensions = array_merge(
    $config->uploadBadExtensions,
    ['php', 'phar', 'phtml', 'php3', 'php4', 'php5', 'php7', 'php8', 'pl', 'py', 'cgi']
);

// Disable .htaccess files in uploads
$config->uploadBadFiles = array_merge(
    $config->uploadBadFiles,
    ['.htaccess', '.htpasswd', '.gitignore']
);
```
