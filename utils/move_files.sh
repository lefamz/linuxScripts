cd Gorgon_Heavy/AP
logs=`ls | grep -i .ulg | cut -d"." -f 1`
for log in ${logs}
do
	mkdir ${log}
        for file in `ls EXPORT | grep -i ${log}`
	do                   
		echo "moving file EXPORT/${file} to ${log}"
		mv EXPORT/${file} ${log}/
	done
done
