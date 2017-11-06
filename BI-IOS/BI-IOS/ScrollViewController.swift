//
//  ScrollViewController.swift
//  BI-IOS
//
//  Created by Dominik Vesely on 31/10/2017.
//  Copyright © 2017 ČVUT. All rights reserved.
//

import Foundation
import UIKit

class ScrollViewController : UIViewController {
    

    weak var scrollView : UIScrollView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nil);
        self.title = "Table"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView();
        view.backgroundColor = .white
        
        // ----- Scroll View -----
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        // ----- Content View -----
        let contentView = UIView()
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
        }
        
        
        let v = UIView()
        v.backgroundColor = .red
        contentView.addSubview(v)
        v.snp.makeConstraints { (make) in
            make.top.left.equalTo(20)
            make.bottom.equalTo(-20);
            make.width.equalTo(1000)
            make.right.equalTo(-20)
            make.height.equalTo(50)
        }
        
        //na tvrdo napisu velikost
        //scrollView.contentSize = CGSize(width: 1000, height: 2000)
        
    }
}
