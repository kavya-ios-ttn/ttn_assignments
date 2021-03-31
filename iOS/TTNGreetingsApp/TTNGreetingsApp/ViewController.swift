//
//  ViewController.swift
//  TTNGreetingsApp
//
//  Created by TTN on 31/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import UIKit

protocol ErrorViewProtocol {}
protocol LoggableProtocol {}
protocol RoundableProtocol {}
protocol BordableProtocol {}

extension ErrorViewProtocol where Self: UIViewController {
    var error: String {
        return "User not found."
    }
}

extension LoggableProtocol where Self: UIViewController {
    func verfiyEmailID(email: String) -> Bool {
        let emailVerification: String = "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$"
        let validCheck = NSPredicate(format: "Self matches %@", emailVerification)
        return validCheck.evaluate(with: email)
    }
    
    func verifyPassword(password: String) -> Bool {
        let passwordVerification: String = "^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$"
        //        ^                         Start anchor
        //        (?=.*[A-Z].*[A-Z])        Ensure string has two uppercase letters.
        //        (?=.*[!@#$&*])            Ensure string has one special case letter.
        //        (?=.*[0-9].*[0-9])        Ensure string has two digits.
        //        (?=.*[a-z].*[a-z].*[a-z]) Ensure string has three lowercase letters.
        //        .{8}                      Ensure string is of length 8.
        //        $                         End anchor. password - AB@12cde
        
        let validCheck = NSPredicate(format: "Self matches %@", passwordVerification)
        return validCheck.evaluate(with: password)
    }
}


extension UIViewController {
    
    func showToast(msg: String, font: UIFont) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2-75, y: self.view.frame.size.height-100, width: 200, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = msg
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
    
        })
        
    }
}

extension RoundableProtocol where Self: UIView {
    func roundFeature() {
    }
}
extension BordableProtocol where Self: UIView {
    func borderFeature() {
    }
}

class ViewController: UIViewController, LoggableProtocol {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var model: Model = Model()
    var empList: [Employee] {
        return model.emp
    }
    
    var customerList: [Customer] {
        return model.cust
    }
    
    var username: String = ""
    var emailID: String = ""
    var phoneNum: String = ""
    var ID: String = ""
    var userDP: String = ""
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginClick() {
        if(self.verfiyEmailID(email: emailTextField.text ?? "") && self.verifyPassword(password: passwordTextField.text ?? "")) {
            if(emailTextField.text!.contains("gmail")) {
                for index in empList where (emailTextField.text! == index.emailID) {
                    username = index.fname
                    emailID = index.emailID
                    phoneNum = index.phoneNum
                    ID = index.employeeID
                    userDP = index.userDP
                }
            } else {
                for index in customerList where (emailTextField.text! == index.emailID) {
                    username = index.name
                    emailID = index.emailID
                    phoneNum = index.phoneNum
                    ID = index.ID
                    userDP = index.userDP
                }
            }
            let obj = storyboard!.instantiateViewController(withIdentifier: "MixCustEmpViewController") as! MixCustEmpViewController
            obj.emailID = emailID
            obj.ID = ID
            obj.phoneNum = phoneNum
            obj.username = username
            obj.userDP = userDP
            navigationController?.pushViewController(obj, animated: true)
        } else {
            self.showToast(msg: "Incorrect Email or Password", font: .systemFont(ofSize: 12.0))
        }
    }


}

