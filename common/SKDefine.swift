//
//  SKDefine.swift
//  Swift-Common-Library
//
//  Created by mac book pro on 2018/8/22.
//  Copyright © 2018年 mac book pro. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

//cell 取消cell选中效果
public func Cell_Cancel_Select(tableView: UITableView) {
    for item in tableView.visibleCells {
        item.setSelected(false, animated: true)
    }
}

//随机颜色
extension UIColor {
    open class var randomColor:UIColor{
        get {
            let red = CGFloat(arc4random()%256)/255.0
            let green = CGFloat(arc4random()%256)/255.0
            let blue = CGFloat(arc4random()%256)/255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
}

//UIImageView方法扩展
extension UIImageView {
    func sk_Image(url: String){
        self.kf.setImage(with: ImageResource(downloadURL: URL(string: url)!))
    }
}

// UIView属性扩展
extension UIView {
    public var left: CGFloat {
        get {
            return self.frame.origin.x
        }
        set(newLeft) {
            var frame = self.frame
            frame.origin.x = newLeft
            self.frame = frame
        }
    }
    public var top:CGFloat {
        get {
            return self.frame.origin.y
        }
        set(newTop) {
            var frame = self.frame
            frame.origin.y = newTop
            self.frame = frame
        }
    }
    public var width:CGFloat {
        get {
            return self.frame.size.width
        }
        set(newWidth) {
            var frame = self.frame
            frame.size.width = newWidth
            self.frame = frame
        }
    }
    public var height:CGFloat {
        get {
            return self.frame.size.height
        }
        set(newHeight) {
            var frame = self.frame
            frame.size.height = newHeight
            self.frame = frame
        }
    }
    public var right:CGFloat {
        get {
            return self.left + self.width
        }
    }
    public var bottom:CGFloat {
        get {
            return self.top + self.height
        }
    }
    public var centerX:CGFloat {
        get {
            return self.center.x
        }
        set(newCenterX) {
            var center = self.center
            center.x = newCenterX
            self.center = center
        }
    }
    public var centerY:CGFloat {
        get {
            return self.center.y
        }
        set(newCenterY) {
            var center = self.center
            center.y = newCenterY
            self.center = center
        }
    }
}

//NSDictionary方法扩展
extension NSDictionary {
    func sk_value(key: String) -> Any {
        return self.object(forKey:key) ?? []
    }
    func sk_string(key: String) -> String {
        if let value = self.object(forKey:key) {
            if (value is String) {
                return value as? String ?? ""
            } else if (value is Int) {
                return String(value as? Int ?? 0)
            } else {
                return ""
            }
        } else {
            return ""
        }
    }
    func sk_int(key: String) -> Int {
        if let value = self.object(forKey:key) {
            if (value is String) {
                let valueString: NSString = value as! String as NSString
                return valueString.integerValue
            } else if (value is Int) {
                return value as? Int ?? 0
            } else {
                return 0
            }
        } else {
            return 0
        }
    }
}
