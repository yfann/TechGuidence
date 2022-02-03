
gitconfig='C:\Users\310256235\.gitconfig'

cat $gitconfig | while read line
do 
    if [ "$line" == "[http]" ]
    then
        echo $line
    fi
done