//
//  LoginController.swift
//  CarRentalApp
//
//  Created by Abid Kerimli on 20.12.25.
//

import UIKit

class LoginController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    @IBAction func loginButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(HomeController.self)") as! HomeController
        navigationController?.show(controller, sender: nil)
        
    }
    
}
