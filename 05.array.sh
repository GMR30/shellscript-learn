#!/bin/bash
languages=("Telugu" "Hindi" "English" "Tamil" "Kannada" "Malayalam" "Marrati")
echo "The first language is: ${languages[0]}"
echo "The 3rd language is: ${languages[2]}"
echo "The 5th Language is: ${languages[4]}"
echo "The languages are: ${languages[@]}"
#echo "The total no of languages is: $[#]}"