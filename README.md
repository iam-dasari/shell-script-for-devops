### Linux Commands
```
In Linux
    < means input
    > means output/redirection

1. ssh-keygen -f <file-name> (Generate public & private keys)
2. Path to store Public & Private Keys - /home-directory/.ssh
3. ssh -I test.pem ec2-user@public-ip-address (Connect to an EC2 instance)
4. uname (what is kernel name you are using)
5. ls (list the files/directories)
   - ls -l (lengthy format)
   - ls -lr (lengthy & reverse output)
   - ls -lt (Based on time)
   - ls -ltr (reverse & based on time)
   - d for directory and – means file
   - ls -la (Hidden files/directories)
6. echo $HISTSIZE (will tell what is the limit of size of commands in history)
7. touch (To create an empty file)
8. cat (To create a new file/display the contents of the file)
   - cat >> filename (> means override and >> means append)
   - cat filename
9. cd (Change Directory)
   - cd / (to base location)
   - cd (to home directory)
   - cd .. (to come back to previous path)
10. $ means normal user and # means root user
11. sudo su - (Give root privileges)
12. pwd (present working directory)
13. rm ( files or directories)
    - rm filename
    - rm -rf dir-name (-r means recursively and f means forcibly)
14. cp (copy files/directories)
    - cp -r source destination
15. mv (move files/directories, it is also called rename a file)
    - mv source destination
16. grep (to find the text in a file)
    - cat passwd | grep google (| - pipe output of first command will become input to next command and so on)
    - grep -i <pattern> file (-i means in-case sensitive)
17. head (top 10 lines by default)
    - head <filename>
    - head -n 2 filename
18. tail (last 10 lines by default)
    - tail <filename>
    - tail -n 2 filename
19. wget (download files from internet)
    - wget <url>
20. curl (files will not be downloaded but it will print the file in the terminal)
    - curl <url>
21. cut (It is used to cut the string based on some delimiter in to multiple sub strings)
    - cut -d / -f 1  (-d means delimeter, -1f means 1st fragment, Use cut command, we have to calculate fragments manually )
22. awk (to cut the string based on some delimiter but it’s automatic not manual and it is used to get the data  with column based)
    - awk -F “/” ‘{print $1F}’ ($NF means nth fragment or last fragment)
23. When you run set -e in a Bash shell or script, you're enabling the errexit option, which means:
    set -e
    - Bash will immediately exit if any command returns a non zero exit status, except in certain cases like command lists joined with && or ||, conditional parts of if, while, or until, and in all but the final element of a pipeline. 
    - If an ERR trap is defined with trap, it will be executed before the shell exits.
    - By default, Bash continues execution after a failing command—making it easy to miss errors in production scripts.
    - set -e enforces a fail-fast behaviour, akin to exceptions in higher‑level languages, improving script reliability.

Best practices
---------------
    - Use a stricter mode:
        set -euo pipefail
        -u: treat unset variables as errors
        -o pipefail: ensure the entire pipeline fails if any command in it fails
    - Add -E for better trap inheritance:
        set -eE
        trap 'echo "Error occurred"; cleanup' ERR
        -E: ensures your ERR trap is inherited in subshells and command substitutions
24. find <where-to-search> -name filename
    Ex: 
    - find / -name “hello”  / means everywhere
    - find . -name 'pattern' (Searching by Name)
    - find . -type f -name "*.txt" (Searching by type as file)
    - find . -type d -name "backup" ((Searching by type as file)
    - find . -iname "*.txt" (Case-insensitive search)
    - find ~/Documents -mtime -7 -iname "*.txt" (Find files modified in last 7 days)
    - find . -size +50M -size -100M (Based on size)
    - find . -type f -size 0 (Find empty files)

Common Search Criteria and Options:
-------------------------------------
    By Name:
        -name "filename": Searches for files or directories matching the exact name (case-sensitive).-iname "filename": Searches for files or directories matching the name (case-insensitive)Wildcards like * (any sequence of characters) and ? (any single character) can be used with -name and -iname.
    By Type:
        -type f: Searches only for files.
        -type d: Searches only for directories.
    By Size:
        -size +1G: Searches for files larger than 1 Gigabyte.
        -size -1M: Searches for files smaller than 1 Megabyte.
        -size 50k: Searches for files exactly 50 Kilobytes in size.
    By Modification Time:
        -mtime +7: Searches for files modified more than 7 days ago.
        -mtime -7: Searches for files modified within the last 7 days.
        -mtime 7: Searches for files modified exactly 7 days ago.
    By Permissions:
        -perm 777: Searches for files with specific permissions (e.g., read, write, execute for all).
    Executing Commands on Found Files:
        -exec command {} \;: Executes a specified command on each found item. {} acts as a placeholder for the found item's path, and \; terminates the command.
        -exec command {} +: Executes a specified command on multiple found items at once, improving efficiency.
25. sed editor (Streamline editor) 
    sed -e ‘1 a Good morning’ passwd (-e means adding, 1 means after 1st line, a means appends and passwd is filename)
    sed -e ‘1 i Good morning’ passwd (I means insert before line 1)
    - it is a temporary editor not permanently, use -i for permanently changing instead of -e
    sed -e ‘s/<word-to-find>/<word-to-replace>/’ <file-name> - to replace (this one will replace the first occurrence)
    if you want all occurrences you need to use g
    sed -e ‘s/<word-to-find>/<word-to-replace>/g’ <file-name>
    sed -e ‘/<word-to-delete>/ d’ <file-name>
    Note: In Linux, $ will work in double quotes but not in single quotes
26. less /var/log/messages
    shift+g --> down
    gg --> take up
    q --> quit
27. tail -f <log-file> - Running logs
    2** --> success
    3** --> redirection
    4** --> client side error, you are not giving proper URL
    5** --> server side error, there is something wrong inside server/code
28. tar -czf "$backup_dir/backup_$timestamp.tar.gz" "$source_dir"
29. mysqldump -u "$db_user" -p"$db_pass" "$db_name" | gzip > "$backup_dir/db_backup_$timestamp.sql.gz"
30. kubectl set image deployment/nginx-deployment nginx=nginx:"$previous_version" --record
31. df -hT | grep -vE 'tmfs|Filesystem'
32. awk '{print $(NF-1)}
33. sh mail.sh dasaridevops2025@gmail.com "High Disk Usage" "$message" "DEVOPS TEAM" "High Disk usage"
34. destination_server="user@hostname:/tmp/"
    scp "$source_file" "$destination_server"
35. git clone --mirror "$git_repo" "$backup_dir/shell-script-for-devops.git"
36. grep -c "WARNING" "$log_file"
37. wc -c < "$log_file")
38. sed -e 's/[]\/$*.^[]/\\&/g' <<< $3
39. ping -c 1 "$server"
40. systemctl is-active --quiet "$service_nam
41. apt-get update && apt-get upgrade -y
42. top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}'
43. free | grep Mem | awk '{print $3/$2 * 100.0}' --> used to calculate and display the percentage of used physical memory (RAM). $2 means total memory and $3 means used memory
44. useradd "$username" --> create a user
45. usermod -s /bin/bash "$username" --> Changing the user's default shell 
46. userdel "$username" --> Delete the user
47. awk '{print $1}' "$access_log" | sort | uniq -c | sort -nr | head -n 10 (awk '{print $1}' "$access_log"--> 1st column output from access_log, sort-->Sort in ascending order, uniq -c--> remove duplicates, sort -nr-->sort in descending numerically, head -n 10--> 1st 10 lines)
```
### Troubleshooting steps
```
nginx should always runs on port 80, These are common troubleshooting steps for any component
    - systemctl status nginx
    - systemctl restart nginx
    - systemctl enable nginx
    - systemctl start nginx
    - systemctl daemon-repload
    - netstat -lntp
    - ps -ef | grep nginx – nginx is running or not
    - cd /var/log/nginx – can check the logs
    - tail -f access.log
    - tail -f error.log
    - Check Security Groups
```
### Permissions in Linux
```
chmod (Permissions)
    - chmod u+x <filename> (Execute permissions)
    - chmod u-x <filename> (To remove execute permission)
    - chmod ugo+r <filename> (For everyone)
    - chmod +x <filename> (For everyone)
    - chmod ugo+rwx <filename>
    - Read (R)--> 4, Write (W)-->2, Execute (X)--> 1
    - chmod 750 <filename>
    - Note:: public key and private key should not have more than 600 (Only user should have read & write access)
```
### User Management
```
useradd (To create a user)
   - useradd <user-name>
   - For root user always userid is 0
   - Linux will start creating users from 1000, below 1000those are system users.
   - passwd <user-name> (Giving password to the user)
   - id <user-name> (Reading the user information)
   - cat /etc/passwd (It displays all user information)
   - getent passwd (get entries of passwd)
So, user should login to the system. How?
   - ssh username@IP (Permission denied).
Linux by default password authentication. How to enable password authentication?
   - Edit /etc/ssh/sshd_config (This is a crucial file, you should not do mistakes here).
   - We take first backup: cp /etc/ssh/sshd_config /tmp/sshd_config_backup
   - Open sshd_config and change PasswordAuthentication no to yes
   - sshd -t (If no result then it is success otherwise it will show bad configuration)
   - systemctl restart sshd (Restart the service to reflect the changes)
Create a group --> Whenever you create a user a group also created on same username
   - Primary Group --> devops
   - Secondary Group   testers
   - groupadd <group-name>
   - Updating the user: We want to add username to the groupname usermod -g <group-name> <user-name>
    Ex: usermod -g evops dasari
    - Create another group testers, and add testers as secondary group to dasari  groupadd testers
      getent group  Will show the information on groups
      usermod -aG testers dasari (a s append & G for secondary groups and g for primary groups)
How to delete?
    - gpasswd -d testers dasari testers
    - id dasari
ssh key authentication to user
    - User dasari has to create his public key and private key
    - Share public key to admin
    - cd /home/dasari
    - mkdir .ssh
    - chmod 700 .ssh
    - cd .ssh
    - create a file called authorizedkeys and paste the public key 
    - chmod 600 authorized_keys (Maximum is 600 or 400 is also fine)
    - change the ownership to dasari chown <user>:<group> -R .ssh (R means recursive all files inside .ssh, ownership will be changed) Note: Always you have root access to perform chown
User is leaving organization
    - We need to remove him from devops group. You can’t delete user from primary group
    - First you need to change his primary group to his own group.
      usermod -g dasari dasari
      id dasari
    - We need to delete the user  userdel dasari
    - Delete the group also  groupdel <group-name>
    Note: you can delete the group only if it has no users, firt you should remove users from group and then delete
```
### Process Management
```
- Everything in Linux is a process, for that a PID is created
- List down the processes, the command is ps (It will only show the active processes)
- ps -ef (All process inside the system. You are telling linux or you are assigning a task to linux to give the result of ps -ef)
- First it will create a PID and assign the PPID
  That means for simple command also, Linux will create PID per each time
- PID is 100, PPID is 0
DevOps Team
       DevOps Team Leader – 0
        Senior DevOps Engineer
                  PID is 1
                  PPID is 0
        Junior DevOps Engineer
                  PID is 2
                  PPID is 1
        DevOps Trainee
                  PID id 3
                  PPID is 2 
- Foreground Process – Running the process in foreground ex: sleep 10
- Background Process – Running the process in background ex: sleep 10 &
- ps -ef | grep java (How can you search for java process)
- kill <pid>  - Ending the process means kill the process, you are requesting to end the process
- kill -9 <pid> - You are forcing to end the process
- top  - It will list all the processes running
```
### Package Management
```
Ubuntu  apt-get
Centos  yum
Aws linux 2  amazon-linux-extra and yum
I want to install a package called git   (github repo: tf-docker-k8)
$cat /etc/os-release (What is the distribution you are using)
sudo amazon-linux-extras install epel -y
yum install git -y
yum list all – It will show you all packages including installed packages
yum list all | wc -l
yum list installed | wc -l
yum list available | wc -l  All-installed
yum remove git -y
yum search git
```
### Service Management
```
0 to 65535 ports
Whenever you start a service, it will get the port from (065535)
Nginx – http/s server running on port no 80, it is a web server
-	You should install nginx
Root access
amazon-linux-extras install nginx -y
yum install nginx -y
nginx packagestart then it will run
systemctl start nginx
systemctl status nginx
systemctl enable nginx  if you restart server by default nginx will not run, so you have to enable first and then start again
systemctl disable nginx
systemctl stop nginx
http://ip-address: 80
cd /usr/share/nginx  default location when nginx related files are resided.
/usr/share/nginx/html you keep .html,.css & JS files
```
### Network Management
```
netstat --> network statistics (You can check respected port is opened or not, what is PID)
netstat -lt --> List the services
netstat -ltn --> List the services with port
netstat -lntp --> with PID
ps -ef | grep nginx
top --> Whether the system is exhausted or not
free -m (RAM usage)
df -hT (Hard Disk memory)
telnet (amazon-linux-extras install telnet -y)
telnet IP port
If this is failed, you need to check security group (firewall)
```
### Linux File System
```
/ --> Linux start directory
/boot --> When OS started Linux search for boot directory to start the server.  Based on the configuration in grub.cfg, server will get started
/root --> it is the home folder of admin user i.e., root
/dev (devices) --> all our hard disks, keyboards, speakers etc.,
/etc --> extra configuration, configuration related to packages, services
/home --> where all the users folder exists
/lib or /lib64 --> all the libraries (dependencies) of the packages and commands
/media --> cd or dvd will be mounted here
/mnt (mount) --> it is used to mount the external hard disk or NFS
/opt --> optional, third party softwares like tomcat, if we want to download and run manually it is always good to keep in /opt directory
/proc --> process, all your running process info will be stored here. Once you stop the system everything will be deleted from this folder
/run --> when your OS is loading, it need some temporary file system. It will use /run as filesystem. Once you stop the system everything will be deleted from this folder
/bin --> binaries, like commands our regular users use
/sbin --> system binaries, admin related commands
/tmp --> just temp files. It is not important
/usr --> user information
/var --> variables, log files, messages

inode --> humans remember names, computer can’t understand names, they only understand numbers. It is the pointer location of the filr/folder inside memory
softlink/symbolic/symlink 
echo “Hello” > hello
cat hello
ln -s hello hello-soft (-s means softlink)
hello-soft/tmp (It refer the file in /tmp folder)
hard linklike copying the file again but uses same inode
ln /home/ec2-user/hello hello-hardlink
ls -ltri (I meand inode)
soft link vs hard link  same inode for hard link and different inodes for soft link
rm -rf /home/ec2-user/hello
softlink files will be removed but files exist for hard link that means softlink will not work, hard link can still have the data

tar-->tar -x filename (-x means extract)
crontab-->you need to monitor linux server all the time like memory, cpu resources. Instead of that write shell script and schedule it
crontab -e (-e means edit)
***** echo “Hello $date” >> /home/ec2-user/execution.log
```
### Volumes in Linux
```
-	By default, we can’t see the volume in linux server we need some configuration
-   Attach EBS volume to EC2
-	lsblk
-	create file system from volume sudo mkfs -t xfs /dev/xvdf
-	sudo yum install xfsprogs
-	sudo mkdir /data
-	sudo mount /dev/xvdf /data
-	df -hT
```
### systemd service
```
/etc/systemd/system --> Linux looks for the services when it is starting
Create a service /etc/systemd/system folder to manage it as native systemctl service.

    [Unit]
    Description = Catalogue Service
    [Service]
    User=roboshop
    Environment=MONGo=true
    Environment=MONGO_URL=”mongodb://<MONGODB-SERVER-IPADDRESS>:27017/catalogue
    ExecStart=/bin/node /app/server.js
    SyslogIdentifier=catalogue
    [Install]
    WantedBy=multi-user.target

systemctl daemon-reload
systemctl enable catalogue
systemctl start catalogue
```
### Install dependencies/Libraries
```
Maven --> pom.xml
Nodejs/js --> package.json
Python --> Requirements.txt
```
### Shell Script Concepts

