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
    
    var interestingnessArray: [String] = []
    
    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        // Insert code here to initialize your application
        var flickr = NetworkController()
        flickr.parent = self
        
        flickr.getXML("https://api.flickr.com/services/rest/?method=flickr.interestingness.getList&api_key=2b6e6ffa4d1850dad7ee4973d77d6edf")
        
        var url:NSURL = NSURL.URLWithString("https://farm4.staticflickr.com/3858/14917248907_091bcded99.jpg")
//        var data:NSData = NSData.dataWithContentsOfURL(url, options: nil, error: nil)
        //mainImage.image = NSImage(byReferencingURL: url)
    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }
    
    func flickrLoaded(urlString: String){
        println("flickrLoaded()")
        interestingnessArray.append(urlString)
        var url:NSURL = NSURL.URLWithString(urlString)
        mainImage.image = NSImage(byReferencingURL: url)
    }

}

