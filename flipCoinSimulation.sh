echo "Welcome"
tails=0
heads=1

function flipCoin(){

flip=$((RANDOM%2))
if [ $flip -eq $heads ]
then
	echo "Heads"
elif [ $flip -eq $tails ]
then
	echo "Tails"
fi

}

flipCoin
