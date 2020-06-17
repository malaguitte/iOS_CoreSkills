//
//  ViewController.swift
//  ios-development-essentials
//
//  Created by Anderson Malaguitte on 17/06/2020.
//  Copyright © 2020 Anderson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldSurname: UITextField!
    
    let INITIAL_TEXT: String = "Changed With Code!";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.text = INITIAL_TEXT
        textFieldName.becomeFirstResponder()
        textFieldName.delegate = self
        textFieldSurname.delegate = self
    }

    @IBAction func buttonWasPressed(_ sender: Any) {
        if let name = textFieldName.text, let surname = textFieldSurname.text {
            let message = "Hello \(name) \(surname)!"
            label.text = message
            view.endEditing(true) //hides keyboard
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true) //hides keyboard
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //When the 'return/done' button is pressed, we should hide the keyboard.
        //textField represents whichever text field is active at the moment here.
        textField.resignFirstResponder()
        return false
    }
}

