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

extension UITableView {
    public func cell_cancel_select() {
        for item in self.visibleCells {
            item.setSelected(false, animated: true)
        }
    }
}

extension UIScreen {
    public var width: CGFloat {
        get {
            return UIScreen.main.bounds.size.width
        }
    }
    public var height: CGFloat {
        get {
            return UIScreen.main.bounds.size.height
        }
    }
    public var status_bar_h: CGFloat {
        get {
            return (UIScreen.main.bounds.size.height == 812.0 || UIScreen.main.bounds.size.height == 896.0) ? 44.0 : 20.0
        }
    }
    public var nav_bar_h: CGFloat {
        get {
            return 44.0
        }
    }
    public var status_nav_h: CGFloat {
        get {
            return (UIScreen.main.bounds.size.height == 812.0 || UIScreen.main.bounds.size.height == 896.0) ? 88.0 : 64.0
        }
    }
    public var tabbar_h: CGFloat {
        get {
            return 49.0
        }
    }
    public var bottom_line_h: CGFloat {
        get {
            return (UIScreen.main.bounds.size.height == 812.0 || UIScreen.main.bounds.size.height == 896.0) ? 34.0 : 0.0
        }
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
    func progenyViews(views: Array<UIView>) -> UIView{
        for view in views {
            self.addSubview(view)
        }
        return self
    }
    func finish() -> Void {
        
    }
}

//NSDictionary方法扩展
extension NSDictionary {
    
    func sk_value(key: String) -> Any {
        return self.object(forKey:key) ?? []
    }
    
    func sk_string(key: String) -> NSMutableString {
        if let value = self.object(forKey:key) {
            if (value is String) {
                let string = (value as? String ?? "") as NSString
                return string.mutableCopy() as! NSMutableString
            } else if (value is Int) {
                let string = String(value as? Int ?? 0)
                return string.mutableCopy() as! NSMutableString
            } else {
                return NSMutableString()
            }
        } else {
            return NSMutableString()
        }
    }
    
    func sk_int(key: String) -> Int {
        if let value = self.object(forKey:key) {
            if (value is String) {
                let string: NSString = value as! String as NSString
                return string.integerValue
            } else if (value is Int) {
                return value as? Int ?? 0
            } else {
                return 0
            }
        } else {
            return 0
        }
    }
    
    func sk_float(key: String) -> Float64 {
        if let value = self.object(forKey:key) {
            if (value is String) {
                let string: NSString = value as! String as NSString
                return Float64(string.floatValue)
            } else if (value is Int) {
                return value as? Float64 ?? 0
            } else if (value is Float64) {
                return value as? Float64 ?? 0
            } else {
                return 0
            }
        } else {
            return 0
        }
    }
    
    func sk_array(key: String) -> NSMutableArray {
        if let value = self.object(forKey:key) {
            if (value is NSArray) {
                let valueArray: NSArray = value as! NSArray
                return valueArray.mutableCopy() as! NSMutableArray
            } else {
                return NSMutableArray()
            }
        } else {
            return NSMutableArray()
        }
    }
    
    func sk_dic(key: String) -> NSMutableDictionary {
        if let value = self.object(forKey:key) {
            if (value is NSDictionary) {
                let valueDic: NSDictionary = value as! NSDictionary
                return valueDic.mutableCopy() as! NSMutableDictionary
            } else {
                return NSMutableDictionary()
            }
        } else {
            return NSMutableDictionary()
        }
    }
    
}
