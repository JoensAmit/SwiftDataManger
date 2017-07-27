//
//  ServerJsonManager.swift
//  ISOSuSwiftV
//
//  Created by Amit Tiwari on 5/18/17.
//  Copyright © 2017 amit tiwari. All rights reserved.
//

import UIKit

protocol ReponseObjectOfJson: class
{
    func Respondata(_ text: Any)
}


class ServerJsonManager: NSObject
{
//    class var sharedInstance: ServerJsonManager
//    {
//        struct Static {
//            static var instance: ServerJsonManager?
//            static var token = {0}()
//        }
//        
//        _ = Static.token
//        
//        return Static.instance!
//    }
    
    weak var delegateResponsData: ReponseObjectOfJson?
    
    func CallAPIwithRequest(urlReq:URLRequest)
    {
        let session = URLSession.shared
        let task = session.dataTask(with: urlReq as URLRequest) {
            (
            data, response, error) in
            
            guard let data = data, let _:URLResponse = response, error == nil else {
                print("error")
                return
            }
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            self.delegateResponsData?.Respondata(json)
            
            // print(json as Any)
        }
        
        task.resume()
    }
    
}
