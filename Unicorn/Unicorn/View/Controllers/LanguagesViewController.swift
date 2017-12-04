//
//  LanguagesViewController.swift
//  Unicorn
//
//  Created by Jan Misar on 27.11.17.
//  Copyright © 2017 Jan Misar. All rights reserved.
//

import UIKit
import MagicalRecord

class LanguagesViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {

    weak var tableView: UITableView!
    
    var languagesFRC: NSFetchedResultsController<Language>!
    var languagesVMs : [ListViewModel] = []
    
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

//        let fetchRequest = NSFetchRequest<Language>(entityName: "Language")
//        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
//        languagesFRC = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: NSManagedObjectContext.mr_default(), sectionNameKeyPath: nil, cacheName: nil)
//        _ = try? languagesFRC.performFetch()
        
        
        languagesVMs = (Language.mr_findAll()?.map({ (object) in
            let lang = object as! Language
            return ListViewModel(model: lang)
        }))!
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(LanguageTableViewCell.self, forCellReuseIdentifier: "LanguageTableViewCell")
        
        refreshData() // in viewDidLoad? what about manual refresh?
    }
    
    func refreshData() {
        APIService.shared.languages(success: { [weak self] value in
            // seems to be useless now 😏
        }, failure: { error in
            print(error) // what to do with error?
        })
        
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.reloadData()
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languagesVMs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageTableViewCell", for: indexPath) as! LanguageTableViewCell
        
        let vm = languagesVMs[indexPath.row]
        cell.viewModel = vm
        
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        languagesVMs[indexPath.row].seen = true
        let vc = LanguageDetailViewController(language: languagesVMs[indexPath.row].model)
        navigationController?.pushViewController(vc, animated: true)
    }
}
