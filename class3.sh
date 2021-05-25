#! /bin/bash
count=0
id=1809103001

find . -name "18-3*.csv" > filePath.log 
function countById() {
    cat filePath.log | while read line
    do
    grep $id $line
    if [ $? == 0 ];
    then
        #echo 'find'
        #count=$[ $count + 1 ]
        let "count++"
        #echo $id'共出勤'$count'次'
    else
    echo "班上没有改学号的同学！请检查学号是否输入正确！" 
    fi
    echo $id'共出勤'$count'次' > totolResult.log
    
    done
}
while (($id<=1809103054)) 
do
    countById
    cat totolResult.log >> resForClass3.log
    let "id++"
done 




