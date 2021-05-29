//
//  ViewController.swift
//  oneCommit_Project
//
//  Created by 이병훈 on 2021/05/29.
//

import UIKit

class ViewController: UITableViewController {
    let data = ["HoonIOS", "iOS", "swift", "developer"]
    
    @IBOutlet weak var pickerField: UITextField!
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        result.text = "결과값"
        result.sizeToFit()
        
        let picker = UIPickerView()
        picker.delegate = self
        
        let toolBar = UIToolbar()
        toolBar.frame = CGRect(x: 0, y: 0, width: 0, height: 40)
        toolBar.backgroundColor = .darkGray
        
        let BarButton = UIBarButtonItem()
        BarButton.title = "Done"
        BarButton.target = self
        BarButton.action = #selector(DoneButton(_:))
        
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([space ,BarButton], animated: true)
        self.pickerField.inputView = picker
        self.pickerField.inputAccessoryView = toolBar
    }
    @objc func DoneButton(_ sender: Any) {
        self.view.endEditing(true)
    }


}

extension ViewController: UIPickerViewDelegate {
    //델리게이트 메서드
    //피커뷰 선택했을때
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        self.result.text = "\(self.data[row])"
        
        result.sizeToFit()
        }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    //피커뷰의 아이템 이름 설정
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.data[row]
      
    }
}
extension ViewController: UIPickerViewDataSource {
    //데이터소스 메서드
    //컴포넌트의 갯수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    //피커뷰의 컴포넌트 안의 아이템갯수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.data.count
        
    }
    
   
    
}
