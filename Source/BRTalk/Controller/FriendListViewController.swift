//
//  FriendListViewController.swift
//  BRTalk
//
//  Created by Febrix on 2017. 12. 21..
//  Copyright © 2017년 brix. All rights reserved.
//

import UIKit

class FriendListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}


extension FriendListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        return cell
    }
}


extension FriendListViewController: UITableViewDelegate {
    
}
