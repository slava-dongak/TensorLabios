//
//  LoginViewController.swift
//  LectionUIKitTest
//
//  Created by Konstantin Polin on 31/10/2019.
//  Copyright © 2019 Konstantin Polin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

	@IBOutlet var nameText: UITextField!
	@IBOutlet var surnameText: UITextField!
	@IBOutlet var loginButton: UIButton!
    @IBOutlet var restoreButton: UIButton!
    
	override func viewDidLoad() {
		super.viewDidLoad()
		
		nameText.delegate = self
		surnameText.delegate = self
        
        constrainsActivate()
        
		registerForKeyboardNotification()
	}
    
	@IBAction func onLoginTapped(_ sender: Any) {
		guard let name = nameText.text, let surname = surnameText.text else {
			 return
		}
        
        if name == "Slava" && surname == "Dongak" {
            performSegue(withIdentifier: "ShowImage", sender: self)
        } else {
            let alertController = UIAlertController(
                title: "ERROR!!!",
                message: "Your write incorrect name. Please write correct name",
                preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction(
                title: "Close",
                style: .default,
                handler: { _ in
                alertController.dismiss(animated: true, completion: nil)
            }))
            
            self.present(alertController, animated: true, completion: nil)
            
//            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
//                alertController.dismiss(animated: true, completion: nil)
//            }
        }
	}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let imageVC = segue.destination as? ImageViewController {
//            let name: String
//            if let text = nameText.text {
//                name = text
//            } else {
//                name = ""
//            }
            
            let name = nameText.text ?? ""
            let surname = surnameText.text ?? ""
            
            imageVC.name = name
            imageVC.surname = surname
        }
    }
    
    func registerForKeyboardNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
    
    func constrainsActivate() {
        nameText.translatesAutoresizingMaskIntoConstraints = false
        surnameText.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        restoreButton.translatesAutoresizingMaskIntoConstraints = false
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(surnameText.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor))
        constraints.append(surnameText.centerYAnchor.constraint(equalTo: safeAreaGuide.centerYAnchor))
        constraints.append(surnameText.widthAnchor.constraint(equalToConstant: 150))
        
        constraints.append(loginButton.topAnchor.constraint(equalTo: surnameText.bottomAnchor, constant: 20))
        constraints.append(loginButton.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor))
    
        constraints.append(nameText.bottomAnchor.constraint(equalTo: surnameText.topAnchor, constant: -20))
        constraints.append(nameText.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor))
        constraints.append(nameText.widthAnchor.constraint(equalToConstant: 150))
    
        constraints.append(restoreButton.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor, constant: -40))
        constraints.append(restoreButton.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
    
	@objc func keyboardWillShow(notification: NSNotification) {
		let value = notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue
		let keyboardFrame = value.cgRectValue
		
		if view.frame.origin.y == 0 {
			view.frame.origin.y -= keyboardFrame.size.height
		}
	}
	
	@objc func keyboardWillHide() {
        view.frame.origin.y = 0
        
	}
	
}

