//
//  ViewController.swift
//  MyFriends
//
//  Created by Mangdi on 2022/10/17.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    var friends: [Friend] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset.init(name: "friends") else {
            return
        }
        
        do {
            friends = try jsonDecoder.decode([Friend].self, from: dataAsset.data)
        } catch {
            debugPrint(error.localizedDescription)
        }
        
//        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let friend: Friend = friends[indexPath.item]
        
        var content = cell.defaultContentConfiguration()
        content.text = friend.nameAndAge
        content.secondaryText = friend.fullAddress
        cell.contentConfiguration = content
//        deprecated된 사용법
//        cell.textLabel?.text = friend.name + "\(friend.age)"
        
        return cell
    }

}

