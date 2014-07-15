TiWebView
=========

This is a simple extension to Appcelerator Titanium that allows you to set cookies and delete cookiew for TiWebViews on iOS.



Installation
------------


1. Add the following to the `<modules>` tag in your `tiapp.xml`.

```xml
<modules>
    <module version="0.1">com.mobmaxime.TiWebview</module>
</modules>
```
2. Copy the file titled `com.mobmaxime.TiWebview-iphone-0.1.zip` into your Titanium project Directory. Titanium will automatically unzip this and place the appropriate files in the `modules/` directory.


Usage
-----


Make sure to require the module like so:

```javascript
var TiWebview = require('com.mobmaxime.TiWebview');
```

List out the Cookie OR Get All Cookie for Webview : 

```javascript

var Cookies = TiWebview.listCookies('http://github.com/JigarM');
for (var key in Cookies) {
    Ti.API.info('Name ==> ' + key + ' and Value ==>: ' + Cookies[key]);
}
```


The whole thing for getting All cookies of UIWebview:

```javascript
var webview = Ti.UI.createWebView({
    url : 'http://github.com/JigarM'
});

webview.addEventListener('load', function(e) {
    var url = e.url;
    Ti.API.info('Cookies of URL ==>  ' + url);
    
    var Cookies = TiWebview.listCookies(url);
    var count = 0;
    for (var key in Cookies) {
        Ti.API.info('Name ==> ' + key + ' and Value ==>: ' + Cookies[key]);
        count++;
    }

    if (Cookies.logged_in) {
        Ti.API.info('is logged_in? ==> ' + Cookies.logged_in);
    }
});

```

You can Delete the UIWebview Cookies using following Method : 

```javascript
TiWebview.deleteAllCoockie("github.com");
```


TODO
----
* Create validation to check values passed for cookie / user agent
* Need to Make theAndroid version
