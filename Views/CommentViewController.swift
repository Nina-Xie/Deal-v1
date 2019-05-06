//
//  CommentViewController.swift
//  Deal
//
//  Created by Nina Xie on 4/30/19.
//  Copyright © 2019 F(X). All rights reserved.
//

import UIKit

class CommentViewController: UIViewController, UITextFieldDelegate {
    
    var commentTableView: UITableView!
    var commentTextField: UITextField!
    
    var commentTextFieldBottomAnchor: NSLayoutConstraint!
    var comments: [Comment] = []
    let commentCellReuseIdentifier = "CommentCellReuseIdentifier"
    
    let padding: CGFloat = 24
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        comments = DealAPI.getComment()  // for testing
        
        commentTableView = UITableView()
        commentTableView.translatesAutoresizingMaskIntoConstraints = false
        commentTableView.dataSource = self
        commentTableView.delegate = self
        commentTableView.register(CommentTableViewCell.self, forCellReuseIdentifier: commentCellReuseIdentifier)
        commentTableView.tableFooterView = UIView() // so there's no empty lines at the bottom
        
        commentTableView.rowHeight = UITableView.automaticDimension
        commentTableView.estimatedRowHeight = 96
        view.addSubview(commentTableView)
        
        
        commentTextField = UITextField()
        commentTextField.translatesAutoresizingMaskIntoConstraints = false
        commentTextField.placeholder = "Leave your comments"
        commentTextField.allowsEditingTextAttributes = true
        commentTextField.borderStyle = .roundedRect
        commentTextField.font = UIFont.systemFont(ofSize: 16)
        commentTextField.delegate = self
        
        commentTextField.layer.shadowColor = UIColor.lightGray.cgColor
        commentTextField.layer.shadowOffset = CGSize(width: 2.5 ,height: 2.5)
        commentTextField.layer.shadowRadius = 2.5
        commentTextField.layer.shadowOpacity = 0.8
        view.addSubview(commentTextField)
        
        commentTextFieldBottomAnchor = NSLayoutConstraint(item: commentTextField, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: -padding)
        
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            commentTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            commentTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.5*padding),
            commentTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1*padding),
            commentTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -1*padding-60),
            ])
        
        NSLayoutConstraint.activate([
            commentTextFieldBottomAnchor,
            commentTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            commentTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1*padding),
            commentTextField.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        commentTextFieldBottomAnchor.constant = -padding-295
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
//        NSLayoutConstraint.deactivate([
//            commentTextFieldBottomAnchor
//            ])
//        NSLayoutConstraint.activate([
//            commentTextFieldBottomAnchor(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
//            ])
        commentTextFieldBottomAnchor.constant = -padding
        
        
        let comment = textField.text
        //TODO: textField.text ... saved as comment message
        
        textField.text = nil
        return true
    }
    
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        moveTextField(textfield: textField, moveDistance: -295, up: false)
        
//    }
    
//    func moveTextField(textfield: UITextField, moveDistance: Int, up: Bool) {
//        let moveDuration = 0.3
//        let movement: CGFloat = CGFloat(up ? moveDistance: -moveDistance)
//        UIView.beginAnimations("animateTextField", context: nil)
//        UIView.setAnimationBeginsFromCurrentState(true)
//        UIView.setAnimationDuration(moveDuration)
//        textfield.frame = textfield.frame.offsetBy(dx: 0, dy: movement)
//        UITextView.commitAnimations()
//    }
    
}

extension CommentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let commentCell = tableView.dequeueReusableCell(withIdentifier: commentCellReuseIdentifier, for: indexPath) as! CommentTableViewCell
        commentCell.configure(for: comments[indexPath.row])
        commentCell.selectionStyle = .none
        return commentCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
  
}