| Topic  | Syntax | Purpose  | Example  |
|:----------|:-------|:--------|:--------|
| shebang   | #!/bin/bash  | This should be first line. You should inform linux server, how to  execute the script     | sh filename.sh |
| Comment    | #some message  | The line will not get executed | #This is first shell script |
| To print  | echo    | To print something    | echo “Hello” |
| Variables  | variable-name=vaule          | DRY – Don’t repeat yourself    | PERSON1=” Dasari”  $PERSON1|
| Execute a command   | variable-name=$(command)    | Shell script run the command inside $() and stores the output into the variable    | DATE=$(date)   $DATE |
| Command-line arguments  | variable-name=$1    | These are used to pass values from command line    | PERSION1=$1 <br> sh filename.sh Dasari <br>   $PERSION1  |
| Add 2 Numbers  | variable-name=$((varibale1+variable2))    | Values of variable 1 and varible2 are added and store into variable    | NUMBER1=$1 <br> NUMBER2=$2 <br> SUM=$((NUMBER1+NUMBER2)) <br> $SUM |
| Password  | read -s variable-name    | Prompt the user to enter values at runtime securely    | echo “Please enter your username” <br> read USERNAME <br> echo “Please enter your Password” <br> read -s PASSWORD |
| Datatypes  | No datatype    | Don’t worry about data types, shell script can intelligently understand    | X=1#number <br> PERSONS=(“Ramesh” “Suresh” “Sachin”) #array <br> echo ${PERSIONS[0]} #first element <br> echo ${PERSONS[@]} |
| Conditions | If [condition]: <br>then <br>#true statements <br>else<br>#false statements | If the condition is true, true statements otherwise false statements will get executed    | USERID=$(id -u) <br> If [ $USERID -ne 0 ] <br> then <br>echo “Please run this script with root” <br>exit 1 |
| Special Variables  | $0,$1$#,$@,$? | $0  - Script Name<br> $1 - 1st argument<br> $# - No. of arguments <br> $@ - All arguments <br> $? - Previous command status. It it 0, Success otherwise Failure    | $0<br>$1<br>$#<br>$@<br>$? |
| Functions  | Function_name() { <br>#statements<br>} | Keep more repeated code inside a function and call the function when you require    | VALIDATE() {<br>If [ $1 -ne 0 ]<br><br>then<br>echo “ $2 Failure”<br>exit 1<br>else<br>echo “$2 success”<br>fi<br>}<br>VALIDATE $? “Installing MySql”|
| Log Files  |     | Log files are very important to know what happened. For this we need redirections.<br> > overrides<br>1 means success<br>2 means failure<br>& means both success and failure<br>ls -l &>log.log <br> >> It appends to previous content | ls -l &>>output.log<br>DATE=$(date +%F)<br>SCRIPT_NAME=$0<br>LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log |
