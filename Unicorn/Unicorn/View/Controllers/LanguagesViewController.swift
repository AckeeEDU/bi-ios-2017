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
    
    var languages: [Language] = []
    
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
        tableView.register(LanguageTableViewCell.self, forCellReuseIdentifier: "LanguageTableViewCell")
        
        refreshData() // in viewDidLoad? what about manual refresh?
    }
    
    func refreshData() {
        APIService.shared.languages(success: { [weak self] value in
            self?.languages = value
            self?.tableView.reloadData()
        }, failure: { error in
            print(error) // what to do with error?
        })
        
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageTableViewCell", for: indexPath) as! LanguageTableViewCell
        
        cell.language = languages[indexPath.row]
        
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = LanguageDetailViewController(language: languages[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}
