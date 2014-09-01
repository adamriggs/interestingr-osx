//
//  AppDelegate.swift
//  Interestingr
//
//  Created by Adam Riggs on 8/29/14.
//  Copyright (c) 2014 Adam Riggs. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
                            
    @IBOutlet var window: NSWindow
    @IBOutlet var mainImage: NSImageView
    
    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        // Insert code here to initialize your application
        var flickr = NetworkController()
        
        flickr.getXML("https://api.flickr.com/services/rest/?method=flickr.interestingness.getList&api_key=2b6e6ffa4d1850dad7ee4973d77d6edf")
        
        var url:NSURL = NSURL.URLWithString("https://farm6.staticflickr.com/5557/15057740736_00fc1f196a.jpg")
//        var data:NSData = NSData.dataWithContentsOfURL(url, options: nil, error: nil)
        mainImage.image = NSImage(byReferencingURL: url)
    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }


}

