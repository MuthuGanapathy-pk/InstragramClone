//
//  ViewController.swift
//  Instragram
//
//  Created by Rifluxyss on 17/02/23.
//

import UIKit

class ViewController: UIViewController, account{
    var deflaut = 0
    var account_username: String = ""
    var account_password: String = ""
    
    //Protocol
    func new_data(str_1: String, str_2: String) {
        account_username = str_1
        account_password = str_2
    }
    
//Get Input from User in Login Page
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AccountButton_Outlet.layer.borderWidth = 1
        AccountButton_Outlet.layer.borderColor = UIColor.black.cgColor
    }
    
//LoginButton

    @IBAction func LoginButton() {
        
        if(deflaut != 0 && account_username == "" && account_password == ""){
            let AlertBox = UIAlertController(title: "Create Account", message: nil, preferredStyle: UIAlertController.Style.alert)
            let AlertAction = UIAlertAction(title: "Create", style: UIAlertAction.Style.default) { (UIAlertAction) in
                self.Account_Button()
            }
            AlertBox.addAction(AlertAction)
            self.present(AlertBox, animated: true, completion: nil)
            
        }
        else if(UserName.text != account_username && Password.text != account_password){
            let AlertBox = UIAlertController(title: "Error", message: "Enter Correct UserName & Password..!", preferredStyle: UIAlertController.Style.alert)
            let AlertAction = UIAlertAction(title: "Okay", style: UIAlertAction.Style.cancel)
            AlertBox.addAction(AlertAction)
            self.present(AlertBox, animated: true, completion: nil)
        }
        else{
            let vc = storyboard?.instantiateViewController(withIdentifier: "TabBar")
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
//Create New Account
    @IBOutlet weak var AccountButton_Outlet: UIButton!
    @IBAction func Account_Button() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "New_Account_Story") as! Create_New_Account
        vc.Signup_account = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
