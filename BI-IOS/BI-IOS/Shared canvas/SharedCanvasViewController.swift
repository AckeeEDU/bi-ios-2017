//
//  SharedCanvasViewController.swift
//  BI-IOS
//
//  Created by Jan Misar on 11.12.17.
//  Copyright © 2017 ČVUT. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SharedCanvasViewController: UIViewController, CanvasViewDelegate {
    
    weak var scrollView: UIScrollView!
    weak var canvasView: CanvasView!
    
    private var databaseReference: DatabaseReference!
    
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

        databaseReference = Database.database().reference().child("canvas")
        
        canvasView.delegate = self
        
        scrollView.panGestureRecognizer.minimumNumberOfTouches = 2
        scrollView.panGestureRecognizer.require(toFail: canvasView.drawingRecognizer)
        
        databaseReference.observe(.childAdded) { [weak self] snapshot in
            guard let pathDict = snapshot.value as? [String: Any] else {
                return
            }
            if let path = DrawingPath.deserialize(from: pathDict) {
                path.key = snapshot.key
                self?.canvasView.add(path: path)
            }
        }
        
        databaseReference.observe(.childRemoved) { [weak self] snapshot in
            self?.canvasView.remove(pathKey: snapshot.key)
        }
    }

    func canvasView(_ canvasView: CanvasView, didDrawPath path: DrawingPath) {
        
        let newPath = databaseReference.childByAutoId()
        path.key = newPath.key
        newPath.setValue(path.serialize()) // completion, failure... chtělo by to ošetřit 🤔
    }
}
