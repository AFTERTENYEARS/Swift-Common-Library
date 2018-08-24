//
//  SnapKitPage.swift
//  Swift-Common-Library
//
//  Created by mac book pro on 2018/8/23.
//  Copyright © 2018年 mac book pro. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class SnapKitPage: UIViewController {
    
    lazy var box: UIView = {
        var box = UIView()
        box.frame = CGRect(x: 20, y: 84, width: self.view.frame.size.width - 40, height: self.view.frame.size.height - 64 - 40)
        box.layer.borderWidth = 1.0;
        box.layer.borderColor = UIColor.red.cgColor
        return box
    }()
    
    lazy var view1: UIView = {
        var view1 = UIView()
        view1.backgroundColor = UIColor.randomColor
        return view1
    }()
    
    lazy var view2: UIView = {
        var view2 = UIView()
        view2.backgroundColor = UIColor.randomColor
        return view2
    }()
    
    lazy var view3: UIView = {
        var view3 = UIView()
        view3.backgroundColor = UIColor.randomColor
        return view3
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(self.box)
        
        //左上
        self.box.addSubview(self.view1)
        self.view1.snp.makeConstraints { (make) in
            make.left.top.equalTo(20)
            make.width.height.equalTo(50)
        }
        
        //中心
        self.box.addSubview(self.view2)
        self.view2.snp.makeConstraints { (make) in
            make.center.equalToSuperview("0")
            make.height.width.equalTo(50)
        }
        //右下
        self.box.addSubview(self.view3)
        self.view3.snp.makeConstraints { (make) in
            make.right.bottom.equalTo(-20)
            make.height.width.equalTo(50)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
