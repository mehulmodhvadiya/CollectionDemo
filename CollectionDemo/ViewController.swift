//
//  ViewController.swift
//  CollectionDemo
//
//  Created by Verve Mac on 14/06/18.
//  Copyright © 2018 Verve Mac. All rights reserved.
//

import UIKit

let ITEM_SPACING = 10
let kHorizontalInsets = 10
let kVerticalInsets = 10
let ITEMS_PER_ROW = 2

class ViewController: UIViewController {
    
    let cellReusableIdentifier = "CollectionViewCell"
    
    var arrList = [String]()
    
    @IBOutlet weak var collectionView : UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrList = ["saavaj","saavaj1","saavaj2","saavaj3"]
        
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellReusableIdentifier)
        
      //  collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellReusableIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReusableIdentifier, for: indexPath) as! CollectionViewCell
        
        cell.label.text = arrList[indexPath.row]
        
        return cell
        
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        return CGSize(width: 172, height: 172)
//    }

    
}
extension ViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    //MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        var itemWidth : Int
        var itemHeight : Int
        itemWidth = (Int((collectionView.bounds.size.width - (1+CGFloat (ITEMS_PER_ROW))*CGFloat(kHorizontalInsets))/CGFloat(ITEMS_PER_ROW)))
        itemHeight = itemWidth * 1
      //  viewHightFixedCenter.constant = ((itemHeight * 3) +( * 4))
        
        return CGSize(width: itemWidth,height :138)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsetsMake(CGFloat(20), CGFloat(kHorizontalInsets), CGFloat(20), CGFloat(kHorizontalInsets))
    }

}

