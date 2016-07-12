//
//  HomeDetailedController.swift
//  Meibumei
//
//  Created by 俞诚恺 on 16/7/12.
//  Copyright © 2016年 Kie. All rights reserved.
//

import UIKit

class HomeDetailedController: UITableViewController {

    var headView: HomeDetailedHeadView?
    var superViewModel: MbmGroupList?
    var cellData: [Result] = {
        let cellData = [Result]()
        return cellData
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = superViewModel!.title
        view.backgroundColor = UIColor.yellowColor()
        loadData()
    }

    private func setupHeadView() {
        headView = HomeDetailedHeadView()
        headView?.frame = CGRectMake(0, 0, 0, CGRectGetMaxY((headView?.desLabel.frame)!))
        tableView.tableHeaderView = headView!
        
    }
    
    private func setupTableView() {
        tableView.registerNib(UINib(nibName: HomeDetailedCellID, bundle: nil),
                              forCellReuseIdentifier: HomeDetailedCellID)
    }
    
    private func loadData() {
        NetworkTool.getRequest(HomeDetailedApi + "\(superViewModel!.id)/1/2.6.json", success: {[weak self] (json) in
            
            if let result = json["result"].arrayObject {
                
                for (index, _) in result.enumerate () {
                    self?.cellData.append(Result(fromDictionary: result[index] as! NSDictionary))
                }
            }
            
        }) { (error) in
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(HomeDetailedCellID) as? HomeDetailedCell
        
        cell?.model = cellData[indexPath.row]
        return cell!
    }
}
