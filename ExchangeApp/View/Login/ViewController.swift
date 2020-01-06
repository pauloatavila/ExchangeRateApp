//
//  ViewController.swift
//  ExchangeApp
//
//  Created by Paulo Atavila on 04/01/20.
//  Copyright © 2020 Paulo Atavila. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    //MARK: Storyboard
    @IBOutlet weak var lottieView: AnimationView!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func logginButton(_ sender: Any) {
        viewModel.checkLogin(user: userTextField.text, password: passwordTextField.text)
    }
    @IBAction func facebookButton(_ sender: Any) {
        //TODO: Chamar próxima view
    }
    @IBAction func twitterButton(_ sender: Any) {
        //TODO: Chamar próxima view
    }
    @IBAction func googleButton(_ sender: Any) {
        //TODO: Chamar próxima view
    }
    
    //MARK: Variáveis
    var viewModel = LoginViewModel() {
        willSet {
            viewModel.viewDelegate = nil
        }
        didSet {
            viewModel.viewDelegate = self
        }
    }

    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LoginViewModel()
        setupLottie()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: Lottie
    func setupLottie(){
        lottieView.loopMode = .autoReverse
        lottieView.play(toFrame: 0)
        lottieView.animationSpeed = 0.8
        
        lottieView.play { (finished) in
            // Animation finished
        }
    }


    //MARK: Keyboard
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height - 100
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}

//MARK: ViewModel
extension ViewController: LoginViewModelProtocolDelegate {
    func error(message: String) {
        let alert = UIAlertController(title: "Erro", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func success() {
        print("login")
    }
    
    
}

