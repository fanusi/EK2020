//
//  FixtureViewController.swift
//  EK20 V1
//
//  Created by Stéphane Trouvé on 22/12/2020.
//  Copyright © 2020 Stéphane Trouvé. All rights reserved.
//

import UIKit
import Firebase

class FixtureViewController: UIViewController {
    
    var arrayTxt = [UITextField]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        let view1 = UIView()
        let view2 = UIView()
        let padding: CGFloat = view.bounds.width
        let padding2: CGFloat = view.bounds.height
        
        view1.backgroundColor = .black
        view1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(view1)
        
        view2.backgroundColor = .red
        view2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(view2)

        view1.frame = CGRect(x: 0, y: 0, width: padding, height: padding2 * 0.8)
        view2.frame = CGRect(x: 0, y: padding2 * 0.8, width: padding, height: padding2 * 0.2)
        
        visualizer(view1: view1)
        visualizer2(view2: view2, y_start: padding2 * 0.8)
        
        
    }
    
    func visualizer2(view2: UIView, y_start: CGFloat) {
        
        let p1: CGFloat = view2.bounds.width
        let p2: CGFloat = view2.bounds.height
        
        let submitButton = UIButton(frame: CGRect(x: p1 * 0.5, y: p2 * 0.5 + y_start, width: p1 * 0.5 , height: p2 * 0.5))
        submitButton.backgroundColor = .blue
        submitButton.setTitle("Submit", for: .normal)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        submitButton.center = view2.center
        self.view.addSubview(submitButton)
        
    }
    
    @objc func buttonAction(sender: UIButton!) {
        
        print("Button Clicked")
        
        let thisButton: UIButton = sender
        
        thisButton.isEnabled = false
        
        let scoreDB = Database.database().reference().child("Scores2")
        let userID = Auth.auth().currentUser?.uid
    
        var scoreDictionary = [String: String]()
        
        scoreDictionary["Sender"] = Auth.auth().currentUser?.email

        for n in 0...8 {
            
            var game = teamsA[2*n] + " - " + teamsA[2*n + 1]
            var temp = game + " (Home)"
            var temp2 = game + " (Away)"
            scoreDictionary[temp] = arrayTxt[2*n].text
            scoreDictionary[temp2] = arrayTxt[2*n+1].text
        }
        
        scoreDB.child(userID!).setValue(scoreDictionary) {
            (error, reference) in
            
            if error != nil {
                print(error)
            } else {
                print("Saved message")
                thisButton.isEnabled = true

            }
        }

    }
    
    func visualizer(view1: UIView) {
        
        let exampleview = UIScrollView()
        
        exampleview.backgroundColor = .black
        exampleview.translatesAutoresizingMaskIntoConstraints = false
        //view.addSubview(exampleview)
        view1.addSubview(exampleview)
        
        
        let padding: CGFloat = view1.bounds.width
        let padding2: CGFloat = view1.bounds.height

        exampleview.frame = CGRect(x: 0, y: 0, width: padding, height: padding2)
        
        var array = [UIView]()
        array.removeAll()
        
        let n = gamesA.count
        
        for _ in 0 ..< n {
            array.append(UIView())
            //array += [UIView()] //also works
        }
        
        //for i in stride(from: 0, through: n-1, by: 1) {
        for i in 0...n-1 {
            
            createviews(index1: i, actualview: array[i], superviewer: exampleview, numberviews: n, team1: teamsA[2*i], team2: teamsA[2*i+1])
            
        }
        
        exampleview.contentSize = CGSize(width: view1.bounds.width, height: CGFloat(n) * view.bounds.height / 8)
        
    }
    
    func createviews (index1: Int, actualview: UIView, superviewer: UIScrollView, numberviews: Int, team1: String, team2: String) {
            
            superviewer.addSubview(actualview)
            actualview.frame = CGRect(x: 0, y: 0.05 + view.bounds.height / 8 * CGFloat(index1), width: superviewer.bounds.width, height: view.bounds.height / 8)
            actualview.backgroundColor = UIColor.init(red: CGFloat((7 + index1 * 0)) / 255, green: CGFloat((128 + index1 * 10)) / 255, blue: CGFloat((252 + index1 * 0)) / 255, alpha: 1)
            
            createlabels(type: 1, index: index1, superviewer: actualview, teller: index1 + 1, team1: team1, team2: team2)
            createlabels(type: 2, index: index1, superviewer: actualview, teller: index1 + 1, team1: team1, team2: team2)
            createlabels(type: 3, index: index1, superviewer: actualview, teller: index1 + 1, team1: team1, team2: team2)
            createlabels(type: 4, index: index1, superviewer: actualview, teller: index1 + 1, team1: team1, team2: team2)
            
        }

    
    func createlabels (type: Int, index: Int, superviewer: UIView, teller: Int, team1: String, team2: String ) {
        
        let x0 = superviewer.bounds.width
        let y0 = superviewer.bounds.height
        
        var x1:CGFloat = 0
        let y1 = y0 * 0.5
        let h1 = y0 * 0.2
        var w1:CGFloat = 0
        
        
        let temp1:String = team1
        var temp2:String = ""
        var temp3:String = ""
        let temp4:String = team2
        var temp5:String = ""
        
        
        if type == 1 {
        
            x1 = 0.05 * x0
            w1 = 0.30 * x0
            
            temp5 = temp1
            
        }
        
        if type == 2 {
        
            x1 = 0.40 * x0
            w1 = 0.08 * x0
            temp5 = temp2
            
        }
        
        if type == 3 {
        
            x1 = 0.52 * x0
            w1 = 0.08 * x0
            temp5 = temp3
        }
        
        if type == 4 {
        
            x1 = 0.65 * x0
            w1 = 0.30 * x0
            temp5 = temp4
            
        }
        
        if type == 1 || type == 4 {
        
            let label = UILabel(frame: CGRect(x: x1, y: y1, width: w1, height: h1))
            label.textAlignment = NSTextAlignment.center
            label.text = temp5
            label.font.withSize(11)
            superviewer.addSubview(label)
            
        }
        
        if type == 2 || type == 3 {
            
            var dummy = 0
            if type == 3 {
                dummy = 1 }
            
            arrayTxt.append(UITextField(frame: CGRect(x: x1, y: y1, width: w1, height: h1)))
            arrayTxt[index*2 + dummy].textAlignment = NSTextAlignment.center
            arrayTxt[index*2 + dummy].font?.withSize(11)
            arrayTxt[index*2 + dummy].backgroundColor = .yellow
            arrayTxt[index*2 + dummy].keyboardType = UIKeyboardType.numberPad
            superviewer.addSubview(arrayTxt[index*2 + dummy])
            
        }

        
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
