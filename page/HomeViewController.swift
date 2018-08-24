//
//  HomePage.swift
//  Swift-Common-Library
//
//  Created by mac book pro on 2018/8/22.
//  Copyright © 2018年 mac book pro. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //懒加载
    lazy var tableView: UITableView = {
        var tableView = UITableView(frame: CGRect(x: 0, y: 64, width: self.view.frame.size.width, height: self.view.frame.size.height))
        //不显示多余的分割线
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        return tableView
    }()
    let dataArray:[String] = ["ALamofire", "SnapKit", "Kingfisher", "HandyJson"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        //添加tableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableViewCell")
        self.view.addSubview(self.tableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
        cell.textLabel?.text = self.dataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //取消cell的选中效果
        Cell_Cancel_Select(tableView: tableView)
        
        var viewController = UIViewController()
        switch indexPath.row {
        case 0:
            viewController = AlamofirePage()
            break
        case 1:
            viewController = SnapKitPage()
            break
        case 2:
            viewController = KingfisherPage()
            break
        case 3:
            viewController = HandyJsonPage()
            break
        default:
            viewController.view.backgroundColor = UIColor.white
        }
        viewController.title = self.dataArray[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
