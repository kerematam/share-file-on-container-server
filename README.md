# share-file-on-container-server
Script to share file and folder using docker httpd container.

Script creates simple container having http server on random port mounting given file or folder to http root directory; so that you can access this file in given URL. It kills container after 150 seconds. 

Script detects external IP of your server automatically. Port is assigned randomly by docker command.

Example usage

./share-file.sh test.txt

 Share URL is : http://95.85.53.174:32799/test.txt
 
 Container will be killed in 148

 
