////
////  VisualizerController.swift
////  EK20 V1
////
////  Created by Stéphane Trouvé on 27/05/2020.
////  Copyright © 2020 Stéphane Trouvé. All rights reserved.
////
//
//import UIKit
//import Firebase
////import RealmSwift
//
//
//class VisualizerController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
//
//    @IBOutlet weak var label: UILabel!
//    @IBOutlet weak var label2: UILabel!
//    @IBOutlet weak var label3: UILabel!
//    @IBOutlet weak var label4: UILabel!
//    @IBOutlet weak var pickerView: UIPickerView!
//    @IBOutlet weak var View1: UIView!
//    @IBOutlet weak var View2: UIView!
//
//    @IBOutlet weak var L1T1: UILabel!
//    @IBOutlet weak var L1T2: UILabel!
//    @IBOutlet weak var L2T1: UILabel!
//    @IBOutlet weak var L2T2: UILabel!
//    @IBOutlet weak var L3T1: UILabel!
//    @IBOutlet weak var L3T2: UILabel!
//    @IBOutlet weak var L4T1: UILabel!
//    @IBOutlet weak var L4T2: UILabel!
//    @IBOutlet weak var L1S1: UITextField!
//    @IBOutlet weak var L1S2: UITextField!
//    @IBOutlet weak var L2S1: UITextField!
//    @IBOutlet weak var L2S2: UITextField!
//    @IBOutlet weak var L3S1: UITextField!
//    @IBOutlet weak var L3S2: UITextField!
//    @IBOutlet weak var L4S1: UITextField!
//    @IBOutlet weak var L4S2: UITextField!
//
//
//    //var gebruikers: Results<Adres>?
//
//    var pronoArray: [Prono] = [Prono]()
//
//    let scoreDB = Database.database().reference().child("Scores2")
//
//    var userList:[DataSnapshot] = []
//    var temp2 = ""
//
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return teamsA.count / 2
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//
//        return gamesA[row]
//
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//
//
//        visualizer(choice1: row, team1: teamsA[row * 2], team2: teamsA[row * 2 + 1])
//
//    }
//
//    func retreiveProno () {
//
//        let scoreDB = Database.database().reference().child("Scores2")
//
//        scoreDB.observe(.childAdded) { (snapshot) in
//            //self.userList.append(snapshot)
//            let props = snapshot.value as! Dictionary<String,String>
//            let userEmail = props["Sender"]
//            let game1H = props["Game 1 - Home"]
//            let game1A = props["Game 1 - Away"]
//            let game2H = props["Game 2 - Home"]
//            let game2A = props["Game 2 - Away"]
//            let game3H = props["Game 3 - Home"]
//            let game3A = props["Game 3 - Away"]
//            let game4H = props["Game 4 - Home"]
//            let game4A = props["Game 4 - Away"]
//            let game5H = props["Game 5 - Home"]
//            let game5A = props["Game 5 - Away"]
//            let game6H = props["Game 6 - Home"]
//            let game6A = props["Game 6 - Away"]
//            let game7H = props["Game 7 - Home"]
//            let game7A = props["Game 7 - Away"]
//            let game8H = props["Game 8 - Home"]
//            let game8A = props["Game 8 - Away"]
//            let game9H = props["Game 9 - Home"]
//            let game9A = props["Game 9 - Away"]
//
//            print(userEmail!)
//            print(game1A!)
//            print(game1H!)
//
//            let newprono = Prono(sender: userEmail ?? "", Game1H: game1H ?? "", Game1A: game1A ?? "", Game2H: game2H ?? "", Game2A: game2A ?? "", Game3H: game3H ?? "", Game3A: game3A ?? "", Game4H: game4H ?? "", Game4A: game4A ?? "", Game5H: game5H ?? "", Game5A: game5A ?? "", Game6H: game6H ?? "", Game6A: game6A ?? "", Game7H: game7H ?? "", Game7A: game7A ?? "", Game8H: game8H ?? "", Game8A: game8A ?? "", Game9H: game9H ?? "", Game9A: game9A ?? "")
//            self.pronoArray.append(newprono)
//
//        }
//
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        retreiveProno()
//
//    }
//
//    func visualizer(choice1: Int, team1: String, team2: String) {
//
//        let exampleview = UIScrollView()
//        //let innerview1 = UIView()
//
//        exampleview.backgroundColor = .black
//        exampleview.translatesAutoresizingMaskIntoConstraints = false
//        //view.addSubview(exampleview)
//        View1.addSubview(exampleview)
//
//
//        //innerview1.backgroundColor = .systemBlue
//        //innerview1.translatesAutoresizingMaskIntoConstraints = false
//        //view.addSubview(innerview1)
//
//
////        let padding: CGFloat = view.bounds.width
////        let padding2: CGFloat = view.bounds.height
////        let padding3: CGFloat = view.bounds.height - padding2 * 0.05 - padding2 * 0.33
//
//        let padding: CGFloat = View1.bounds.width
//        let padding2: CGFloat = View1.bounds.height
//
//        //exampleview.frame = CGRect(x: padding * 0.05, y: padding2 * 0.05, width: padding * 0.9, height: padding3)
//        exampleview.frame = CGRect(x: 0, y: 0, width: padding, height: padding2)
//
//        var array = [UIView]()
//        array.removeAll()
//
//        let n = pronoArray.count
//
//        for _ in 0 ..< n {
//            array.append(UIView())
//            //array += [UIView()] //also works
//        }
//
//        for i in 0...n-1 {
//
//            createviews(index1: i, actualview: array[i], superviewer: exampleview, numberviews: n, choice1: choice1, team1: team1, team2: team2)
//
//        }
//
//        exampleview.contentSize = CGSize(width: View1.bounds.width, height: CGFloat(n) * view.bounds.height / 8)
//
//        print(pronoArray[1].sender)
//
//    }
//
//    func createviews (index1: Int, actualview: UIView, superviewer: UIScrollView, numberviews: Int, choice1: Int, team1: String, team2: String) {
//
//            superviewer.addSubview(actualview)
//            actualview.frame = CGRect(x: 0, y: 0.05 + view.bounds.height / 8 * CGFloat(index1), width: superviewer.bounds.width, height: view.bounds.height / 8)
//            actualview.backgroundColor = UIColor.init(red: CGFloat((7 + index1 * 0)) / 255, green: CGFloat((128 + index1 * 10)) / 255, blue: CGFloat((252 + index1 * 0)) / 255, alpha: 1)
//
//            createlabels(type: 1, superviewer: actualview, teller: index1 + 1, choice1: choice1, team1: team1, team2: team2)
//            createlabels(type: 2, superviewer: actualview, teller: index1 + 1, choice1: choice1, team1: team1, team2: team2)
//            createlabels(type: 3, superviewer: actualview, teller: index1 + 1, choice1: choice1, team1: team1, team2: team2)
//            createlabels(type: 4, superviewer: actualview, teller: index1 + 1, choice1: choice1, team1: team1, team2: team2)
//
//            let label2 = UILabel(frame: CGRect(x: 0, y: 0, width: actualview.bounds.width * 0.5, height: actualview.bounds.height * 0.3))
//            //label.center = CGPoint(x: superviewer.bounds.width / 2, y: superviewer.bounds.height / 2 + CGFloat(i-1) * 25)
//            //label.textAlignment = NSTextAlignment.center
//            label2.text = pronoArray[index1].sender
//            label2.font.withSize(11)
//            actualview.addSubview(label2)
//
//        }
//
//
//    func createlabels (type: Int, superviewer: UIView, teller: Int, choice1: Int, team1: String, team2: String ) {
//
//        let x0 = superviewer.bounds.width
//        let y0 = superviewer.bounds.height
//
//        var x1:CGFloat = 0
//        let y1 = y0 * 0.5
//        let h1 = y0 * 0.2
//        var w1:CGFloat = 0
//
//
//        let temp1:String = team1
//        var temp2:String = ""
//        var temp3:String = ""
//        let temp4:String = team2
//        var temp5:String = ""
//
//        switch (choice1) {
//        case 0:
//
//            temp2 = pronoArray[teller-1].Game1H
//            temp3 = pronoArray[teller-1].Game1A
//
//        case 1:
//
//            temp2 = pronoArray[teller-1].Game2H
//            temp3 = pronoArray[teller-1].Game2A
//
//        case 2:
//
//            temp2 = pronoArray[teller-1].Game3H
//            temp3 = pronoArray[teller-1].Game3A
//
//        case 3:
//
//            temp2 = pronoArray[teller-1].Game4H
//            temp3 = pronoArray[teller-1].Game4A
//
//        default:
//
//            temp2 = ""
//            temp3 = ""
//
//        }
//
//        if type == 1 {
//
//            x1 = 0.05 * x0
//            w1 = 0.30 * x0
//
//            temp5 = temp1
//
//        }
//
//        if type == 2 {
//
//            x1 = 0.40 * x0
//            w1 = 0.10 * x0
//            temp5 = temp2
//
//        }
//
//        if type == 3 {
//
//            x1 = 0.50 * x0
//            w1 = 0.10 * x0
//            temp5 = temp3
//        }
//
//        if type == 4 {
//
//            x1 = 0.65 * x0
//            w1 = 0.30 * x0
//            temp5 = temp4
//
//        }
//
//        let label = UILabel(frame: CGRect(x: x1, y: y1, width: w1, height: h1))
//        //label.center = CGPoint(x: superviewer.bounds.width / 2, y: superviewer.bounds.height / 2 + CGFloat(i-1) * 25)
//        label.textAlignment = NSTextAlignment.center
//        label.text = temp5
//        label.font.withSize(11)
//        superviewer.addSubview(label)
//
//
//
//
//    }
//
//
//
//
//}
//
