//
//  HomeProductDetailsController.swift
//  Meibumei
//
//  Created by 俞诚恺 on 16/7/14.
//  Copyright © 2016年 Kie. All rights reserved.
//

import UIKit
import SnapKit
class HomeProductDetailsController: UIViewController {

    var productModel: Result?
    var topView: UserView?
    var bottomView: ShareAndBuyView?
    var bottomSmallView: ShareAndBuyView?
    var tableView: UITableView?
    
    var oldOffset: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.whiteColor()
        automaticallyAdjustsScrollViewInsets = false 
        title = "\(productModel!.product.imageCount)张图片"
        
        setupBottomView()
        setupTopView()
        setupTableView()
    }
    
    private func setupBottomView() {
        bottomView = NSBundle.mainBundle().loadNibNamed("ShareAndBuyView", owner: nil, options: nil).first as? ShareAndBuyView
        view.addSubview(bottomView!)
        
        bottomView!.snp_makeConstraints { (make) in
            make.left.bottom.right.equalTo(view)
            make.height.equalTo(150)
        }
        
        bottomView!.model = productModel
        
        bottomSmallView = NSBundle.mainBundle().loadNibNamed("ShareAndBuyView", owner: nil, options: nil).last as? ShareAndBuyView
        bottomSmallView?.alpha = 0.5
        view.insertSubview(bottomSmallView!, belowSubview: bottomView!)
        
        bottomSmallView!.snp_makeConstraints { (make) in
            make.left.bottom.right.equalTo(view)
            make.height.equalTo(50)
        }
    }
    
    private func setupTopView() {
        topView = NSBundle.mainBundle().loadNibNamed("UserView", owner: nil, options: nil).first as? UserView
        view.addSubview(topView!)
        
        topView!.snp_makeConstraints { (make) in
            make.left.right.equalTo(view)
            make.height.equalTo(40)
            make.top.equalTo(64)
        }
        
        topView!.model = productModel

    }
    
    private func setupTableView() {
        tableView = UITableView()
        view.insertSubview(tableView!, atIndex: 0)
        tableView!.backgroundColor = UIColor.yellowColor()
        tableView!.delegate = self
        tableView!.dataSource = self
        tableView?.showsVerticalScrollIndicator = false
        
        tableView?.bounces = false
        tableView!.registerNib(UINib(nibName: ProductDetailedCellID, bundle: nil), forCellReuseIdentifier: ProductDetailedCellID)
        
        tableView!.snp_makeConstraints { (make) in
            make.left.right.bottom.equalTo(view)
            make.top.equalTo(topView!.snp_bottom)
        }
    }
}

extension HomeProductDetailsController: UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productModel!.product.imageCount
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.y + 10 > oldOffset {
            navigationController?.setNavigationBarHidden(true, animated: true)
            
            topView?.snp_updateConstraints(closure: { (make) in
                make.top.equalTo(-64)
            })
            
            bottomView?.snp_updateConstraints(closure: { (make) in
                make.bottom.equalTo(150)
            })
            
            view.setNeedsUpdateConstraints()
            
            UIView.animateWithDuration(0.5) { [weak self] in
                self?.view.layoutIfNeeded()
            }
            
        }else if scrollView.contentOffset.y + 10 < oldOffset {
            navigationController?.setNavigationBarHidden(false, animated: true)
            topView?.snp_updateConstraints(closure: { (make) in
                make.top.equalTo(64)
            })
            
            bottomView?.snp_updateConstraints(closure: { (make) in
                make.bottom.equalTo(view)
            })
            
            view.setNeedsUpdateConstraints()
            
            UIView.animateWithDuration(0.5) { [weak self] in
                self?.view.layoutIfNeeded()
            }
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = PhotoBrowserController()
        
        let urlArray = productModel?.product.imageUrls.componentsSeparatedByString(",")
        vc.imageCount = productModel?.product.imageCount
        vc.imageArray = urlArray!
        presentViewController(vc, animated: true, completion: nil)
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        oldOffset = scrollView.contentOffset.y
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let urlArray = productModel?.product.imageUrls.componentsSeparatedByString(",")
        let string = urlArray![indexPath.row]
        let height = string[82...84] as NSString
        let width = string[87...89] as NSString
        
        if width.containsString("w") {
            return 200
        }else {
            let scale = CGFloat(width.intValue) / ScreenWidth
            return CGFloat(height.intValue) * scale
        }
        
    }
}

extension HomeProductDetailsController: UITableViewDataSource {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(ProductDetailedCellID) as? ProductDetailedCell
        let urlArray = productModel?.product.imageUrls.componentsSeparatedByString(",")
        cell?.urlString = urlArray![indexPath.row]
        return cell!
    }
}
