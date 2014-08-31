//
//  NetworkController.swift
//  Interestingr
//
//  Created by Adam Riggs on 8/30/14.
//  Copyright (c) 2014 Adam Riggs. All rights reserved.
//

import Cocoa

class NetworkController: NSObject, NSXMLParserDelegate {
    
    var flickrOutput = ""
    
    func getNetReq(reqString:String){
        let mySession = NSURLSession.sharedSession()
        let url:NSURL = NSURL(string:reqString)
        
        let networkTask = mySession.dataTaskWithURL(url, completionHandler : {data, response, error -> Void in
            var err:NSError?
//            var theJSON = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSMutableDictionary
//            let results : NSArray = theJSON["data"]!["children"] as NSArray
            //var xml = NSXMLParser(data: data)
            dispatch_async(dispatch_get_main_queue(), {
                println(data)
                //println("\n")
                //println(response)
                })
            })
        networkTask.resume()
    }
    
    func getXML(reqString:String){
        //var parser = NSXMLParser()
        var url: NSURL = NSURL.URLWithString(reqString)
        
        var parser = NSXMLParser (contentsOfURL: url)
        
        parser.delegate = self
        
        parser.shouldProcessNamespaces = false
        
        parser.shouldReportNamespacePrefixes = false
        
        parser.shouldResolveExternalEntities = false
        
        parser.parse()
    }
    
    func parser(parser: NSXMLParser!, didStartElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: NSDictionary!) {
        //println("Element's name is \(elementName)")
        //println("Element's attributes are \(attributeDict)")
        
        //https://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg
        
        var file = "/Users/adam/Documents/Experiments/swift/osx/interestingr-osx/interestingness.html"
        
        if(elementName == "photo"){
            //println(attributeDict["farm"])
            flickrOutput += "<img src ='https://farm"
            flickrOutput += attributeDict["farm"] as NSString
            flickrOutput += ".staticflickr.com/"
            flickrOutput += attributeDict["server"] as NSString
            flickrOutput += "/"
            flickrOutput += attributeDict["id"] as NSString
            flickrOutput += "_"
            flickrOutput += attributeDict["secret"] as NSString
            flickrOutput += ".jpg' />\n"
        }
        
        //println(flickrOutput)
        flickrOutput.writeToFile(file, atomically: true, encoding: NSUTF8StringEncoding, error: nil)
        
    }

}
