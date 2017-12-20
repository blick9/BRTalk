//
//  ChatListViewController.swift
//  BRTalk
//
//  Created by Febrix on 2017. 12. 21..
//  Copyright © 2017년 brix. All rights reserved.
//

import UIKit

class ChatListViewController: UIViewController {
    let cellID: String = "chatListCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //Register CustomTableViewCell by nib
        let cellNib = UINib(nibName: "ChatListTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: cellID)
        
        testTempInit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    //Temp Case
    func testTempInit() {
    }
    
    deinit {
        print("deinit", #file)
    }
}

extension ChatListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyChatList.shared.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ChatListTableViewCell
        
        let chat = MyChatList.shared.chatList[indexPath.row]
        cell.titleLabel.text = chat.title
        cell.contentsLabel.text = chat.messageStore?.last?.contents.description
        cell.dateLabel.text = chat.messageStore?.last?.date.stringApplyFormatter()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let chatSB = UIStoryboard(name: "Chat", bundle: nil)
        let chatViewController = chatSB.instantiateViewController(withIdentifier: "chatView") as! ChatViewController
        
        let chat = MyChatList.shared.chatList[indexPath.row]
        chatViewController.currentChat = chat
//        chatViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(chatViewController, animated: true)
    }
}


extension ChatListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
