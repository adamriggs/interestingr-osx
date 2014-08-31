//
//  NetworkController.swift
//  Interestingr
//
//  Created by Adam Riggs on 8/30/14.
//  Copyright (c) 2014 Adam Riggs. All rights reserved.
//

import Cocoa

class NetworkController: NSObject {
    
//    func searchItunesFor(searchTerm: String) {
//        
//        // The iTunes API wants multiple terms separated by + symbols, so replace spaces with + signs
//        let itunesSearchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
//        
//        // Now escape anything else that isn't URL-friendly
//        if let escapedSearchTerm = itunesSearchTerm.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding) {
//            let urlPath = "http://itunes.apple.com/search?term=\(escapedSearchTerm)&media=software"
//            let url: NSURL = NSURL(string: urlPath)
//            let session = NSURLSession.sharedSession()
//            let task = session.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
//                println("Task completed")
//                if(error != nil) {
//                    // If there is an error in the web request, print it to the console
//                    println(error.localizedDescription)
//                }
//                var err: NSError?
//                
//                var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSDictionary
//                if(err != nil) {
//                    // If there is an error parsing JSON, print it to the console
//                    println("JSON Error \(err!.localizedDescription)")
//                }
//                let results: NSArray = jsonResult["results"] as NSArray
//                dispatch_async(dispatch_get_main_queue(), {
//                    self.tableData = results
//                    self.appsTableView!.reloadData()
//                    })
//                })
//            
//            task.resume()
//        }
//    }
    
    func getNetReq(reqString:String){
        let mySession = NSURLSession.sharedSession()
        let url:NSURL = NSURL(string:reqString)
        println("1")
        let networkTask = mySession.dataTaskWithURL(url, completionHandler : {data, response, error -> Void in
            var err:NSError?
//            var theJSON = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSMutableDictionary
//            let results : NSArray = theJSON["data"]!["children"] as NSArray
            dispatch_async(dispatch_get_main_queue(), {
                println(data)
                println("\n")
                println(response)
                })
            })
        println("2")
        networkTask.resume()
        println("3")
    }

}
