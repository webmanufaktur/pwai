# $mail API Variable

The `$mail` API variable provides email sending capabilities in ProcessWire.

## Overview

- **Type**: `WireMail`
- **Purpose**: Sending email messages
- **Availability**: Always available in templates and modules

## Basic Usage

### Sending a Simple Email
```php
$mail = wire('mail');
$mail->to('recipient@example.com')
    ->from('sender@example.com')
    ->subject('Hello World')
    ->body('This is a test email')
    ->send();
```

### Sending HTML Email
```php
$mail->to('recipient@example.com')
    ->from('sender@example.com')
    ->subject('HTML Email')
    ->bodyHTML('<h1>Hello</h1><p>This is HTML content</p>')
    ->send();
```

### Sending to Multiple Recipients
```php
$mail->to([
        'recipient1@example.com' => 'Recipient One',
        'recipient2@example.com' => 'Recipient Two'
    ])
    ->from('sender@example.com')
    ->subject('Multiple Recipients')
    ->body('This email has multiple recipients')
    ->send();
```

## Advanced Usage

### Adding Attachments
```php
$mail->to('recipient@example.com')
    ->from('sender@example.com')
    ->subject('Email with Attachment')
    ->body('Please find attached file')
    ->attach('/path/to/file.pdf', 'document.pdf')
    ->send();
```

### Adding CC and BCC
```php
$mail->to('recipient@example.com')
    ->from('sender@example.com')
    ->cc('cc@example.com')
    ->bcc('bcc@example.com')
    ->subject('Email with CC and BCC')
    ->body('This email has CC and BCC recipients')
    ->send();
```

### Setting Reply-To
```php
$mail->to('recipient@example.com')
    ->from('sender@example.com')
    ->replyTo('reply@example.com', 'Reply Name')
    ->subject('Email with Reply-To')
    ->body('Please reply to the specified address')
    ->send();
```

## Email Templates

### Using Template File
```email
<!-- /site/templates/emails/contact-form.html -->
<h1>New Contact Form Submission</h1>

<p><strong>Name:</strong> <?= $name ?></p>
<p><strong>Email:</strong> <?= $email ?></p>
<p><strong>Message:</strong></p>
<p><?= nl2br(htmlspecialchars($message)) ?></p>
```

```php
$mail->to('admin@example.com')
    ->from($email, $name)
    ->subject('New Contact Form Submission')
    ->bodyHTML(wireRenderFile('emails/contact-form', [
        'name' => $name,
        'email' => $email,
        'message' => $message
    ]))
    ->send();
```

## Error Handling

### Basic Error Handling
```php
try {
    $numSent = $mail->to('recipient@example.com')
        ->from('sender@example.com')
        ->subject('Test Email')
        ->body('This is a test')
        ->send();
        
    if($numSent) {
        echo "Email sent successfully";
    } else {
        echo "Failed to send email";
    }
} catch(\Exception $e) {
    echo "Error: " . $e->getMessage();
}
```

## Configuration

### Email Settings in config.php
```php
// Default email settings
$config->adminEmail = 'admin@example.com';
$config->adminFromEmail = 'noreply@example.com';
$config->adminFromName = 'Website Name';

// SMTP Configuration
$config->wireMail = [
    'from' => 'noreply@example.com',
    'fromName' => 'Website Name',
    'transport' => 'smtp',
    'smtp' => [
        'host' => 'smtp.example.com',
        'port' => 587,
        'encryption' => 'tls',
        'username' => 'username',
        'password' => 'password',
    ]
];
```

### Using Different Mailers

#### PHP mail() Function (Default)
```php
// Uses PHP's mail() function by default
$mail->to('recipient@example.com')
    ->subject('Using PHP mail()')
    ->body('This uses PHP\'s mail() function')
    ->send();
```

#### SMTP Mailer
```php
// Configure SMTP for a single email
$mail->to('recipient@example.com')
    ->from('sender@example.com')
    ->subject('SMTP Email')
    ->body('This is sent via SMTP')
    ->mail([
        'transport' => 'smtp',
        'smtp' => [
            'host' => 'smtp.example.com',
            'port' => 587,
            'encryption' => 'tls',
            'username' => 'username',
            'password' => 'password'
        ]
    ])
    ->send();
```

#### Sendmail
```php
$mail->to('recipient@example.com')
    ->subject('Sendmail Email')
    ->body('This is sent via Sendmail')
    ->mail([
        'transport' => 'sendmail',
        'sendmail' => '/usr/sbin/sendmail -bs'
    ])
    ->send();
```

