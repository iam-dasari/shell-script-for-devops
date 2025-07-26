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