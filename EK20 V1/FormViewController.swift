//
//  FormViewController.swift
//  EK20 V1
//
//  Created by Stéphane Trouvé on 01/05/2020.
//  Copyright © 2020 Stéphane Trouvé. All rights reserved.
//

import UIKit
import Firebase
//import RealmSwift


class FormViewController: UIViewController, UITextFieldDelegate {

    //var gebruikers: Results<Adres>?
    var userList:[DataSnapshot] = []
    var teams = [String]()
    var pronoArray: [Prono] = [Prono]()
    
    //let realm = try! Realm()
    
    
    @IBOutlet weak var game1: UILabel!
    @IBOutlet weak var game2: UILabel!
    @IBOutlet weak var game3: UILabel!
    @IBOutlet weak var game4: UILabel!
    @IBOutlet weak var game5: UILabel!
    @IBOutlet weak var game6: UILabel!
    @IBOutlet weak var game7: UILabel!
    @IBOutlet weak var game8: UILabel!
    @IBOutlet weak var game9: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.game1H.delegate = self
        self.game1A.delegate = self
        self.game2H.delegate = self
        self.game2A.delegate = self
        self.game3H.delegate = self
        self.game3A.delegate = self
        self.game4H.delegate = self
        self.game4A.delegate = self
        self.game5H.delegate = self
        self.game5A.delegate = self
        self.game6H.delegate = self
        self.game6A.delegate = self
        self.game7H.delegate = self
        self.game7A.delegate = self
        self.game8H.delegate = self
        self.game8A.delegate = self
        self.game9H.delegate = self
        self.game9A.delegate = self
        
        self.game1.text = gamesA[0]
        self.game2.text = gamesA[1]
        self.game3.text = gamesA[2]
        self.game4.text = gamesA[3]
        self.game5.text = gamesA[4]
        self.game6.text = gamesA[5]
        self.game7.text = gamesA[6]
        self.game8.text = gamesA[7]
        self.game9.text = gamesA[8]

