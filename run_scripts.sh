#!/bin/bash

month=$1
for fullname in "$PWD"/*.*; do
	filename="$(basename "$fullname")"
   	echo "$filename"

   	if [[ "$filename" == 应收帐款汇总表*.x* || "$filename" ==  应收帐款汇总表*.X* ]]; then
      		mv "$filename" "应收帐款汇总表.xls"
		jupyter nbconvert --to python 应收帐款汇总表.ipynb
		python3 应收帐款汇总表.py $month
		echo -------------PASS--------------------------
		continue
   	fi

   	if [[ "$filename" == 成品仓库进出明细*.x* || "$filename" == 成品仓库进出明细*.X* ]]; then
      		mv "$filename" "成品仓库进出明细.xls"
		jupyter nbconvert --to python 成品仓库进出明细.ipynb
		python3 成品仓库进出明细.py $month
		echo --------------PASS-------------------------
		continue
   	fi

	if [[ "$filename" == 成品采购明细*.x* || "$filename" == 成品采购明细*.X* ]]; then
      		mv "$filename" "成品采购明细.xls"
		jupyter nbconvert --to python 成品采购明细.ipynb
		python3 成品采购明细.py $month
		echo ----------------PASS------------------------
		continue
	fi

	if [[ "$filename" == 成品销售明细表*.x* || "$filename" ==  成品销售明细表*.X* ]]; then
      		mv "$filename" "成品销售明细表.xls"
		jupyter nbconvert --to python 成品销售明细表.ipynb
		python3 成品销售明细表.py $month
		echo ----------------PASS-------------------------
		continue
   	fi
	
done

jupyter nbconvert --to python 添加累计金额.ipynb
python3 添加累计金额.py $month
echo ----------------PASS-------------------------
