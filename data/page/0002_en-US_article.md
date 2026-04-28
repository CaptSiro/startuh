# Installing a Chrome Extension: A Step-by-Step Guide

Installing a Chrome extension requires not only the typical steps in the browser but also setting up a PHP and MySQL environment to support its functionality. This article outlines the necessary steps to install the Startuh Chrome extension, ensuring that both the server-side environment and client-side interface are correctly configured.

## Setting Up the Environment

Before proceeding with the extension installation, it is crucial to prepare your PHP and MySQL environment. Follow these steps to establish a proper server setup:

### 1. Install and Setup PHP and MySQL

Ensure you have PHP and MySQL installed on your system. You can use solutions like XAMPP or MAMP for an easier installation process. Once installed, confirm that both services are running.

### 2. Download the Repository

Next, download the Startuh repository from GitHub. Execute the following command in your terminal or command prompt:

```shell  
git clone https://github.com/CaptSiro/startuh.git  
```  

Place the downloaded repository in your PHP directory (typically `htdocs` for XAMPP or `www` for MAMP).

### 3. Edit the .htaccess File

Navigate to the project's root directory and locate the `.htaccess` file. If it does not exist, create a new file named `.htaccess`. Insert the following code into the file to rewrite the URL correctly:

```apache  
<IfModule mod_rewrite.c>  
  Options -Indexes  
  RewriteEngine on  
  RewriteRule (.*) /startuh/index.php [QSA,END]  
</IfModule>  
```  

This configuration ensures that requests are routed through `index.php` correctly.

## Configuration Steps

### 4. Create and Edit the .env File

In the root directory of the project, create a file named `.env` and add the following entries:

```
PROJECT=Startuh
PROJECT_AUTHOR=CaptSiro
PROJECT_AUTHOR_LINK=https://github.com/CaptSiro

LANGUAGE=en-US
DOMAIN_URL=http://localhost/startuh

DATABASE_HOST=127.0.0.1
DATABASE_NAME=startuh
DATABASE_USER=root
DATABASE_PASSWORD=

ADMIN_LOGIN_PASSWORD=root

OPENAI_KEY=api-key
OPENAI_MODEL=gpt-4o-mini
```

Modify the placeholder value `api-key` with your actual OpenAI API key, and make any necessary changes to the database configurations based on your setup.

### 5. Edit the extension/index.html Path

Open the file located at `extension/index.html`, and update the `iframe` source URL as follows:

```html
iframe src="http://localhost/startuh/extension"
```  

This modification points the extension to the correct endpoint for loading its content.

## Loading the Extension

### 6. Load Unpacked Extension

Navigate to Chrome and open the Extensions page (chrome://extensions). Enable "Developer mode" in the top right corner, then click on "Load unpacked" and select the path to `repo-root-dir/extension`. This action loads the extension into your browser for testing.

### 7. Log into the Admin Dashboard

Access the admin dashboard using your browser. The login credentials use the `ADMIN_LOGIN_PASSWORD` value set in your `.env` file. For default setups, this would be:
- Username: root  
- Password: root 

### 8. Update System Settings

After logging in, navigate to the System Settings within the dashboard. Look for the variable `startuh:background_directory_os` and edit it to include the desired paths. Only a semicolon (;) should be used as a separator, with no spaces around it.

## Conclusion

Following the outlined steps will ensure a successful installation of the Startuh Chrome extension along with the necessary backend setup. Proper configuration of the PHP environment, database settings, and extension paths is critical for the extension's functionality. By adhering to this structured process, users can effectively deploy and manage the extension.