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
        
        languagesFRC = Language.mr_fetchAllSorted(by: "name", ascending: true, with: nil, groupBy: nil, delegate: self) as! NSFetchedResultsController<Language> // again.. because of old objC API
        
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
        return languagesFRC.fetchedObjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageTableViewCell", for: indexPath) as! LanguageTableViewCell
        
        let lang = languagesFRC.object(at: indexPath)
        let vm = ListViewModel(model: lang)
        cell.viewModel = vm
        
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vm = (tableView.cellForRow(at: indexPath) as! LanguageTableViewCell).viewModel!
        vm.setSeen()
        
        
        let vc = LanguageDetailViewController(language: languagesFRC.object(at: indexPath))
        navigationController?.pushViewController(vc, animated: true)
    }
}
