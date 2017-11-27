//
//  LanguagesViewController.swift
//  Unicorn
//
//  Created by Jan Misar on 27.11.17.
//  Copyright © 2017 Jan Misar. All rights reserved.
//

import UIKit

class LanguagesViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    weak var tableView: UITableView!
    
    override func loadView() {
        super.loadView()
        
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(tableView.superview!)
        }
        self.tableView = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        refreshData() // in viewDidLoad? what about manual refresh?
    }
    
    func refreshData() {
        
        APIService.shared.languages(success: { value in
            print(value) // process value, reload table...
        }, failure: { error in
            print(error) // what to do with error?
        })
        
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // push detail...
    }
}
