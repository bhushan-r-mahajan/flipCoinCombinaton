
echo "Welcome"
tails=0
heads=1
headsWin=0
tailsWin=0

function flipCoin(){

flip=$((RANDOM%2))

}
read -p "How many times do you want to flip coin? = " n;
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
