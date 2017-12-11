//
//  SharedCanvasViewController.swift
//  BI-IOS
//
//  Created by Jan Misar on 11.12.17.
//  Copyright © 2017 ČVUT. All rights reserved.
//

import UIKit

class SharedCanvasViewController: UIViewController {
    
    weak var scrollView: UIScrollView!
    weak var canvasView: CanvasView!
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        self.scrollView = scrollView
        
        let canvasView = CanvasView()
        scrollView.addSubview(canvasView)
        canvasView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.height.equalTo(1000)
        }
        self.canvasView = canvasView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.panGestureRecognizer.minimumNumberOfTouches = 2
        scrollView.panGestureRecognizer.require(toFail: canvasView.drawingRecognizer)
    }

}
