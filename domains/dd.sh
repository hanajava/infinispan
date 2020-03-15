echo num1:
read num1
echo num2:
read num2

echo $num1 + $num2 = `expr $num1 + $num2`
echo $num1 - $num2 = `expr $num1 - $num2`
echo $num1 \* $num2 = `expr $num1 \* $num2`
echo $num1 / $num2 = `expr $num1 / $num2`
echo $num1 % $num2 = `expr $num1 % $num2`

export PORT_OFFSET=100
export CONSOLE_PORT=$((9990 + PORT_OFFSET))
echo "CONSOLE_PORT="$CONSOLE_PORT
