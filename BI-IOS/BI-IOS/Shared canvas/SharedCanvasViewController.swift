//
//  SharedCanvasViewController.swift
//  BI-IOS
//
//  Created by Jan Misar on 11.12.17.
//  Copyright © 2017 ČVUT. All rights reserved.
//

import UIKit

class SharedCanvasViewController: UIViewController {

    weak var canvasView: CanvasView!
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        
        let canvasView = CanvasView()
        view.addSubview(canvasView)
        canvasView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        self.canvasView = canvasView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
