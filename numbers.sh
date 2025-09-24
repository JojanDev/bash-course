#! /bin/bash

x=10
y=20

echo $(( x + y ))
echo $(( x - y ))
echo $(( x * y ))
echo $(( x / y ))
echo $(( x % y ))

echo $(expr $x + $y )
echo $(expr $x - $y )
echo $(expr $x \* $y )
echo $(expr $x / $y )
echo $(expr $x % $y )
