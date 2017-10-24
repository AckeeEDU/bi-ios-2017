//
//  BubblesViewController.swift
//  BI-IOS
//
//  Created by Jan Misar on 17.10.17.
//  Copyright © 2017 ČVUT. All rights reserved.
//

import UIKit

class BubblesViewController: UIViewController {

    weak var fireButton: UIButton!
    weak var pushButton: UIButton!
    weak var contentView: UIView!
    
    
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        
        let contentView = UIView(frame: view.bounds)
        view.addSubview(contentView)
        self.contentView = contentView
        
        let fireButton = UIButton(frame: CGRect(x: 20, y: 40, width: 100, height: 40))
        fireButton.setTitle("Fire", for: .normal)
        fireButton.setTitleColor(.white, for: .normal)
        fireButton.backgroundColor = .black
        view.addSubview(fireButton)
        self.fireButton = fireButton
        
        let pushButton = UIButton()
        pushButton.setTitle("Push", for: .normal)
        pushButton.setTitleColor(.white, for: .normal)
        pushButton.backgroundColor = .black
        view.addSubview(pushButton)
        pushButton.snp.makeConstraints { make in
            make.trailing.equalTo(-10)
            make.top.equalTo(self.topLayoutGuide.snp.bottom).offset(10)
        }
        self.pushButton = pushButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Bubbles viewControler"
        
        fireButton.addTarget(self, action: #selector(fireButtonTapped(_:)), for: .touchUpInside)
        pushButton.addTarget(self, action: #selector(pushButtonTapped(_:)), for: .touchUpInside)
        print("BubblesViewController did load.")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("BubblesViewController will appear.")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("BubblesViewController did appear.")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("BubblesViewController will disappear.")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("BubblesViewController did disappear.")
    }
    
    @objc func fireButtonTapped(_ sender: UIButton) {
        
        contentView.subviews.forEach { $0.removeFromSuperview() }
        
        for _ in 1...20 {
            
            let size = CGFloat(arc4random_uniform(UInt32(view.bounds.width/2)))
            let x = CGFloat(arc4random_uniform(UInt32(view.bounds.width-size)))
            let y = CGFloat(arc4random_uniform(UInt32(view.bounds.height-size)))
            
            let red = CGFloat(arc4random())/CGFloat(UInt32.max)
            let green = CGFloat(arc4random())/CGFloat(UInt32.max)
            let blue = CGFloat(arc4random())/CGFloat(UInt32.max)
            
            let aView = UIView(frame: CGRect(x: x, y: y, width: size, height: size))
            aView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
            aView.layer.cornerRadius = size/2
            contentView.addSubview(aView)
        }
    }

    @objc func pushButtonTapped(_ sender: UIButton) {
        navigationController?.pushViewController(ViewController(), animated: true)
    }
}













