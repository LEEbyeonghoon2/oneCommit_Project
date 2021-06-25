//
//  customViewController.swift
//  oneCommit_Project
//
//  Created by 이병훈 on 2021/06/25.
//

import UIKit

class customViewController: UIViewController {
    let textField = UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        makeCustomTextField()
        self.textField.delegate = self
    }
    func makeCustomTextField() {
        let image = UIImage(named: "search")
        let imageView = UIImageView(frame: CGRect(x: 293, y: 16, width: 25, height: 25))
        imageView.image = image
        textField.frame = CGRect(x: 40, y: 60, width: 335, height: 52)
        textField.placeholder = "산 이름을 검색하세요"
        textField.layer.cornerRadius = 25
        textField.layer.borderWidth = 0.1
        textField.addLeftPadding()
        self.view.addSubview(textField)
        textField.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.trailingAnchor.constraint(equalTo: self.textField.trailingAnchor, constant: -23).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.textField.centerYAnchor).isActive = true
    }
}

extension customViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let vc = self.storyboard?.instantiateViewController(identifier: "vc") as! ViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension UITextField {
  func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
}
