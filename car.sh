#!/bin/bash
select car in BMW MERCEDESE TESLA ROVER TOYOTA
do
	case $car in
        BMW)
		echo "You have selected BMW" ;;
	MERCEDESE)
		echo "You have selected MERCEDESE";;
	TESLA)
		echo "You have selected TESLA";;
	ROVER)
		echo "You have selected ROVER";;
	TOYOTA)
		echo "You have selected TOYOTA";;
	*)
		echo "ERROR! Please select between 1..5"
	esac
done
