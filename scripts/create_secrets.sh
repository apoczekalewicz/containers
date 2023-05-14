if [[ "$#" -ne 3 ]]
then
	echo "Usage: $0 <secret_plain_dir> <values_file> <results_dir>"
	exit 1
fi

SECRET_PLAIN_DIR=$( realpath $1 )
VALUES_FILE=$( realpath $2 )
RESULTS_DIR=$( realpath $3 )

rm -rf ${RESULTS_DIR} ; mkdir -p ${RESULTS_DIR}
cp ${SECRET_PLAIN_DIR}/*.yaml ${RESULTS_DIR}

for i in $( cat ${VALUES_FILE} )
do
	KEY=$(echo $i | cut -f1 -d=)
	VALUE=$(echo $i | cut -f2- -d=)
	
	for FILE in $( ls -1 ${RESULTS_DIR} )
	do
		sed -i "s/$KEY/$VALUE/g" ${RESULTS_DIR}/$FILE
	done
 	
done