        retreiveProno()
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.switchBasedNextTextField(textField)
        return true
    }
    
    
    func retreiveProno () {
        
        let scoreDB = Database.database().reference().child("Scores2")
        
        scoreDB.observe(.childAdded) { (snapshot) in
            //self.userList.append(snapshot)
            let props = snapshot.value as! Dictionary<String,String>
            let userEmail = props["Sender"]
//            let game1H = props["Game 1 - Home"]
//            let game1A = props["Game 1 - Away"]
//            let game2H = props["Game 2 - Home"]
//            let game2A = props["Game 2 - Away"]
//            let game3H = props["Game 3 - Home"]
//            let game3A = props["Game 3 - Away"]
//            let game4H = props["Game 4 - Home"]
//            let game4A = props["Game 4 - Away"]

            let game1H = props[gamesA[0] + " - Home"]
            let game1A = props[gamesA[0] + " - Away"]
            let game2H = props[gamesA[1] + " - Home"]
            let game2A = props[gamesA[1] + " - Away"]
            let game3H = props[gamesA[2] + " - Home"]
            let game3A = props[gamesA[2] + " - Away"]
            let game4H = props[gamesA[3] + " - Home"]
            let game4A = props[gamesA[3] + " - Away"]
            let game5H = props[gamesA[4] + " - Home"]
            let game5A = props[gamesA[4] + " - Away"]
            let game6H = props[gamesA[5] + " - Home"]
            let game6A = props[gamesA[5] + " - Away"]
            let game7H = props[gamesA[6] + " - Home"]
            let game7A = props[gamesA[6] + " - Away"]
            let game8H = props[gamesA[7] + " - Home"]
            let game8A = props[gamesA[7] + " - Away"]
            let game9H = props[gamesA[8] + " - Home"]
            let game9A = props[gamesA[8] + " - Away"]
            
            let newprono = Prono(sender: userEmail ?? "", Game1H: game1H ?? "", Game1A: game1A ?? "", Game2H: game2H ?? "", Game2A: game2A ?? "", Game3H: game3H ?? "", Game3A: game3A ?? "", Game4H: game4H ?? "", Game4A: game4A ?? "", Game5H: game5H ?? "", Game5A: game5A ?? "", Game6H: game6H ?? "", Game6A: game6A ?? "", Game7H: game7H ?? "", Game7A: game7A ?? "", Game8H: game8H ?? "", Game8A: game8A ?? "", Game9H: game9H ?? "", Game9A: game9A ?? "")
            self.pronoArray.append(newprono)

        }
        
        //for element in self.pronoArray {""
        //    print(element)
        //}
        
        
    }
    
    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case self.game1H:
            self.game1A.becomeFirstResponder()
        case self.game1A:
            self.game2H.becomeFirstResponder()
        case self.game2H:
            self.game2A.becomeFirstResponder()
        case self.game2A:
            self.game3H.becomeFirstResponder()
        case self.game3H:
            self.game3A.becomeFirstResponder()
        case self.game3A:
            self.game4H.becomeFirstResponder()
        case self.game4H:
            self.game4A.becomeFirstResponder()
        case self.game4A:
            self.game5H.becomeFirstResponder()
        case self.game5H:
            self.game5A.becomeFirstResponder()
        case self.game5A:
            self.game6H.becomeFirstResponder()
        case self.game6H:
            self.game6A.becomeFirstResponder()
        case self.game6A:
            self.game7H.becomeFirstResponder()
        case self.game7H:
            self.game7A.becomeFirstResponder()
        case self.game7A:
            self.game8H.becomeFirstResponder()
        case self.game8H:
            self.game8A.becomeFirstResponder()
        case self.game8A:
            self.game9H.becomeFirstResponder()
        case self.game9H:
            self.game9A.becomeFirstResponder()
        default:
            self.game9A.resignFirstResponder()
        }
    }
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var game1H: UITextField!
    @IBOutlet weak var game1A: UITextField!
    @IBOutlet weak var game2H: UITextField!
    @IBOutlet weak var game2A: UITextField!
    @IBOutlet weak var game3H: UITextField!
    @IBOutlet weak var game3A: UITextField!
    @IBOutlet weak var game4H: UITextField!
    @IBOutlet weak var game4A: UITextField!
    @IBOutlet weak var game5H: UITextField!
    @IBOutlet weak var game5A: UITextField!
    @IBOutlet weak var game6H: UITextField!
    @IBOutlet weak var game6A: UITextField!
    @IBOutlet weak var game7H: UITextField!
    @IBOutlet weak var game7A: UITextField!
    @IBOutlet weak var game8H: UITextField!
    @IBOutlet weak var game8A: UITextField!
    @IBOutlet weak var game9H: UITextField!
    @IBOutlet weak var game9A: UITextField!
    
    
    
    @IBAction func submitPressed(_ sender: UIButton) {
        
        //print(Realm.Configuration.defaultConfiguration.fileURL)
        
        submitButton.isEnabled = false
        
        let scoreDB = Database.database().reference().child("Scores2")
        let userID = Auth.auth().currentUser?.uid
        
//        print(pronoArray[0].Game1H)
//
//        for (index, element) in pronoArray.enumerated() {
//            print(index, ":", element.sender)
//            print(index, ":", element.Game1H)
//            print(index, ":", element.Game1A)
//        }
        
        //let userID = "1"
        
        let scoreDictionary = ["Sender": Auth.auth().currentUser?.email, teamsA[0] + teamsA[1] + " - Home": game1H.text!, teamsA[0] + teamsA[1] + " - Away": game1A.text!, teamsA[2] + teamsA[3] + " - Home": game2H.text!, teamsA[2] + teamsA[3] + " - Away": game2A.text!, teamsA[4] + teamsA[5] + " - Home": game3H.text!, teamsA[4] + teamsA[5] + " - Away": game3A.text!, teamsA[6] + teamsA[7] + " - Home": game4H.text!, teamsA[6] + teamsA[7] + " - Away": game4A.text!, teamsA[8] + teamsA[9] + " - Home": game5H.text!, teamsA[8] + teamsA[9] + " - Away": game5A.text!, teamsA[10] + teamsA[11] + " - Home": game6H.text!, teamsA[10] + teamsA[11] + " - Away": game6A.text!, teamsA[12] + teamsA[13] + " - Home": game7H.text!, teamsA[12] + teamsA[13] + " - Away": game7A.text!, teamsA[14] + teamsA[15] + " - Home": game8H.text!, teamsA[14] + teamsA[15] + " - Away": game8A.text!, teamsA[16] + teamsA[17] + " - Home": game9H.text!, teamsA[16] + teamsA[17] + " - Away": game9A.text!]
    
    
        scoreDB.child(userID!).setValue(scoreDictionary) {
            (error, reference) in
            
            if error != nil {
                print(error)
            } else {
                print("Saved message")
                self.submitButton.isEnabled = true

            }
        }
        
//        try! realm.write {
//            realm.deleteAll()
//        }
        
        
//        scoreDB.observe(.childAdded) { (DataSnapshot) in
//
//        }

        
        
    }

}
