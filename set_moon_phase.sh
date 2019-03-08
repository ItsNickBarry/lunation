
lp=2551443               #Lunar period (unix time in seconds)=29.53 days
now=$(date -u +"%s")     #Time now (unix time)
newmoon=592500           #Known new moon time (unix time). 7 Jan 1970 20:35
phase_d=$((($now - $newmoon) % $lp))
phase_number=$(echo 'scale=0; '${phase_d}'/86.400' | bc -l)

if [[ -z "$phase_number" ]]; then
  CHAR="🌝"
elif [[ $phase_number -lt 1000 ]]; then
  CHAR="🌑"
elif [[ $phase_number -lt 6560 ]]; then
  CHAR="🌒"
elif [[ $phase_number -lt 7560 ]]; then
  CHAR="🌓"
elif [[ $phase_number -lt 14265 ]]; then
  CHAR="🌔"
elif [[ $phase_number -lt 15265 ]]; then
  CHAR="🌕"
elif [[ $phase_number -lt 21260 ]]; then
  CHAR="🌖"
elif [[ $phase_number -lt 22260 ]]; then
  CHAR="🌗"
elif [[ $phase_number -lt 29530 ]]; then
  CHAR="🌘"
fi

PS1=$(echo $PS1 | sed "s/[\\\\]\?.$/$CHAR /")
