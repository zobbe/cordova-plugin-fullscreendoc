
var exec = require("cordova/exec");

var FullScreenDoc = function () {
  this.name = "FullScreenDoc";
};

/*
 * Show document from url
 *
 * Parameters:
 * url: url to show
 *
 */

FullScreenDoc.prototype.showDocumentURL = function (url) {

  exec(null, null, "FullScreenDoc", "showDocumentURL", [{"url":url}]);


};


module.exports = new FullScreenDoc();
