#Linux Commands
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
23. Troubleshooting steps (nginx should always runs on port 80, These are common troubleshooting steps for any component)
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
