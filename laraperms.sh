echo '*************************************************** USAGE *********************************************************************'
echo '* Laraperms is a simple bash script that will apply the recommended file and folder permissions to a Laravel 5.x site         *'
echo '* You can either specify the path to the root folder of the project as an argument such as....                                *'
echo '* $ laraperms /var/www/mysite.com/                                                                                            *'
echo '* Or if no argument is specified you have the option to use the current working directory                                     *'
echo '* This script will do the following.....                                                                                      *'
echo '* - chown the directory as the following USER:www-data                                                                        *'
echo '* - Apply 644 to files                                                                                                        *'
echo '* - Apply 755 to directories                                                                                                  *'
echo '* - Apply write and execute permissions to /path/to/site/storage & /path/to/site/bootstrap/cache                              *'
echo '* NOTE: Script does not use "sudo".  You should make sure your user owns the directory you are trying to run this program on. *'
echo '* If your getting a permission error use "sudo chown -R YOURUSER:www-data /path/to/site" before using this script.            *'
echo '*******************************************************************************************************************************'
if [ "$1" != "" ]; then
	DIR=$1
else
	read -p "Would you like to apply Laravel permissions to the current directory? $PWD (y/n)?" USECURRENT
	if [ $USECURRENT = "y" ]; then
		DIR=$PWD;
	else
		exit
	fi
fi 
read -p "Are you sure you want to apply permissions to: $DIR ? (y/n)" CONFIRM
if [ $CONFIRM = "y" ]; then
	echo "Running chown -R $USER:www-data $DIR"
	chown -R $USER:www-data $DIR
	echo "Applying permissions to files..."
	find $DIR -type f -exec chmod 644 {} \;
	echo "Applying permissions to directories..."
	find $DIR -type d -exec chmod 755 {} \;
	echo "Granting write and execute permissions to $DIR/storage & $DIR/bootstrap/cache"
	chgrp -R www-data $DIR/storage $DIR/bootstrap/cache
	chmod -R ug+rwx $DIR/storage $DIR/bootstrap/cache
	echo "The permissions have been applied to $DIR"
else
	exit
fi
