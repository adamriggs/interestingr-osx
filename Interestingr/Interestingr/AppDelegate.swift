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


    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        // Insert code here to initialize your application
        var net = NetworkController()
        
        net.getNetReq("https://api.flickr.com/services/rest/?method=flickr.interestingness.getList&api_key=2b6e6ffa4d1850dad7ee4973d77d6edf")
    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }


}

