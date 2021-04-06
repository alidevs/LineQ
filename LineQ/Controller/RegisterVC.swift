//
//  ViewController.swift
//  LineQ
//
//  Created by Ali Alateiyah on 31/03/2021.
//

import UIKit
import FirebaseAuth

class RegisterVC: UIViewController {
	
	// Outlets
	@IBOutlet var fullNameTextField: UITextField!
	@IBOutlet var emailTextField: UITextField!
	@IBOutlet var passwordTextField: UITextField!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}

	
	override func viewWillAppear(_ animated: Bool) {
		
	}

	@IBAction func registerButtonPressed(_ sender: UIButton) {
		guard let name = fullNameTextField.text, let email = emailTextField.text, let password = passwordTextField.text, !name.isEmpty, !email.isEmpty, !password.isEmpty else {
			print("Please fill out all fields")
			return
			
		}
		
		if !email.isValidEmail {
			print("Please enter a valid email. (examplename@example.com)")
			return
		}
		
		Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
			if error == nil {
				Auth.auth().signIn(withEmail: email, password: password)
				self.performSegue(withIdentifier: "toMainVC", sender: sender)
			}
		}
	}
	
	@IBAction func loginButtonPressed(_ sender: UIButton) {
		print("Going LoginVC")
		performSegue(withIdentifier: "toLoginVC", sender: sender)
	}
	
}
