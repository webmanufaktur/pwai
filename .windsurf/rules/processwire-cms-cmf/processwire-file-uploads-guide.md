---
trigger: manual
description: A guide to robustly handling file and image uploads in ProcessWire, especially for AJAX/API endpoints.
---

# Guide: ProcessWire File/Image Uploads (API/AJAX)

Key code patterns for handling file/image uploads in ProcessWire hooks or modules, especially for AJAX.

## 1. Setup & API Variables

```php
// In your hook/module:
/** @var WireInput $input */ $input = $this->wire('input');
/** @var User $user */ $user = $this->wire('user');
/** @var Session $session */ $session = $this->wire('session');
/** @var Sanitizer $sanitizer */ $sanitizer = $this->wire('sanitizer');
/** @var Wire $wire */ $wire = $this->wire;

// Basic security: _handlePostRequestOnly($input, $wire); _requireUserLogin($user, $wire); etc.
```

## 2. Core Upload Steps

### 2.1. Initial Page Save (No Files Yet)

```php
$p = new Page();
$p->of(false); // CRITICAL! Prevents formatting issues.

$p->template = 'your_template';
$p->parent = 1234; // Parent ID
$p->title = $sanitizer->text($input->post->title);
// ... set other non-file fields ...

if (!$p->save()) {
    $wire->log->save('api-errors', "Initial page save failed: {$p->title}");
    // Return JSON error & exit
}
// $p->id is now available.
```

### 2.2. Temp Directory for Uploads

```php
$tempDir = $wire->config->paths->assets . 'temp/';
if (!is_dir($tempDir) && !@wireMkdir($tempDir, ['recursive' => true])) {
    $wire->log->save('api-errors', "Failed to create temp dir: $tempDir");
    // Return JSON error & exit (or use goto to skip file processing)
}
```

### 2.3. Process `$_FILES` & Add to Page Object

```php
$fileErrors = [];
$atLeastOneFileUploaded = false;
$fileField = 'your_file_input_name'; // e.g., 'documents' or 'images'

if (!empty($_FILES[$fileField]['name'][0]) && $_FILES[$fileField]['error'][0] !== UPLOAD_ERR_NO_FILE) {
    foreach ($_FILES[$fileField]['name'] as $key => $name) {
        if ($_FILES[$fileField]['error'][$key] === UPLOAD_ERR_OK) {
            $tmp_name = $_FILES[$fileField]['tmp_name'][$key];
            $sanitized_name = $p->id . '_' . $sanitizer->filename($name); // Basic sanitization
            $destination_path = $tempDir . $sanitized_name;

            if (@move_uploaded_file($tmp_name, $destination_path)) {
                try {
                    // For File fields: $p->files->add($destination_path);
                    // For Image fields: $p->images->add($destination_path); (validate extension first)
                    $p->{$p->fields->get($fileField)->name}->add($destination_path); // Generic way
                    
                    $atLeastOneFileUploaded = true;
                    @unlink($destination_path); // Clean up temp file
                } catch (\Exception $e) {
                    $fileErrors[] = "Add file error '{$sanitized_name}': {$e->getMessage()}";
                    @unlink($destination_path);
                    $wire->log->save('api-errors', "PW add file error: {$p->id}, {$sanitized_name}, {$e->getMessage()}");
                }
            } else {
                $fileErrors[] = "Move file error '{$sanitized_name}': " . _mapUploadError($_FILES[$fileField]['error'][$key]);
                $wire->log->save('api-errors', "Move_uploaded_file error: {$sanitized_name}, PHP Error: " . $_FILES[$fileField]['error'][$key]);
            }
        } elseif ($_FILES[$fileField]['error'][$key] !== UPLOAD_ERR_NO_FILE) {
            $fileErrors[] = "Upload error '{$name}': " . _mapUploadError($_FILES[$fileField]['error'][$key]);
        }
    }
}
```

### 2.4. Save the Specific File/Image Field

```php
if ($atLeastOneFileUploaded && empty($fileErrors)) {
    if (!$p->save($p->fields->get($fileField)->name)) { // Save only the specific field
        $fileErrors[] = "Error saving '{$fileField}' field.";
        $wire->log->save('api-errors', "Failed to save '{$fileField}' field for page {$p->id}");
    }
}
```

## 3. Error Handling & JSON Response

*   **Map PHP Upload Errors**: Create a helper `_mapUploadError($errorCode)`.
*   **Use `@` Judiciously**: For filesystem functions if already checking return status & logging, to prevent warnings breaking JSON.
*   **Clean JSON Output**:
    ```php
    $response = [
        'success' => empty($fileErrors) && empty($otherPageErrors),
        'message' => empty($fileErrors) ? 'Success!' : 'Error: ' . implode('; ', $fileErrors),
        'page_id' => $p->id ?? null
    ];
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode($response);
    exit;
    ```

## 4. Critical Reminders

*   **`$p->of(false);`**: Essential. Call immediately after `new Page()`.
*   **`$wire->config`**: Use property access (not `$wire('config')`).
*   **Permissions**: `site/assets/temp/` and `site/assets/files/` must be writable.
*   **JSON Debugging**: `Unexpected token '<'` means PHP outputting HTML (errors/warnings). Check `site/assets/logs/errors.txt`.

This condensed guide provides the core code patterns for robust ProcessWire file uploads.
