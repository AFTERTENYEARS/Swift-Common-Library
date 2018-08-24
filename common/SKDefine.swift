//
//  SKDefine.swift
//  Swift-Common-Library
//
//  Created by mac book pro on 2018/8/22.
//  Copyright © 2018年 mac book pro. All rights reserved.
//

import Foundation
import UIKit

//cell 取消cell选中效果
public func Cell_Cancel_Select(tableView: UITableView) {
    for item in tableView.visibleCells {
        item.setSelected(false, animated: true)
    }
}
