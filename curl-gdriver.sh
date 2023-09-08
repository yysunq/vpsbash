#!/bin/bash

#name the final output file name
#exp:filename='codegeex2-ggml.bin'
filename='RWKV-4-Novel-7B-v1-Chn-20230426-ctx8192.pth'

#to get fileid, in googledriver select file to share, get copy link
#like this https://drive.google.com/file/d/1NmmGux0pIFSEzKKkEzuxvo7hn4HfsRSI/view?usp=sharing 
#exp:fileid='1NmmGux0pIFSEzKKkEzuxvo7hn4HfsRSI'
fileid='1-8SInoJQVeiEMkNtLC0bREZO9VGwDzG5'

#to get accesstoken
#https://developers.google.com/oauthplayground/ => 
#Step1 select Driver API v3 => 
#Step1 select https://www.googleapis.com/auth/drive.readonly => 
#Step1 push button "Authorize APIS" =>
#Step2 push button "Exchange authorization code for tokens" to generate Access token
#exp:accesstoken='ya29.a0AfB_byCs7JXNtyw01G9zoi0QXELxukOBjwTUmpeht_G28DKoA69Vcac7c4Zji-0kj0VLVD0C0Ol33pTabpTT49_gs_D8qNbqtP5WhBw1VFz-E4ME5U75fTI_ZJdMKKyTZiM7WkS_HbArYAlf7Aeb_pYydLfYyc0bERdL0QaCgYKAf0SARMSFQHsvYlsO4fPAyFXh6daxcowaAUn4w0173'
accesstoken='ya29.a0AfB_byDGWh4iZFfjosUTtlL2-eaAq2owBnk0wgXiKd4v9GXq-TehxrRp5Y0kAgRbE-OXmRF29J9UBvu9g2O4FbvGR8mvsQruMu6pz7yiiemNmu9a-kc_kDOmC2VPi2VHnC4x1nACVQ7SGe-oCO47z1X_SHCPvNX8a5oeRQaCgYKAfUSARMSFQHsvYlslE7Exu0TJOElpl5ZlQKNGw0173'

#run!!!!
curl -H "Authorization: Bearer ${accesstoken}" "https://www.googleapis.com/drive/v3/files/${fileid}?alt=media" -o ${filename}



