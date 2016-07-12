//
//  HomeTableViewController.swift
//  Meibumei
//
//  Created by 俞诚恺 on 16/7/11.
//  Copyright © 2016年 Kie. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    var homeData: [MbmGroupList] = {
        let homeData = [MbmGroupList]()
        return homeData
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "美不美"
        
        setupTableView()
        loadData()
    }
    
    private func setupTableView() {
        tableView.registerNib(UINib(nibName: HomeCellID, bundle: nil), forCellReuseIdentifier: HomeCellID)
        tableView.rowHeight = 200
    }

    private func loadData() {
        NetworkTool.getRequest(HomeApi, success: {[weak self] (json) in
            
            if let model = json["result"]["mbmGroupList"].arrayObject {
                
                for (index, _) in model.enumerate () {
                    self?.homeData.append(MbmGroupList(fromDictionary: model[index] as! NSDictionary))
                    self?.tableView.reloadData()
                }
            }
            }) { (error) in
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(HomeCellID) as? HomeTableViewCell
        cell?.model = homeData[indexPath.row]
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}


