//
//  ImageViewController.swift
//  LectionUIKitTest
//
//  Created by Гость on 07/11/2019.
//  Copyright © 2019 Konstantin Polin. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet var greetingLabel: UILabel!
    
    var name: String = ""
    var surname: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGreetingLabel()
    }
    func setupGreetingLabel(){
        greetingLabel.text = "Привет, \(name) \(surname)"
        greetingLabel.textColor = .red
        greetingLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        greetingLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
}
