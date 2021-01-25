//
//  VisualizerController.swift
//  EK20 V1
//
//  Created by Stéphane Trouvé on 27/05/2020.
//  Copyright © 2020 Stéphane Trouvé. All rights reserved.
//

import UIKit
import Firebase
//import RealmSwift


class VisualizerController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
        

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var View1: UIView!
    @IBOutlet weak var View2: UIView!
    
    var pronoArray: [Prono] = [Prono]()
    
    let scoreDB = Database.database().reference().child("Scores2")
    
//    var temp2 = ""

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return teamsA.count / 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return gamesA[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    
        visualizer(choice1: row, team1: teamsA[row * 2], team2: teamsA[row * 2 + 1])
        
    }
    
    func retreiveProno () {
        
        let scoreDB = Database.database().reference().child("Scores2")
        
        scoreDB.observe(.childAdded) { (snapshot) in
            
            var fixtures1 = [String]()
            
            for n in 0...8 {
                
                var game = teamsA[2*n] + " - " + teamsA[2*n + 1]
                var temp = game + " (Home)"
                var temp2 = game + " (Away)"
                fixtures1.append(temp)
                fixtures1.append(temp2)
                
            }
            
//            for i in 0...16 {
//
//                print(fixtures1[i])
//
//            }
            
            //self.userList.append(snapshot)
            let props = snapshot.value as! Dictionary<String,String>
            let userEmail = props["Sender"]
            let game1H = props[fixtures1[0]] ?? "-"
            let game1A = props[fixtures1[1]] ?? "-"
            let game2H = props[fixtures1[2]] ?? "-"
            let game2A = props[fixtures1[3]] ?? "-"
            let game3H = props[fixtures1[4]] ?? "-"
            let game3A = props[fixtures1[5]] ?? "-"
            let game4H = props[fixtures1[6]] ?? "-"
            let game4A = props[fixtures1[7]] ?? "-"
            let game5H = props[fixtures1[8]] ?? "-"
            let game5A = props[fixtures1[9]] ?? "-"
            let game6H = props[fixtures1[10]] ?? "-"
            let game6A = props[fixtures1[11]] ?? "-"
            let game7H = props[fixtures1[12]] ?? "-"
            let game7A = props[fixtures1[13]] ?? "-"
            let game8H = props[fixtures1[14]] ?? "-"
            let game8A = props[fixtures1[15]] ?? "-"
            let game9H = props[fixtures1[16]] ?? "-"
            let game9A = props[fixtures1[17]] ?? "-"
            
            let newprono = Prono(sender: userEmail ?? "", Game1H: game1H , Game1A: game1A , Game2H: game2H, Game2A: game2A, Game3H: game3H, Game3A: game3A , Game4H: game4H , Game4A: game4A, Game5H: game5H, Game5A: game5A, Game6H: game6H, Game6A: game6A, Game7H: game7H, Game7A: game7A, Game8H: game8H, Game8A: game8A, Game9H: game9H, Game9A: game9A)
            self.pronoArray.append(newprono)

        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        retreiveProno()

    }
    
    func visualizer(choice1: Int, team1: String, team2: String) {
        
        let exampleview = UIScrollView()
        //let innerview1 = UIView()
        
        exampleview.backgroundColor = .black
        exampleview.translatesAutoresizingMaskIntoConstraints = false
        //view.addSubview(exampleview)
        View1.addSubview(exampleview)
        
        
        //innerview1.backgroundColor = .systemBlue
        //innerview1.translatesAutoresizingMaskIntoConstraints = false
        //view.addSubview(innerview1)

        
//        let padding: CGFloat = view.bounds.width
//        let padding2: CGFloat = view.bounds.height
//        let padding3: CGFloat = view.bounds.height - padding2 * 0.05 - padding2 * 0.33
        
        let padding: CGFloat = View1.bounds.width
        let padding2: CGFloat = View1.bounds.height

        //exampleview.frame = CGRect(x: padding * 0.05, y: padding2 * 0.05, width: padding * 0.9, height: padding3)
        exampleview.frame = CGRect(x: 0, y: 0, width: padding, height: padding2)
        
        var array = [UIView]()
        array.removeAll()
        
        let n = pronoArray.count
        
        for _ in 0 ..< n {
            array.append(UIView())
            //array += [UIView()] //also works
        }
        
        for i in 0...n-1 {
            
            createviews(index1: i, actualview: array[i], superviewer: exampleview, numberviews: n, choice1: choice1, team1: team1, team2: team2)
            
        }
        
        exampleview.contentSize = CGSize(width: View1.bounds.width, height: CGFloat(n) * view.bounds.height / 8)
        
    }
    
    func createviews (index1: Int, actualview: UIView, superviewer: UIScrollView, numberviews: Int, choice1: Int, team1: String, team2: String) {
            
            superviewer.addSubview(actualview)
            actualview.frame = CGRect(x: 0, y: 0.05 + view.bounds.height / 8 * CGFloat(index1), width: superviewer.bounds.width, height: view.bounds.height / 8)
            actualview.backgroundColor = UIColor.init(red: CGFloat((7 + index1 * 0)) / 255, green: CGFloat((128 + index1 * 10)) / 255, blue: CGFloat((252 + index1 * 0)) / 255, alpha: 1)
            
            createlabels(type: 1, superviewer: actualview, teller: index1 + 1, choice1: choice1, team1: team1, team2: team2)
            createlabels(type: 2, superviewer: actualview, teller: index1 + 1, choice1: choice1, team1: team1, team2: team2)
            createlabels(type: 3, superviewer: actualview, teller: index1 + 1, choice1: choice1, team1: team1, team2: team2)
            createlabels(type: 4, superviewer: actualview, teller: index1 + 1, choice1: choice1, team1: team1, team2: team2)
            
            let label2 = UILabel(frame: CGRect(x: 0, y: 0, width: actualview.bounds.width * 0.5, height: actualview.bounds.height * 0.3))
            //label.center = CGPoint(x: superviewer.bounds.width / 2, y: superviewer.bounds.height / 2 + CGFloat(i-1) * 25)
            //label.textAlignment = NSTextAlignment.center
            label2.text = pronoArray[index1].sender
            label2.font.withSize(11)
            actualview.addSubview(label2)
            
        }

    
    func createlabels (type: Int, superviewer: UIView, teller: Int, choice1: Int, team1: String, team2: String ) {
        
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
        
        switch (choice1) {
        case 0:
            
            temp2 = pronoArray[teller-1].Game1H
            temp3 = pronoArray[teller-1].Game1A
            
        case 1:
 
            temp2 = pronoArray[teller-1].Game2H
            temp3 = pronoArray[teller-1].Game2A
        
        case 2:
            
            temp2 = pronoArray[teller-1].Game3H
            temp3 = pronoArray[teller-1].Game3A
        
        case 3:
            
            temp2 = pronoArray[teller-1].Game4H
            temp3 = pronoArray[teller-1].Game4A
 
        case 4:
            
            temp2 = pronoArray[teller-1].Game5H
            temp3 = pronoArray[teller-1].Game5A
            
        case 5:
 
            temp2 = pronoArray[teller-1].Game6H
            temp3 = pronoArray[teller-1].Game6A
        
        case 6:
            
            temp2 = pronoArray[teller-1].Game7H
            temp3 = pronoArray[teller-1].Game7A
        
        case 7:
            
            temp2 = pronoArray[teller-1].Game8H
            temp3 = pronoArray[teller-1].Game8A
            
        case 8:
            
            temp2 = pronoArray[teller-1].Game9H
            temp3 = pronoArray[teller-1].Game9A
            
        default:
            
            temp2 = ""
            temp3 = ""
        
        }
        
        if type == 1 {
        
            x1 = 0.05 * x0
            w1 = 0.30 * x0
            
            temp5 = temp1
            
        }
        
        if type == 2 {
        
            x1 = 0.40 * x0
            w1 = 0.10 * x0
            temp5 = temp2
            
        }
        
        if type == 3 {
        
            x1 = 0.50 * x0
            w1 = 0.10 * x0
            temp5 = temp3
        }
        
        if type == 4 {
        
            x1 = 0.65 * x0
            w1 = 0.30 * x0
            temp5 = temp4
            
        }
            
        let label = UILabel(frame: CGRect(x: x1, y: y1, width: w1, height: h1))
        label.textAlignment = NSTextAlignment.center
        label.text = temp5
        label.font.withSize(11)
        superviewer.addSubview(label)

        
    }
    

}
