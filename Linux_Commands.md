## Linux Commands
```
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