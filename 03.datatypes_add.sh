#!/bin/bash
echo "Enter the first number "
read -s firstnumber
echo "Enter the second number"
read -s secondnumber
result=$((firstnumber+secondnumber))
echo "The sum of entered numbers is: ${result}"
result_diff=$((firstnumber-secondnumber))
echo "The difference of entered numbers is: ${result_diff}"
result_prod=$((firstnumber*secondnumber))
echo "The product of entered numbers is: ${result_prod}"
result_quo=$((firstnumber/secondnumber))
echo "The quotient of entered numbers is: ${result_quo}"