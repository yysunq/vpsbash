#!/bin/bash


# Download zip dataset from Google Drive
#filename='codegeex2-ggml.bin'
#fileid='1Xr2zJScKveMdI_UV5jT5Rs6EYuUf5XiX'
filename='chatglm2-ggml.bin'
fileid='1-12UHSwunFMPcxYO052y5v-9oNNsOpjz'
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
rm ./cookie

# Unzip
#unzip -q ${filename}
#rm ${filename}
