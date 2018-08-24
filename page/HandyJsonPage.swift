//
//  HandyJsonPage.swift
//  Swift-Common-Library
//
//  Created by mac book pro on 2018/8/23.
//  Copyright © 2018年 mac book pro. All rights reserved.
//

import Foundation
import UIKit
import HandyJSON

class HandyJsonPage: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let url = "https://httpbin.org/post"
        AlamofireRequest(.post, URLString: url, parameters: nil) { (jsonString) in
            print(jsonString)

            let model = Model.deserialize(from: jsonString)

            print(model!.url!)
            print(model!.headers!.Host!)
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

func DictionaryFromJSONString(jsonString:String) ->NSDictionary{
    let jsonData:Data = jsonString.data(using: .utf8)!
    
    let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
    if dict != nil {
        return dict as! NSDictionary
    }
    return NSDictionary()
}

//HandyJson model 配合JSONExport使用

struct Model: HandyJSON {
    var args : Arg!
    var data : String!
    var files : Arg!
    var form : Arg!
    var headers : Header!
    var json : AnyObject!
    var origin : String!
    var url : String!
}

struct Header:HandyJSON{
    var accept : String!
    var acceptEncoding : String!
    var acceptLanguage : String!
    var authorization : String!
    var connection : String!
    var contentLength : String!
    var Host : String!
    var userAgent : String!
    var xUserClient : String!
}

struct Arg: HandyJSON{
    var k : String!
}
