filenames=`ls | cut -d"." -f -2`
filenames_cut=`ls | cut -d"." -f 1`
for f in ${filenames}
do
	unzip ${f}.zip
	mv `echo ${f} | cut -d"." -f 1`.csv ${f}.csv
done
 
