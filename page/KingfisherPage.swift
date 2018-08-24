//
//  KingfisherPage.swift
//  Swift-Common-Library
//
//  Created by mac book pro on 2018/8/23.
//  Copyright © 2018年 mac book pro. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class KingfisherPage: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        //使用Kingfisher原生方法加载图片
        let imageView1 = UIImageView()
        imageView1.frame = CGRect(x: 20, y: 84, width: 150, height: 150)
        self.view.addSubview(imageView1)
        imageView1.kf.setImage(with: ImageResource(downloadURL: URL(string: "http://s1.sinaimg.cn/large/006obi0izy7fbFW0aaP87.jpeg")!))
        
        //使用自定义扩展方法加载图片 sk_image为扩展方法
        let imageView2 = UIImageView()
        imageView2.frame = CGRect(x: 20, y: 84 + 150 + 20, width: 150, height: 150)
        self.view.addSubview(imageView2)
        imageView2.sk_Image(url: "http://s1.sinaimg.cn/large/006obi0izy7fbFW0aaP87.jpeg")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//UIImageView方法扩展
extension UIImageView {
    func sk_Image(url: String){
        self.kf.setImage(with: ImageResource(downloadURL: URL(string: url)!))
    }
}
