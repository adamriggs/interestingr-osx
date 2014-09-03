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
    var interestingnessArrayCurrendID = 0
    
    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        // Insert code here to initialize your application
        var flickr = NetworkController()
        flickr.parent = self
        
        flickr.getXML("https://api.flickr.com/services/rest/?method=flickr.interestingness.getList&api_key=2b6e6ffa4d1850dad7ee4973d77d6edf")
    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }
    
    func flickrLoaded(urlString: String){
        //println("flickrLoaded()")
        interestingnessArray.append(urlString)
        displayNextImage(interestingnessArray.count-1)
    }
    
    func displayNextImage(id: Int){
        var nextId: Int = id
        
        if(id<(interestingnessArray.count-1)){
            nextId++
        }
        
        if(id>(interestingnessArray.count-1)){
            nextId = 0
        }
        
        if(id<0){
            nextId = 0
        }
        
        interestingnessArrayCurrendID = nextId
        var url:NSURL = NSURL.URLWithString(interestingnessArray[interestingnessArrayCurrendID])
        mainImage.image = NSImage(byReferencingURL: url)
    }

}

