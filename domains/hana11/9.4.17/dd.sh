echo num1:
read num1
echo num2:
read num2

echo $num1 + $num2 = `expr $num1+$num2`
echo $num1 - $num2 = `expr $num1-$num2`
echo $num1 \* $num2 = `expr $num1\*$num2` #\*
echo $num1 / $num2 = `expr $num1/$num2`
echo $num1 % $num2 = `expr $num1%$num2`
