//
//  Create_New_Account.swift
//  Instragram
//
//  Created by Rifluxyss on 20/02/23.
//

import UIKit
protocol account {
    func new_data(str_1:String,str_2:String);
}
class Create_New_Account: UIViewController {
    
    var New_UserName = ""
    var New_Password = ""
    var Signup_account:account?
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
//TextField
    @IBOutlet weak var SignUp_UserName: UITextField!
    @IBOutlet weak var SignUp_Password: UITextField!

    
//SignUp Action
    @IBAction func SignUp_button(_ sender: UIButton) {
        if (SignUp_UserName.text?.count ?? 0 >= 5 && SignUp_Password.text?.count ?? 0 >= 8){
            New_UserName = SignUp_UserName.text!
            New_Password = SignUp_Password.text!
            Signup_account?.new_data(str_1: New_UserName, str_2: New_Password)
            navigationController?.popViewController(animated: true)
        }
        else{
            let AlertBox = UIAlertController(title: "Error", message: "Enter Valid Data", preferredStyle: UIAlertController.Style.alert)
            let AlertAction = UIAlertAction(title:"Okay", style: UIAlertAction.Style.cancel, handler: nil)
            AlertBox.addAction(AlertAction)
            self.present(AlertBox, animated: true, completion: nil)
        }
    }

}
