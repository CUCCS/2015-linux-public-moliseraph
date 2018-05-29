#!/bin/bash
age=$(awk -F '\t' '{print $6}' worldcupplayerinfo.tsv) 
4 total=0 
5 age20=0 
6 age2030=0 
7 age30=0 
8 oldest=0 
9 oldesrname='' 
10 young=50 
11 youngname='' 
12 for n in $age 
13 do 
14 	if [ "$n" != 'Age' ] ; 
15 	then 
16 		let total+=1 
17 		if [ "$n" -lt 20 ] ; 
18 		then 
19 			let age20+=1		 
20 		fi 
21 		if [ "$n" -ge 20 ]&&[ "$n" -le 30 ] ; 
22 		then 
23 			let age2030+=1 
24 		fi 
25 		if [ "$n" -gt 30 ] ; 
26 		then 
27 			let age30+=1		 
28 		fi 
29 		if [ "$n" -gt "$oldest" ] ; 
30 		then  
31 			oldest=$n 
32 			oldestname=$(awk -F '\t' 'NR=='$[$total +1]' {print $9}' worldcupplayerinfo.tsv) 
33 		fi 
34 		if [[ $n -lt $young ]] 
35 		then  
36 			young=$n 
37 			youngname=$(awk -F '\t' 'NR=='$[$total +1]' {print $9}' worldcupplayerinfo.tsv) 
38 		fi 
39 	fi 
40 done 
41 propo20=$(awk 'BEGIN{printf "%.2f",'$age20*100/$total'}') 
42 propo23=$(awk 'BEGIN{printf "%.2f",'$age2030*100/$total'}') 
43 propo30=$(awk 'BEGIN{printf "%.2f",'$age30*100/$total'}') 
44 echo '20岁以下的人数和比例分别为：'$age20' '$propo20'%' 
45 echo '20到30岁的人数和比例分别为：'$age2030' '$propo23'%' 
46 echo '30岁以下的人数和比例分别为：'$age30' '$propo30'%' 
47 echo '' 
48 echo $oldestname'是最年长的球员,今年'$oldest'岁' 
49 echo $youngname'是最年轻的球员,今年'$young'岁' 
50 echo '' 
51 
 
52 position=$(awk -F '\t' '{print $5}' worldcupplayerinfo.tsv) 
53 declare -A dic 
54 for p in $position 
55 do 
56 	if [ "$p" != 'Position' ] ; 
57 	then  
58 		if [[ !${dic[$p]} ]] 
59 		then	 
60 			let dic[$p]+=1 
61 		else 
62 			dic[$p]=0 
63 		fi 
64 	fi	 
65 done 
66 for k in ${!dic[@]} 
67 do 
68 	echo "$k : ${dic[$k]}"" 所占比例为："$(awk 'BEGIN{printf "%.2f",'${dic[$k]}*100/$total'}')'%' 
69 done 
70 
 
71 namelen=$( awk -F '\t' '{print length($9)}' worldcupplayerinfo.tsv) 
72 minlen=40 
73 maxlen=0 
74 minname='' 
75 maxname='' 
76 COUNT=0 
77 for na in $namelen 
78 do 	 
79 	COUNT=$[$COUNT + 1]	 
80 	if [[  $na -gt $maxlen ]] 
81 	then 
82 		maxlen=$na 
83 		maxname=$(sed -n $COUNT'p' 'worldcupplayerinfo.tsv'|awk -F '\t' '{print $9}') 
84 	fi 
85 	if [[  $na -lt $minlen ]] 
86 	then 
87 		minlen=$na 
88 		minname=$(sed -n $COUNT'p' 'worldcupplayerinfo.tsv'|awk -F '\t' '{print $9}') 
89 	fi			 
90 
 
91 done 
92 echo '' 
93 echo '名字最长的球员是：'$maxname'，有'$maxlen'个字符' 
94 echo '名字最短的球员是：'$minname'，有'$minlen'个字符' 
:wq!
