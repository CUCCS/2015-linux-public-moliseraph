#/bin/bash: bin/on help_information { 
5   echo "      usage bash task1.sh DIRECTORY [option]..." 
6   echo "      DIRECTORY  the directory of the pictures that you want to deal with" 
7   echo "      -h print this usage and exit" 
8   echo "      -c type a compression level for JPEG images" 
9   echo "      -C type a width to compress JPEG/PNG/SVG format picture under the premise of maintaining the original aspect ratio" 
10   echo "      -w type the watermark to embed into the pictures" 
11   echo "      -p type the prefix to add to the pictures'names" 
12   echo "      -s type the suffix to add to the pictures'names" 
13   echo "      -t convert png/svg to jpeg" 
14 } 
15 
 
16 #对jpeg格式图片进行图片质量压缩 
17 function compress_jpeg { 
18   for i in *.jpg; 
19   do  
20      convert "$i" -quality "$2" ../"$i" 
21   done	  
22 } 
23 
 
24 #对jpeg/png/svg格式图片在保持原始宽高比的前提下压缩分辨率 
25 function compress_jpeg_png_svg { 
26   for i in *; 
27   do  
28     convert "$i" -resize "$2" ../"$i" 
29   done 
30 } 
31 
 
32 #对图片批量添加自定义文本水印 
33 function embed { 
34   for i in *; 
35   do  
36     convert "$i" -fill black -pointsize 13 -draw "text 10,15 '$2' " ../"$i" 
37   done 
38 } 
39 
 
40 #批量重命名（统一添加文件名前缀，不影响原始文件扩展名） 
41 function prefix { 
42   for i in *; 
43   do 
44     cp "$i" ../"$2""$i" 
45   done 
46 } 
47 
 
48 #批量重命名（统一添加文件名后缀，不影响原始文件扩展名） 
49 function suffix { 
50   for i in *; 
51   do  
52     filename="$i" 
53     extension=${filename##*.} 
54     filename=$(echo "$i" | cut -d . -f1) 
55     cp "$i" ../"$filename""$2"".""$extension" 
56   done 
57 } 
58 
 
59 #将png/svg图片统一转换为jpg格式图片 
60 function convert_pngandsvg_to_jpeg { 
61   for i in *png; 
62   do  
63     filename="$i" 
64     extension=${filename##*.} 
65     filename=$(echo "$i" | cut -d . -f1) 
66     convert "$i" ../"$filename"".jpg" 
67   done 
68   for i in *svg;  
69   do  
70     filename="$i" 
71     extension=${filename##*.} 
72     filename=$(echo "$i" | cut -d . -f1) 
73     convert "$i" ../"$filename"".jpg" 
74   done 
75 } 
76 
 
77 if [[ "$#" -lt 1 ]]; then 
78   echo "arguments too short." 
79 else 
80   cd "$1" 
81   shift 1 
82   until [ "$#"  -eq 0 ] 
83   do 
84     case "$1" in 
85       "-c") 
86 	 if [[ "$2" != '' ]];then 
87            compress_jpeg "$@" 
88 	   shift 2 
89 	 else  
90            echo "missing an argument:compression level" 
91 	   shift 
92 	 fi 
93 	 ;; 
94       "-C") 
95 	 if [[ "$2" != '' ]];then 
96 	   compress_jpeg_png_svg "$@" 
97 	   shift 2 
98          else 
99            echo "missing an argument:width" 
100 	   shift 
101 	 fi 
102 	 ;; 
103       "-w") 
104 	 if [[ "$2" != '' ]];then 
105 	   embed "$@" 
106 	   shift 2 
107 	 else 
108            echo "missing an argument:watermark" 
109 	   shift 
110 	 fi 
111 	 ;; 
112       "-p") 
113 	 if [[ "$2" != '' ]];then 
114 	   prefix "$@" 
115 	   shift 2 
116 	 else 
117            echo "missing an argument:prefix" 
118 	   shift 
119 	 fi 
120 	 ;; 
121       "-s") 
122 	 if [[ "$2" != '' ]];then 
123 	   suffix "$@" 
124 	   shift 2 
125 	 else 
126            echo "missing an argument:suffix" 
127 	   shift 
128 	 fi 
129 	 ;; 
130       "-t") 
131 	 convert_pngandsvg_to_jpeg "$@" 
132 	 shift 
133 	 ;; 
134       "-h") 
135 	 help_information 
136 	 shift 
137 	 ;; 
138    esac	     
139   done 
140 fi 
ile or directory
