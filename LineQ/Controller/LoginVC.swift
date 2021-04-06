//
//  RegisterVC.swift
//  LineQ
//
//  Created by Ali Alateiyah on 31/03/2021.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

	// Outlets
	@IBOutlet var emailTextField: UITextField!
	@IBOutlet var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

		print("Laoding LOGINVCCCC")
        // Do any additional setup after loading the view.
    }
	
	@IBAction func loginButtonPressed(_ sender: UIButton) {
		guard let email = emailTextField.text, let password = passwordTextField.text, !email.isEmpty, !password.isEmpty else {
			print("Please fill out all fields.")
			return
		}
		
		Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
			if error == nil {
				print("User signed in successfully\n\(String(describing: authResult))")
				self.performSegue(withIdentifier: "toMainVC", sender: sender)
			} else {
				print(error.debugDescription)
			}
		}
	}
    

	@IBAction func registerButtonPressed(_ sender: UIButton) {
		print("Going RegisterVC")
		performSegue(withIdentifier: "toRegisterVC", sender: sender)
	}
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
