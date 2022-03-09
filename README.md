# iStorageEnum
Tired of searching through iOS local storage to find juicy files manually? It is time consuming, yea ikr. Enter iStorageEnum; a simple script to enumerate juicy files (.plist, .json, .jpg etc.) of a given application from the local storage.

## Installation
Just `git clone` this repo and you're good to go! Its as simple as that.
`git clone `

## Usage
1. Requirement: APP_ID
  This can be fetched using `objection`.
  
  `objection -g <App Name / Bundle Name> explore`
  
  After objection fires up the application, use `env` command to find out the environment, ie. the storage location the application writes to. A long gibberish which looks like a hash with upper case characters is the thing we are looking for.
  
2. SSH connection to the device
  We are running the script via ssh to avoid storing this file on the iOS device.
  
Now that we have everything, call the script using:

  `ssh root@xxx.xxx.xxx.xxx 'bash -s' < script.sh <APP_ID>`
  
## Sample output

```
Navigating to Application files
File structure
.
 |-Documents
 | |-ABLoaderError.log
 |-.com.apple.mobile_container_manager.metadata.plist
 |-Library
 | |-Caches
 | | |-com.crashlytics.data
 | | | |-com.xxxxxxxxxx.xxxxxxxx
 | | | | | |-settings
 | | | | | | |-settings.json
 | | | | | |-reports
 | | | | | | |-prepared
 | | | | | | |-processing
 | | |-google-sdks-events
 | | | |-GDTCORFlatFileStorage
 | | | | |-gdt_library_data
 | | | | | |-GDTCORFlatFileStorageBatchIDCounter
 | | | | |-gdt_batch_data
 | | |-xxxxxxxxxxxxxxxxxxxxx
 | | | |-com.xxxxxxxxxxxxxxxxxxxxx
 | | | | |-libraries.list
 | | | | |-functions.data
 | | | | |-functions.list
 | | | | |-libraries.data
 | | | |-xxxxxxxxxxxxxxxxxxxxx
 | | | |-CacheStorage
 | | | |-OfflineWebApplicationCache
 | | |-xxxxxxxxxxxxxxxxxxxxx
 | | | |-HSTS.plist
 | |-Saved Application State
 | | |-com.xxxxxxxxxx.xxxxxx
 | | | |-restorationInfo.plist
 | | | |-KnownSceneSessions
 | | | | |-data.data
 | | | |-data.data
 |-SystemData
 | |-com.xxxxxxxxxxxxxxxxxxxxx
 | | |-Library
 | | | |-WebKit
 | | | | |-WebsiteData
 |-tmp
 | |-CFNetworkDownload_devtpH.tmp
 | |-WebKit
 | | |-MediaCache
 
=================================================================================

[+] Interesting files:
\tJSON Files:
./Library/Caches/xxxxxxxxxxxxxxxxxxxxx/settings.json
./Library/Caches/xxxxxxxxxxxxxxxxxxxxx/settings/cache-key.json
./Library/Caches/flutter_callback_cache.json

---------------------------------------------------------------------------------

PList Files
[ Plist files are convenient to use and can be used to store standard data types, such as integer, strings, and so on. Many times a developer makes the mistake of saving sensitive information in plist. Many top companies' iOS app had mistakenly stored users' credentials/pin in the plist files in their earlier versions. ]

Tip: Use cat to view the files and hunt for Sensitive data.

./Library/Application Support/xxxxxxxxxxxxxxxxxxxxx/g-checkin.plist

---------------------------------------------------------------------------------

SQLite Files
[ Tip: Use sftp to download the files to local system and take advantage of sqlite3, or any other SQL viewers to browse the files. ]

./Library/Application Support/xxxxxxxxxxxxxxxxxxxxx/rmq2.sqlite

---------------------------------------------------------------------------------

SQL Files
[ Tip: Use sftp to download the files to local system and take advantage of SQL browsers to examine the files. ]

./Library/xxxxxxxxxxxxxxxxxxxxx/google-app-measurement.sql

---------------------------------------------------------------------------------

Image files:
Developers mistakenly store images which expose sensitive data. Use sftp to download the image to local machine to view the images

./Library/SplashBoard/Snapshots/sceneIDxxxxxxxxxxxxxxxxxxxxx/8403xxxxxxxxxxxxxxxxxxxxx63CCDD@2x.jpeg

---------------------------------------------------------------------------------

PDF Files:
Developers mistakenly store PDF files of a currently or previously logged in user which might expose sensitive data. Use sftp to download the pdf file to local machine to view the files.


---------------------------------------------------------------------------------

Other files


---------------------------------------------------------------------------------
```
