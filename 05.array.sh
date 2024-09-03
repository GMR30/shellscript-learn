#!/bin/bash
languages=("Telugu" "Hindi" "English" "Tamil" "Kannada" "Malayalam" "Marathi")
echo "The first LANG is: ${languages[0]}"
echo "The 3rd LANG is: ${languages[2]}"
echo "The 5th LANG is: ${languages[4]}"
echo "The LANG are: ${languages[@]}"
echo "The total no of LANG are: $languages[#]"