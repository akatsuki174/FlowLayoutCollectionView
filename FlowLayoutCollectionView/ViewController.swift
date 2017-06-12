//
//  ViewController.swift
//  FlowLayoutCollectionView
//
//  Created by akatsuki174 on 2017/06/11.
//  Copyright © 2017年 akatsuki174. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let items = ["aaaaaaa", "bb", "cccccccccccccc", "ddd", "eeeeeeeeeeeeeeeeeeeee"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        if let layout = self.collectionView.collectionViewLayout as? CollectionViewFlowLayoutLeftAlign {
            layout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        collectionView.register(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "CustomCell")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.backgroundColor = UIColor.brown
        cell.label.text = items[Int(arc4random_uniform(5))]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let cell = CustomCell.fromNib() {
            cell.contentView.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
        }
        
        return CGSize.zero
    }
}

