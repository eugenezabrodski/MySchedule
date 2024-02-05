//
//  ContactsOptionTableViewController.swift
//  MySchedule
//
//  Created by Eugene on 02/02/2024.
//

import UIKit

class ContactsOptionTableViewController: UITableViewController {
    
    private let idOptionsContactCell = "idOptionsContactCell"
    private let idOptionsContactHeader = "idOptionsContactHeader"
    
    private let headerNameArray = ["Name", "Telephone", "Mail", "Type", "Choose image"]
    private let cellNameArray = ["Name", "Phone", "Mail", "Type", ""]
    
    private var imageIsChanged = false
    private var contactModel = ContactModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.949019134, green: 0.9490200877, blue: 0.9705253243, alpha: 1)
        tableView.separatorStyle = .none
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: idOptionsContactCell)
        tableView.register(HeaderOptionsTableView.self, forHeaderFooterViewReuseIdentifier: idOptionsContactHeader)
        title = "Create contact"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTap))
    }
    
    @objc func saveButtonTap() {
        if contactModel.contactsName == "Unknown" || contactModel.contactsType == "Unknown" || contactModel.contactsPhone == "Unknown" {
            alertOKSave(title: "Error", message: "Required fileds: NAME, TYPE AND PHONE")
        } else {
            setImageModel()
            RealmManager.shared.saveContactModel(model: contactModel)
            contactModel = ContactModel()
            alertOKSave(title: "Success", message: "You saved the contact")
            tableView.reloadData()
        }
    }
    
    @objc private func setImageModel() {
        if imageIsChanged {
            let cell = tableView.cellForRow(at: [4,0]) as! OptionsTableViewCell
            
            let image = cell.backgroundViewCell.image
            guard let imageData = image?.pngData() else { return }
            contactModel.contactsImage = imageData
            
            cell.backgroundViewCell.contentMode = .scaleAspectFit
            imageIsChanged = false
        } else {
            contactModel.contactsImage = nil
        }
    }
    
    private func pushControllers(vc: UIViewController) {
        let viewController = vc
        navigationController?.navigationBar.topItem?.title = "Back"
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsContactCell, for: indexPath) as! OptionsTableViewCell
        cell.cellContactsConfigure(nameArray: cellNameArray, indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.section == 4 ? 200 : 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionsContactHeader) as! HeaderOptionsTableView
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        25
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! OptionsTableViewCell
        
        switch indexPath.section {
        case 0: alertForCellName(label: cell.nameCellLabel, name: "Name Contact", placeholder: "Enter name...") { text in
            self.contactModel.contactsName = text
        }
        case 1: alertForCellName(label: cell.nameCellLabel, name: "Phone Contact", placeholder: "Enter phone...") { text in
            self.contactModel.contactsPhone = text
        }
        case 2: alertForCellName(label: cell.nameCellLabel, name: "Mail Contact", placeholder: "Enter mail...") { text in
            self.contactModel.contactsMail = text
        }
        case 3: alertTypeContacts(label: cell.nameCellLabel) { type in
            self.contactModel.contactsType = type
        }
        default: alertCamera { [self] source in
            chooseImagePicker(source: source)
        }
        }
    }
    
}

extension ContactsOptionTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let cell = tableView.cellForRow(at: [4,0]) as! OptionsTableViewCell
        cell.backgroundViewCell.image = info[.editedImage] as? UIImage
        cell.backgroundViewCell.contentMode = .scaleAspectFill
        cell.backgroundViewCell.clipsToBounds = true
        imageIsChanged = true
        dismiss(animated: true)
    }
}
