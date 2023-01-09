# ansible-ojs-mysql

This is an ansible configuration of the Open Journal System (OJS) software with MySQL database.



Prerequisites
-----------------------
Vagrant and virtualbox are both essential and can be easily installed on ubuntu/debian like distro:

	sudo apt-get install virtualbox && sudo apt-get install vagrant
   
Installation && Running
-----------------------

Do a git clone of the project:

	git clone https://github.com/dcc6fvo/ansible-ojs-mysql

Access the newly created folder with the git clone command and type the following command:

	vagrant up

To forcible destroy all the configurations:

	vagrant detroy -f
  
 **IMPORTANT!Your SSL key's must be placed in the folder: keys/ssl** 
