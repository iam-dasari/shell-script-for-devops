### Shell Script Concepts

| Topic  | Syntax | Purpose  | Example  |
|:----------|:-------|:--------|:--------|
| shebang   | #!/bin/bash  | This should be first line. You should inform linux server, how to  execute the script     | sh filename.sh |
| Comment    | #some message  | The line will not get executed | #This is first shell script |
| To print  | echo    | To print something    | echo “Hello” |
| Variables  | variable-name=vaule          | DRY – Don’t repeat yourself    | PERSON1=” Dasari”  $PERSON1|
| Execute a command   | variable-name=$(command)    | Shell script run the command inside $() and stores the output into the variable    | DATE=$(date)   $DATE |
| Command-line arguments  | variable-name=$1    | These are used to pass values from command line    | PERSION1=$1 <br> sh filename.sh Dasari <br>   $PERSION1  |