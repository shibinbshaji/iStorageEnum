#!/bin/bash
args=("$@")
if [ $# -eq 0 ]
then
	echo "Script Usage: android-script.sh <package.name>"
	echo "<package.name> can be fetched using Frida:"
	echo "		frida-ps -Uai"
	exit 0
fi
echo 'Navigating to Application folders'
cd /data/data
echo 'File structure'
##ls
cd ${args[0]}
#ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
find . | sed -e "s/[^-][^\/]*\// |/g" -e "s/|\([^ ]\)/|-\1/"
echo "================================================================================="
echo ""
echo '[+] Interesting files:'
echo '\tJSON Files:'
find . -name "*.json"
echo ""
echo "---------------------------------------------------------------------------------"
echo ""
echo "xml Files"
echo "[ Plist files are convenient to use and can be used to store standard data types, such as integer, strings, and so on. Many times a developer makes the mistake of saving sensitive information in plist. Many top companies' iOS app had mistakenly stored users' credentials/pin in the plist files in their earlier versions. ]"
echo ""
echo "Tip: Use cat to view the files and hunt for Sensitive data."
echo ""
find . -name "*.xml"
echo ""
echo "---------------------------------------------------------------------------------"
echo ""
echo "SQLite Files"
echo "[ Tip: Use sftp to download the files to local system and take advantage of sqlite3, or any other SQL viewers to browse the files. ]"
echo ""
find . -name "*.sqlite"
echo ""
echo "---------------------------------------------------------------------------------"
echo ""
echo "SQL Files"
echo "[ Tip: Use sftp to download the files to local system and take advantage of SQL browsers to examine the files. ]"
echo ""
find . -name "*.sql"
echo ""
echo "---------------------------------------------------------------------------------"
echo ""
echo "Image files:"
echo "Developers mistakenly store images which expose sensitive data. Use sftp to download the image to local machine to view the images" 
echo ""
find . -name "*.jpg"
find . -name "*.jpeg"
find . -name "*.png"
find . -name "*.gif"
echo ""
echo "---------------------------------------------------------------------------------"
echo ""
echo "PDF Files:"
echo "Developers mistakenly store PDF files of a currently or previously logged in user which might expose sensitive data. Use sftp to download the pdf file to local machine to view the files."
echo ""
find . -name "*.pdf"
echo ""
echo "---------------------------------------------------------------------------------"
echo ""
echo "Other files"
echo ""
find . -name "*.txt"
find . -name "*.text"
echo ""
echo "---------------------------------------------------------------------------------"
