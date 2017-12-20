//
//  FriendListViewController.swift
//  BRTalk
//
//  Created by Febrix on 2017. 12. 21..
//  Copyright © 2017년 brix. All rights reserved.
//

import UIKit

class FriendListViewController: UIViewController {
    let cellID: String = "friendListCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //Register CustomTableViewCell by nib
        let cellNib = UINib(nibName: "FriendListTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: cellID)
        
        testTempInit()
    }
    
    @IBAction func addFriendButtonDidTap(_ sender: Any) {
        
        let alertController = UIAlertController(title: "친구 추가", message: nil, preferredStyle: .alert)
        let saveButton = UIAlertAction(title: "저장", style: .default) { [weak self] (alertAction) in
            let inputName = alertController.textFields![0].text!
            let inputPhone = alertController.textFields![1].text!
            
            guard !inputName.isEmpty || !inputPhone.isEmpty else { return }
            let user = User(name: inputName, phoneNumber: inputPhone, profileImage: nil, joinDate: Date())
            MyFriendList.shared.friendList.append(user)
            
            self?.tableView.reloadData()
        }
        
        let cancelButton = UIAlertAction(title: "취소", style: .default, handler: nil)
        alertController.addAction(cancelButton)
        alertController.addAction(saveButton)
        alertController.addTextField(configurationHandler: { (textField) in
            textField.keyboardType = .default
            textField.placeholder = "이름"
        })
        alertController.addTextField(configurationHandler: { (textField) in
            textField.keyboardType = .decimalPad
            textField.placeholder = "전화번호"
        })
        present(alertController, animated: true, completion: nil)
    }
    
    //Temp Case
    func testTempInit() {
        let friend1 = User(name: "구찬우", phoneNumber: "01012345678", profileImage: nil, joinDate: Date())
        let friend2 = User(name: "홍길동", phoneNumber: "01098765432", profileImage: nil, joinDate: Date())
        
        MyFriendList.shared.friendList.append(friend1)
        MyFriendList.shared.friendList.append(friend2)
        
        let user = MyFriendList.shared.friendList[1]
        
        //채팅방의 ID는 1:1의 경우 상대 유저의 ID, 두 명 이상의 경우 새로운 UUID를 생성한다. (이미 존재하는 채팅방의 중복 생성을 방지하고, 해당 채팅방으로 연결되기 위함.)
        let chat = Chat(title: nil, profileImage: nil, users: [user])
        MyChatList.shared.chatList.append(chat)
    }
    
    deinit {
        print("deinit", #file)
    }
}


extension FriendListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyFriendList.shared.friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! FriendListTableViewCell
        
        let friend = MyFriendList.shared.friendList[indexPath.row]
        cell.friendNameLabel.text = friend.name
        cell.profileImageView.image = friend.profileImage
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let friend = MyFriendList.shared.friendList[indexPath.row]
        let chooseAlertController = UIAlertController(title: friend.name,
                                                      message: nil,
                                                      preferredStyle: .actionSheet)
        let startChatAction = UIAlertAction(title: "1:1", style: .default) { (_) in
            let chat = Chat(title: nil, profileImage: nil, users: [friend])
            
            if MyChatList.shared.chatList.contains(chat) == false {
                MyChatList.shared.chatList.append(chat)
            }
            self.tabBarController?.selectedIndex = 1
            
            let chatIndex = MyChatList.shared.chatList.index(of: chat)
            let selectedChat = MyChatList.shared.chatList[chatIndex!]
            
            let chatSB = UIStoryboard(name: "Chat", bundle: nil)
            let chatViewController = chatSB.instantiateViewController(withIdentifier: "chatView") as! ChatViewController
            chatViewController.currentChat = selectedChat
            chatViewController.hidesBottomBarWhenPushed = true
            self.tabBarController?.selectedViewController?.childViewControllers.first?.navigationController?.pushViewController(chatViewController, animated: false)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        chooseAlertController.addAction(startChatAction)
        chooseAlertController.addAction(cancelAction)
        present(chooseAlertController, animated: true, completion: nil)
    }
}


extension FriendListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
