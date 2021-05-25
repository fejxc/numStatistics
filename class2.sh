#! /bin/bash
count=0
id=1809102001
perId=1605103004
perCount=0

find . -name "18-2*.csv" > path.log 
#处理18091001-53之间的学号
function countById(){
    cat path.log | while read line 

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
    echo $id'共出勤'$count'次' > result.log
    done
}

while (($id<=1809102053)) 
do
    countById
    cat result.log >> resForClass2.log
    let "id++"

done 

#处理特殊学号 1605103004
function countByPersonId(){
    cat path.log | while read line 

do
    grep $perId $line
    if [ $? == 0 ];
    then
        #echo 'find'
        #count=$[ $perCount + 1 ]
        let "perCount++"
        #echo $id'共出勤'$count'次'
    else
    echo "班上没有改学号的同学！请检查学号是否输入正确！" 
    fi
    echo $perId'共出勤'$perCount'次' > perResult.log
    done
}
countByPersonId
cat perResult.log >> resForClass2.log
