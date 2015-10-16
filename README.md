Full Screen Document Plugin iOS
=================================

Cordova plugin to show full screen images, pdf, txt files stored in the temporary folder. Also makes it possible to save and share the documents.
Tested on these files:
* Images (jpg, png, gif)
* PDFs
* .txt files

Installation:
--------------

`cordova plugin add https://github.com/zobbe/cordova-plugin-fullscreendoc.git`

PhoneGap Build

Usage:
--------------
Usage with your javascript code (Documents should be inside tmp/**pathOfDoc**):
`FullScreenDoc.showDocumentURL(docSrc);`

To get the path to the tmp folder in Cordova use: 
`cordova.file.tempDirectory`


Platforms:
--------------
* iOS ( >= iOS 8)
Full Screen Document Plugin, open **UIDocumentInteractionController** to show image.