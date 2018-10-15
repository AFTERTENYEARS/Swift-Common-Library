//
//  AlamofirePage.swift
//  Swift-Common-Library
//
//  Created by mac book pro on 2018/8/22.
//  Copyright © 2018年 mac book pro. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class AlamofirePage: UIViewController {
    
    var urlLabel = UILabel()
    var jsonTextView = UITextView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let buttonArray = ["get", "post", "put", "delete"]
        
        for (index, item) in buttonArray.enumerated() {
            
            let width: CGFloat = 60
            let height: CGFloat = 30.0
            let x: CGFloat = 40.0
            let y: CGFloat = 84.0 + CGFloat((10 + 30) * index)
            
            let button = UIButton(frame: CGRect(x: x, y: y, width: width, height: height))
            button.backgroundColor = UIColor.brown
            button.layer.cornerRadius = 4.0
            button.setTitle(item, for: UIControl.State.normal)
            self.view.addSubview(button)
            
            switch index {
            case 0:
                button.addTarget(self, action: #selector(self.ClickGet), for: UIControl.Event.touchUpInside)
                break
            case 1:
                button.addTarget(self, action: #selector(self.ClickPost), for: UIControl.Event.touchUpInside)
                break
            case 2:
                button.addTarget(self, action: #selector(self.ClickPut), for: UIControl.Event.touchUpInside)
                break
            default:
                button.addTarget(self, action: #selector(self.ClickDelete), for: UIControl.Event.touchUpInside)
                break
            }
        }
        
        urlLabel.backgroundColor = UIColor.brown
        urlLabel.textColor = UIColor.white
        urlLabel.frame = CGRect(x: 140, y: 84 + 40, width: self.view.frame.size.width - 180, height: 70)
        urlLabel.layer.masksToBounds = true
        urlLabel.layer.cornerRadius = 4.0
        urlLabel.numberOfLines = 0
        self.view.addSubview(urlLabel)
        
        jsonTextView.backgroundColor = UIColor.brown
        jsonTextView.textColor = UIColor.white
        jsonTextView.frame = CGRect(x: 40, y: 84 + 170, width: self.view.frame.size.width - 80, height: self.view.frame.size.height - 84 - 170 - 20)
        jsonTextView.layer.masksToBounds = true
        jsonTextView.layer.cornerRadius = 4.0
        self.view.addSubview(jsonTextView)
    }
    
    @objc func ClickGet() {
        let url = "https://httpbin.org/get"
        AlamofireRequest(.get, URLString: url, parameters: nil) { (jsonString) in
            print(jsonString)
            self.jsonTextView.text = jsonString
        }
        urlLabel.text = url
    }
    
    @objc func ClickPost() {
        let url = "https://httpbin.org/post"
        AlamofireRequest(.post, URLString: url, parameters: nil) { (jsonString) in
            print(jsonString)
            self.jsonTextView.text = jsonString
        }
        urlLabel.text = url
    }
    
    @objc func ClickPut() {
        let url = "https://httpbin.org/put"
        AlamofireRequest(.put, URLString: url, parameters: nil) { (jsonString) in
            print(jsonString)
            self.jsonTextView.text = jsonString
        }
        urlLabel.text = url
    }
    
    @objc func ClickDelete() {
        let url = "https://httpbin.org/delete"
        AlamofireRequest(.delete, URLString: url, parameters: nil) { (jsonString) in
            print(jsonString)
            self.jsonTextView.text = jsonString
        }
        urlLabel.text = url
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


enum MethodType {
    case get
    case post
    case put
    case delete
}

func AlamofireRequest(
    _ type : MethodType,
    URLString : String,
    parameters : [String : Any]?,
    finishedCallback :  @escaping (_ jsonString : String) -> ()
    ){
    // 1.获取类型
    var method:HTTPMethod
    switch type {
    case .get:
        method = HTTPMethod.get
        break
    case .post:
        method = HTTPMethod.post
        break
    case .put:
        method = HTTPMethod.put
        break
    case .delete:
        method = HTTPMethod.delete
        break
    }
    // 2.发送网络请求
    let headers: HTTPHeaders = ["Authorization": "Bearer " + "这儿放服务器token",
                                "Accept": "application/json",
                                "x-user-client": "IOS"]
    
    Alamofire.request(URLString, method: method, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseString { (response) in
        //            print(response.response) // HTTP URL响应
        //            print(response.data)     // 服务器返回的数据
        //            print(response.result)   // 响应序列化结果，在这个闭包里，存储的是JSON数据
        //            print(response.result.value)  // 请求到的数据
        //网络状态码
        let statusCode = Int64(response.response!.statusCode)
        print("statusCode: " + String(statusCode))
        
        if (response.result.isSuccess) {
            finishedCallback(response.result.value!)
        } else {
            print("未请求至服务器")
        }
    }
}
