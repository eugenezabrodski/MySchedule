//
//  ContactsViewController.swift
//  MySchedule
//
//  Created by Eugene on 29/01/2024.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
    let idContactsCell = "idOptionsTasksCell"
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.949019134, green: 0.9490200877, blue: 0.9705253243, alpha: 1)
        tableView.separatorStyle = .singleLine
        tableView.register(ContactsTableViewCell.self, forCellReuseIdentifier: idContactsCell)
        title = "Contacts"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTap))
    }
    
    @objc func addButtonTap() {
        let vc = ContactsOptionTableViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idContactsCell, for: indexPath) as! ContactsTableViewCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tap Contact")
    }
    
    
}
