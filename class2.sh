#! /bin/bash
count=0
id=1809102021

find . -name "18-2*.csv" > path.log 

cat path.log | while read line 

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
    echo $id'共出勤'$count'次' > result.log
done
cat result.log