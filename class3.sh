#! /bin/bash
count=0
id=1809103015

find . -name "18-3*.csv" > filePath.log 

function countById() {
    cat filePath.log | while read line
    do
    grep $id $line
    if [ $? == 0 ];
    then
        #echo 'find'
        count=$[ $count + 1 ]
        #echo $id'共出勤'$count'次'
    else
    echo "班上没有改学号的同学！请检查学号是否输入正确！" 
    fi
    echo $id'共出勤'$count'次' > totolResult.log
    cat totolResult.log
done
}
countById