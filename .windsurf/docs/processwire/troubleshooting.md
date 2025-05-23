# Troubleshooting

This guide helps you resolve common issues in ProcessWire.

## Common Issues

### White Screen of Death

**Symptoms:**
- Blank white page
- No error message

**Solutions:**
1. Enable debug mode in `site/config.php`:
   ```php
   $config->debug = true;
   ```
2. Check PHP error logs
3. Increase memory limit in `php.ini`:
   ```
   memory_limit = 256M
   ```
4. Disable all modules and enable one by one

### 404 Errors

**Symptoms:**
- Page not found errors
- Incorrect routing

**Solutions:**
1. Check if page exists in admin
2. Verify template file exists
3. Check `.htaccess` file
4. Rebuild URL segments in Setup > Templates > [Template] > URLs

## Debugging

### Enable Debug Mode
```php
// site/config.php
$config->debug = true;
```

### Debug Bar
```php
// Add to _init.php
if($config->debug) {
    $config->debugIf = true;
    $config->templateCompile = true;
}
```

### Tracy Debugger
1. Install Tracy Debugger module
2. Access debug panel in bottom right
3. Use `bd($var)` for debugging

## Performance Issues

### Slow Page Loads

**Diagnose:**
1. Enable debug mode
2. Check Tracy Debugger's Database tab
3. Look for slow queries

**Solutions:**
1. Add indexes to frequently searched fields
2. Use pagination
3. Enable template caching
4. Use `fields=` to limit loaded fields

### Memory Exhausted

**Solutions:**
1. Increase memory limit in `php.ini`
2. Use `$pages->uncacheAll()` in loops
3. Process large datasets in chunks

## Common Error Messages

### "Call to a member function..."
**Cause:** Accessing method on null
**Fix:** Check if object exists first
```php
if($page->field) {
    echo $page->field->method();
}
```

### "Template file does not exist"
**Cause:** Missing template file
**Fix:** Create template file in `templates/`

### "Field 'field_name' not found"
**Cause:** Field not added to template
**Fix:** Add field to template in admin

## Database Issues

### Connection Errors

**Check:**
1. Database credentials in `site/config.php`
2. Database server is running
3. User has proper permissions

### Table Locking

**Symptoms:**
- Slow queries
- Timeout errors

**Solutions:**
1. Use transactions
2. Optimize queries
3. Check for long-running processes

## Module Issues

### Module Installation Fails

**Check:**
1. File permissions
2. PHP version compatibility
3. Module dependencies

### Module Conflicts

**Diagnose:**
1. Disable all modules
2. Enable one by one
3. Check error logs

## Frontend Issues

### JavaScript Errors

**Debug:**
1. Check browser console
2. Verify jQuery is loaded
3. Check for undefined variables

### CSS Issues

**Check:**
1. File paths
2. Browser cache
3. Specificity of selectors

## Common Fixes

### Clear Cache
```php
// Clear all caches
$cache = $modules->get('MarkupCache');
$cache->deleteAll();

// Clear template cache
$cache->deleteFor($page);
```

### Rebuild Database Schema
1. Go to Setup > Templates > [Template]
2. Click "Check/Repair"
3. Save template

### Check File Permissions
```bash
# Set proper permissions
chmod -R 755 site/assets/
chmod 644 site/config.php
```

## Getting Help

### Resources
1. [ProcessWire Forum](https://processwire.com/talk/)
2. [ProcessWire Docs](https://processwire.com/docs/)
3. [Stack Overflow](https://stackoverflow.com/questions/tagged/processwire)

### When Reporting Issues
1. Include ProcessWire version
2. PHP version
3. Error message
4. Steps to reproduce
5. Relevant code
