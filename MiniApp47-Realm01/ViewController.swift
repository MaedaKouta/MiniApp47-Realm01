//
//  ViewController.swift
//  MiniApp47-Realm01
//
//  Created by 前田航汰 on 2022/04/24.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet private weak var tableView: UITableView!
    private let realm = try! Realm()
    private var usersArray: [User] = []

    @IBOutlet private weak var textField1: UITextField!
    @IBOutlet private weak var textField2: UITextField!
    @IBOutlet private weak var textField3: UITextField!

    @IBAction func didTapButton1(_ sender: Any) {
        let user = User()
        user.id = textField1.text ?? ""
        user.name = textField2.text ?? ""

        if user.id.isEmpty == false, user.name.isEmpty == false {
            // realmにappend
            try! realm.write {
              realm.add(user)
            }
            textField2.text = ""
        }
    }

    @IBAction func didTapButton2(_ sender: Any) {
        usersArray = []
        // idで検索
        let results = realm.objects(User.self)
        let id = textField3.text ?? ""
        let predicate = NSPredicate(format: "id == %@", id)
        let users = results.filter(predicate)
        for tmp in users {
            usersArray.append(tmp)
        }
        tableView.reloadData()
        textField3.text = ""
    }

    @IBAction func didTapDeleteButton(_ sender: Any) {
        try! realm.write {
          realm.deleteAll()
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        usersArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = usersArray[indexPath.row].name
        cell.detailTextLabel?.text = usersArray[indexPath.row].id
        return cell
    }


}

