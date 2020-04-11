#!/bin/bash

if [ -f "zathurarc1" ]; then
	mv zathurarc zathurarc0 && mv zathurarc1 zathurarc
elif [ -f "zathurarc0" ]; then
	mv zathurarc zathurarc1 && mv zathurarc0 zathurarc
else
	echo "Nupe, not my shit, do it yourself"
	exit 1
fi