## Best Practices

1. **Use Proper Headers**
   - Always set From, Reply-To, and other headers
   - Use proper email validation

2. **Error Handling**
   - Always check return value of send()
   - Implement proper error handling

3. **Email Formatting**
   - Always include a text version for HTML emails
   - Use responsive email templates

## Common Use Cases

### Contact Form Handler
```php
// Process contact form submission
if($input->post->submit) {
    $name = $sanitizer->text($input->post->name);
    $email = $sanitizer->email($input->post->email);
    $message = $sanitizer->textarea($input->post->message);
    
    // Validate input
    $errors = [];
    if(empty($name)) $errors[] = 'Name is required';
    if(!$email) $errors[] = 'Valid email is required';
    if(empty($message)) $errors[] = 'Message is required';
    
    if(count($errors) === 0) {
        // Send email
        $mail->to($config->adminEmail)
            ->from($email, $name)
            ->replyTo($email, $name)
            ->subject("Contact from $name")
            ->bodyHTML(wireRenderFile('emails/contact-form', [
                'name' => $name,
                'email' => $email,
                'message' => $message,
                'page' => $page->httpUrl
            ]))
            ->send();
            
        // Send confirmation to user
        $mail->to($email)
            ->from($config->adminFromEmail, $config->adminFromName)
            ->subject('Thank you for contacting us')
            ->bodyHTML(wireRenderFile('emails/contact-confirmation', [
                'name' => $name
            ]))
            ->send();
            
        $session->redirect($page->url . '?sent=1');
    }
}
```

### Email Queue System
```php
// Add email to queue
function queueEmail($to, $subject, $body, $options = []) {
    $defaults = [
        'from' => wire('config')->adminFromEmail,
        'fromName' => wire('config')->adminFromName,
        'replyTo' => '',
        'cc' => [],
        'bcc' => [],
        'attachments' => []
    ];
    
    $options = array_merge($defaults, $options);
    $queue = wire('pages')->get('/emails/queue/');
    
    $p = new Page();
    $p->template = 'email-queue';
    $p->parent = $queue;
    $p->title = $subject;
    $p->to = $to;
    $p->from = $options['from'];
    $p->from_name = $options['fromName'];
    $p->reply_to = $options['replyTo'];
    $p->cc = implode(", ", (array)$options['cc']);
    $p->bcc = implode(", ", (array)$options['bcc']);
    $p->body = $body;
    $p->status = 'pending';
    $p->save();
    
    // Process queue (could be moved to a cron job)
    processEmailQueue();
    
    return $p;
}

// Process queued emails
function processEmailQueue($limit = 10) {
    $queue = wire('pages')->find("template=email-queue, status=pending, limit=$limit");
    $sent = 0;
    
    foreach($queue as $email) {
        try {
            $mail = wire('mail');
            $mail->to($email->to);
            $mail->from($email->from, $email->from_name);
            if($email->reply_to) $mail->replyTo($email->reply_to);
            if($email->cc) $mail->cc(explode(',', $email->cc));
            if($email->bcc) $mail->bcc(explode(',', $email->bcc));
            $mail->subject($email->title);
            $mail->bodyHTML($email->body);
            
            if($mail->send()) {
                $email->status = 'sent';
                $email->save();
                $sent++;
            } else {
                $email->status = 'failed';
                $email->save();
            }
        } catch(\Exception $e) {
            $email->status = 'error';
            $email->error = $e->getMessage();
            $email->save();
        }
    }
    
    return $sent;
}
```

## Troubleshooting

### Common Issues

1. **Emails Not Sending**
   - Check server mail logs
   - Verify SMTP settings if using SMTP
   - Check spam folder

2. **HTML Emails Not Rendering**
   - Ensure Content-Type header is set to text/html
   - Test with a simple HTML email first

3. **Attachments Not Working**
   - Verify file permissions
   - Check file paths are correct

### Debugging
```php
// Enable debug mode
$mail->to('recipient@example.com')
    ->from('sender@example.com')
    ->subject('Debug Email')
    ->body('Debug information')
    ->mail([
        'debug' => true
    ]);

// Get debug information
$debug = $mail->getDebugInfo();
print_r($debug);

// Send the email
$mail->send();
```

## Security Considerations

1. **Input Validation**
   - Always validate and sanitize user input
   - Use ProcessWire's sanitization methods

2. **Email Headers**
   - Prevent header injection
   - Use proper encoding for special characters

3. **Attachments**
   - Validate file types
   - Scan for viruses if possible
   - Set proper permissions
