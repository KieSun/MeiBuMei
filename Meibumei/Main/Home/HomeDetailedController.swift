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
        view.backgroundColor = UIColor.whiteColor()
        setupRightBarButton()
        setupTableView()
        loadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setupHeadView()
    }
    
    private func setupRightBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "bigPicture_share"), style: .Done, target: self, action: #selector(shareAction))
    }
    
    @objc private func shareAction() {
        
    }

    private func setupHeadView() {
        headView = NSBundle.mainBundle().loadNibNamed("HomeDetailedHeadView", owner: nil, options: nil).first as? HomeDetailedHeadView
        headView?.model = superViewModel
        
        let content:String = (headView?.desLabel.text)!
        let attributes: [String: AnyObject] = [NSFontAttributeName: (headView?.desLabel.font)!]
        // 返回结果的rect
        var size = CGRect()
        // label的大小
        let labelSize = CGSizeMake(UIScreen.mainScreen().bounds.size.width - 20, CGFloat.max)
        //得到结果
        size = content.boundingRectWithSize(labelSize, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes:attributes , context: nil);

        
        let height = 210 + 60 + size.height + 20
        
        headView?.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, height)
        tableView.tableHeaderView = headView!
    }
    
    private func setupTableView() {
        tableView.registerNib(UINib(nibName: HomeDetailedCellID, bundle: nil),
                              forCellReuseIdentifier: HomeDetailedCellID)
        tableView.separatorStyle = .None
        // 系统自算高度 最低支持 ios8 就可以一行代码解决
        tableView.estimatedRowHeight = 300
    }
    
    private func loadData() {
        NetworkTool.getRequest(HomeDetailedApi + "\(superViewModel!.id)/1/2.6.json", success: {[weak self] (json) in
            
            if let result = json["result"].arrayObject {
                
                for (index, _) in result.enumerate () {
                    self?.cellData.append(Result(fromDictionary: result[index] as! NSDictionary))
                }
                self?.tableView.reloadData()
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
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
}
