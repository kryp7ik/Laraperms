# Laraperms
A simple bash script to apply file/folder permissions to a Laravel 5.x website

**How to use:**

Option A: You can run this as a simple bash script such as:
```bash
$ bash laraperms.sh /var/www/mysite.com
```

Option B: Copy script to /usr/bin for global usage
```bash
$ sudo mv laraperms.sh /usr/bin/laraperms
$ sudo chmod +x /usr/bin/laraperms
$ laraperms /var/www/mysite.com
```

- You can either specify the path to the root folder of the project as an argument such as....
- `$ laraperms /var/www/mysite.com/`
- Or if no argument is specified you have the option to use the current working directory                                    
- This script will do the following.....

 > -Chown the directory as the following USER:www-data
 
 > -Apply 644 to files
 
 > -Apply 755 to directories
 
 > -Apply write and execute permissions to /path/to/site/storage & /path/to/site/bootstrap/cache
 
- NOTE: Script does not use "sudo".  You should make sure your user owns the directory you are trying to run this program on.
- If your getting a permission error use "sudo chown -R YOURUSER:www-data /path/to/site" before using this script.
