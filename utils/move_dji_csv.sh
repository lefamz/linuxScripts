cd M300
orig_dir=`pwd`
dirs=`ls`
for dir in ${dirs}
do
	cd ${dir}/csv
	mv * ../
	cd ../
	rm -rf bag
	rm -rf csv
	cd ${orig_dir}
done
	
