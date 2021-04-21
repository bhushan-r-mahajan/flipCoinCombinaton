
echo "Welcome"
tails=0
heads=1
headsWin=0
tailsWin=0

function flipCoin(){

flip=$((RANDOM%2))

}
read -p "How many times do you want to flip coin? = " n;

function singlet(){
declare -A singletDict
for ((i=0; i<n; i++))
do
	flipCoin
	if [[ $heads -eq $flip ]]
	then
		((headsWin++))
		singletDict[key$i]=H
	elif [[ $tails -eq $flip ]]
	then
		((tailsWin++))
		singletDict[key$i]=T
	fi
done
echo "Dictionary For Singlet Combination:-[" ${singletDict[@]} "]"
headsPercent=`awk "BEGIN{print ($headsWin/$n)*100}"`
echo "Heads win % = "$headsPercent
tailsPercent=`awk "BEGIN{print ($tailsWin/$n)*100}"`
echo "Tails win % = "$tailsPercent

}

function doublet(){

declare -A doubletDict

hh=(1 1)
ht=(1 0)
th=(0 1)
tt=(0 0)

hhWin=0
htWin=0
thWin=0
ttWin=0

for ((j=0; j<n; j++))
do
	for ((q=0; q<2; q++))
	do
   	flipCoin
   	arr[$q]=$flip
	done

   if [[ ${arr[0]} -eq ${hh[0]} && ${arr[1]} -eq ${hh[1]} ]]
   then
      ((hhWin++))
      doubletDict[key$j]=HH
   elif [[ ${arr[0]} -eq ${ht[0]} && ${arr[1]} -eq ${ht[1]} ]]
   then
      ((htWin++))
      doubletDict[key$j]=HT
	elif [[ ${arr[0]} -eq ${th[0]} && ${arr[1]} -eq ${th[1]} ]]
   then
      ((thWin++))
      doubletDict[key$j]=TH
	elif [[ ${arr[0]} -eq ${tt[0]} && ${arr[1]} -eq ${tt[1]} ]]
	then
      ((ttWin++))
      doubletDict[key$j]=TT
   fi
done

echo "Dictionary For Doublet Combination:-["${doubletDict[@]}"]"
hhPercent=`awk "BEGIN{print ($hhWin/$n)*100}"`
echo "HH win % = "$hhPercent
htPercent=`awk "BEGIN{print ($htWin/$n)*100}"`
echo "HT win % = "$htPercent
thPercent=`awk "BEGIN{print ($thWin/$n)*100}"`
echo "TH win % = "$thPercent
ttPercent=`awk "BEGIN{print ($ttWin/$n)*100}"`
echo "TT win % = "$ttPercent

}

singlet
doublet
