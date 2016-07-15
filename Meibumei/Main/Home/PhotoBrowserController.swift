//
//  PhotoBrowserController.swift
//  Meibumei
//
//  Created by 俞诚恺 on 16/7/15.
//  Copyright © 2016年 Kie. All rights reserved.
//

import UIKit
import SnapKit

class PhotoBrowserController: UIViewController {

    var imageArray: [String] = {
        let imageArray = [String]()
        return imageArray
    }()
    
    var imageCount: Int?
    
    var collectionView: UICollectionView?
    var bottomSmallView: ShareAndBuyView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupFlowLayout()
    }
    
    private func setupBackButton() {
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "back_white"), forState: .Normal)
        backButton.addTarget(self, action: #selector(back), forControlEvents: .TouchDown)
        view.addSubview(backButton)
        
        backButton.snp_makeConstraints { (make) in
            make.top.left.equalTo(20)
        }
    }
    
    private func setupBottomView() {
        bottomSmallView = NSBundle.mainBundle().loadNibNamed("ShareAndBuyView", owner: nil, options: nil).last as? ShareAndBuyView
        bottomSmallView?.alpha = 0.5
        view.addSubview(bottomSmallView!)
        
        bottomSmallView!.snp_makeConstraints { (make) in
            make.left.bottom.right.equalTo(view)
            make.height.equalTo(50)
        }
    }
    
    private func back() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    private func setupFlowLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        flowLayout.scrollDirection = .Horizontal
        flowLayout.itemSize = CGSizeMake(ScreenWidth, ScreenHeight)
        
        collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: flowLayout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.pagingEnabled = true
        collectionView?.bounces = false
        collectionView?.registerClass(PhotoBrowserCell.self, forCellWithReuseIdentifier: PhotoBrowserCellID)
        view.addSubview(collectionView!)
        
        collectionView?.snp_makeConstraints(closure: { (make) in
            make.edges.equalTo(view)
        })
    }

}

extension PhotoBrowserController: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imageCount ?? 0
    }
}

extension PhotoBrowserController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(PhotoBrowserCellID, forIndexPath: indexPath) as! PhotoBrowserCell
        
        cell.backgroundColor = UIColor.blackColor()
        cell.imageString = imageArray[indexPath.row]
        return cell
    }
}
