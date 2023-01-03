# cloudflare-backup
Cloudflare API kullanarak Cloudflare hesabınızdaki domainleri ve DNS kayıtlarını text dosyalarına export eden bir bash script yazdım. 
Ubuntu 20.04 altında sorunsuz çalışmaktadır. 
Scriptin çalışabilmesi için
1- Dosyaya çalıştırma izni vermeniz gerekli. # chmod +x cloudflare_yedek.sh
2- ACCOUNTID ,ACCOUNTNAME,APIKEY değerlerini hesabınızdan alıp dosyada yerine koymalısınız.
3- Sisteminizde jq - commandline JSON processor yüklü olmalı. # sudo apt install jq

Script çalıştığında cloudflare hesabınızdan domainlerin isimlerini çekip zones/domains.txt içine yazar.
zones klasörü içine domain isimleri adında text dosyaları oluşturup içlerine DNS vs. bilgilerini koyar.

İsmail KIŞLA /2023
