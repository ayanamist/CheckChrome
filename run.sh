rm -rf ./public/ ./tmp/

# mkdir ./public/api -p
mkdir ./tmp/checker -p
mkdir ./tmp/parse -p
mkdir ./tmp/api/

chmod +x ./util/checker.sh
chmod +x ./util/xmlparser.sh
chmod +x ./util/parse.sh
chmod +x ./util/generator.sh
#chmod +x ./util/deployer.sh

./util/checker.sh

./util/parse.sh stable-x86 stable-x64

# cp -rf src/index.html tmp/index.html
cp -rf src/chrome.txt tmp/chrome.txt

DATE="$(echo $(TZ=UTC-8 date '+%Y-%m-%d %H:%M:%S'))"
# sed -i "s|{{CheckTime}}|$DATE|g" tmp/index.html
sed -i "s|{{CheckTime}}|$DATE|g" tmp/chrome.txt

./util/generator.sh stable-x86 stable-x64

# xmllint --format tmp/chrome.xml > tmp/api/chrome.xml
# xmllint --noblanks tmp/chrome.xml > tmp/api/chrome.min.xml

# cp -rf tmp/index.html public/index.html
# cp -rf tmp/api/chrome.xml public/api/chrome.xml
# cp -rf tmp/api/chrome.min.xml public/api/chrome.min.xml

# ./util/deployer.sh
cat ./tmp/chrome.txt
