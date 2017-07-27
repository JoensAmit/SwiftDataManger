//
//  ViewController.swift
//  SwiftDataManager
//
//  Created by Amit Tiwari on 7/27/17.
//  Copyright © 2017 Amit Tiwari. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ReponseObjectOfJson
{
    let objcServer = ServerJsonManager()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self .testCameraView()
    }
    
    func testCameraView ()
    {
        let url:URL = URL(string: "https://www.googleapis.com/books/v1/volumes?q=isbn:0747532699")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        
        objcServer.CallAPIwithRequest(urlReq: request)
        self.objcServer.delegateResponsData = self
        
    }
    
    func Respondata(_ text: Any)
    {
        print(text);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

