# TiWebview Module

## Description

This is a simple extension to Appcelerator Titanium that allows you to set cookies and delete cookiew for TiWebViews on iOS.

## Accessing the TiWebview Module

To access this module from JavaScript, you would do the following:

	var TiWebview = require("com.mobmaxime.TiWebview");

The TiWebview variable is a reference to the Module object.	

## Requirements

* iOS version 4.3 or later
* Xcode 4.5 or later

The SDK also requires that the following frameworks are available when you build your application:

* Foudation


## Reference

See Sample Here : https://github.com/JigarM/TiWebView


## Functions


### TiWebview.listCookies(arg)

It returns a List of coockies object of Current Webview Object.

#### Arguments

parameter(arg): A Simple Webview URL..

#### Example:

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

### TiWebview.deleteAllCoockie(arg)

It Deletes a List of coockies object of Provided URL..

#### Arguments

parameter(arg): A Domain or URL..

#### Example:

    TiWebview.deleteAllCoockie("github.com");


## Usage

See example.

## Author

Jigar Maheshwari

## License

Copyright(c) 2014 by Mobmaxime. All Rights Reserved. Please see the LICENSE file included in the distribution for further details.
