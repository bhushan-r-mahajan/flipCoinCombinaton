
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

function triplet(){

declare -A tripletDict

hhh=(1 1 1)
hth=(1 0 1)
hht=(1 1 0)
htt=(1 0 0)
ttt=(0 0 0)
tth=(0 0 1)
tht=(0 1 0)
thh=(0 1 1)

hhhWin=0
hthWin=0
hhtWin=0
httWin=0
tttWin=0
tthWin=0
thtWin=0
thhWin=0

for ((k=0; k<n; k++))
do
   for ((q=0; q<3; q++))
   do
      flipCoin
      arr[$q]=$flip
   done

   if [[ ${arr[0]} -eq ${hhh[0]} && ${arr[1]} -eq ${hhh[1]} && ${arr[2]} -eq ${hhh[2]}  ]]
   then
      ((hhhWin++))
      tripletDict[key$k]=HHH
	elif [[ ${arr[0]} -eq ${hth[0]} && ${arr[1]} -eq ${hth[1]} && ${arr[2]} -eq ${hth[2]}  ]]
   then
      ((hthWin++))
      tripletDict[key$k]=HTH
   elif [[ ${arr[0]} -eq ${hht[0]} && ${arr[1]} -eq ${hht[1]} && ${arr[2]} -eq ${hht[2]}  ]]
   then
      ((hhtWin++))
      tripletDict[key$k]=HHT
   elif [[ ${arr[0]} -eq ${htt[0]} && ${arr[1]} -eq ${htt[1]} && ${arr[2]} -eq ${htt[2]}  ]]
   then
      ((httWin++))
      tripletDict[key$k]=HTT
   elif [[ ${arr[0]} -eq ${thh[0]} && ${arr[1]} -eq ${thh[1]} && ${arr[2]} -eq ${thh[2]}  ]]
   then
      ((thhWin++))
      tripletDict[key$k]=THH
   elif [[ ${arr[0]} -eq ${tth[0]} && ${arr[1]} -eq ${tth[1]} && ${arr[2]} -eq ${tth[2]}  ]]
   then
      ((tthWin++))
      tripletDict[key$k]=TTH
   elif [[ ${arr[0]} -eq ${tht[0]} && ${arr[1]} -eq ${tht[1]} && ${arr[2]} -eq ${tht[2]}  ]]
   then
      ((thtWin++))
      tripletDict[key$k]=THT
   elif [[ ${arr[0]} -eq ${ttt[0]} && ${arr[1]} -eq ${ttt[1]} && ${arr[2]} -eq ${ttt[2]}  ]]
   then
      ((tttWin++))
      tripletDict[key$k]=TTT
   fi
done

echo "Dictionary For Triplet Combination:-["${tripletDict[@]}"]"
hhhPercent=`awk "BEGIN{print ($hhhWin/$n)*100}"`
echo "HHH win % = "$hhhPercent
hhtPercent=`awk "BEGIN{print ($hhtWin/$n)*100}"`
echo "HHT win % = "$hhtPercent
hthPercent=`awk "BEGIN{print ($hthWin/$n)*100}"`
echo "HTH win % = "$hthPercent
httPercent=`awk "BEGIN{print ($httWin/$n)*100}"`
echo "HTT win % = "$httPercent
thtPercent=`awk "BEGIN{print ($thtWin/$n)*100}"`
echo "THT win % = "$thtPercent
thhPercent=`awk "BEGIN{print ($thhWin/$n)*100}"`
echo "THH win % = "$thhPercent
tthPercent=`awk "BEGIN{print ($tthWin/$n)*100}"`
echo "TTH win % = "$tthPercent
tttPercent=`awk "BEGIN{print ($tttWin/$n)*100}"`
echo "TTT win % = "$tttPercent

}

singlet
doublet
triplet
