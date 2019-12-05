echo "I want to dump AD objects and DNS records and sort them for you"
#Read in creds to dump from DC
echo "Enter Domain Controller (i.e. IP or Domain)"
read dc
echo "Enter Domain Username (i.e. nonadmin)"
read user
echo "Enter Password (i.e. Password123!)"
read pass
echo "Enter Domain (i.e. Username Prefix)"
read domain

cd logs
#Dumps DNS records
echo "Dumping DNS records."
adidnsdump -u $domain\\$user -p "$pass" $dc
echo
#Dumps AD objects 
echo "Dumping AD Objects."
ldapdomaindump -u $domain\\$user -p "$pass" $dc
echo

#updates targets with new hosts
cat records.csv |cut -d "," -f3 |sort -u |grep -E '^(192\.168|10\.|172\.1[6789]\.|172\.2[0-9]\.|172\.3[01]\.)' > ../hosts/targets.txt
echo

#Printing out external DNS records
cat records.csv |cut -d "," -f3 |sort -u |grep -vE '^(192\.168|10\.|172\.1[6789]\.|172\.2[0-9]\.|172\.3[01]\.)' |grep -v "ip"
echo "These records displayed might be juicy :)"
echo "Careful, they might be out of scope"
echo

#Output hosts and users to files.
cat domain_computers.json |grep -A1 dNSHostName | cut -d '"' -f2 |grep -v "dNSHostName" |grep -v '-' >> ../hosts/targets.txt
cat domain_users.json |grep -A1 sAMAccountName | cut -d '"' -f2 |grep -v "sAMAccountName" |sort -u > AD_users.txt
echo 
echo $(cat AD_users.txt |wc -l) "Users found in logs/AD_users.txt"
echo $(cat ../hosts/targets.txt |wc -l) "Hosts found in hosts/targets.txt"
