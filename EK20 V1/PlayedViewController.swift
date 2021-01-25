//
//  PlayedViewController.swift
//  EK20 V1
//
//  Created by Stéphane Trouvé on 18/01/2021.
//  Copyright © 2021 Stéphane Trouvé. All rights reserved.
//

import UIKit
import Firebase

class PlayedViewController: UIViewController {
    
    var n = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        visualizer()

    }
    
    func visualizer() {
        
        let exampleview = UIScrollView()
        //let innerview1 = UIView()
        
        exampleview.backgroundColor = .black
        exampleview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(exampleview)
        
        
        let padding: CGFloat = view.bounds.width
        let padding2: CGFloat = view.bounds.height

        exampleview.frame = CGRect(x: 0, y: padding2 * 0.05, width: padding, height: padding2 * 0.90)
        
        var array = [UIView]()
        array.removeAll()
        
        repeat {
            n = n+1
        } while PronosA[n].away_Goals != -999
        
        for _ in 0 ..< n {
            array.append(UIView())
            //array += [UIView()] //also works
        }
        
        for i in 0...n-1 {
            
            createviews(index1: i, actualview: array[i], superviewer: exampleview, numberviews: n, team1: PronosA[n-1-i].home_Team ?? "-", team2: PronosA[n-1-i].away_Team ?? "-")
            
        }
        
        exampleview.contentSize = CGSize(width: padding, height: CGFloat(n) * padding2 / 8)
        
    }
    
    func createviews (index1: Int, actualview: UIView, superviewer: UIScrollView, numberviews: Int, team1: String, team2: String) {
            
            superviewer.addSubview(actualview)
            actualview.frame = CGRect(x: 0, y: 0.05 + view.bounds.height / 8 * CGFloat(index1), width: superviewer.bounds.width, height: view.bounds.height / 8)
            actualview.backgroundColor = UIColor.init(red: CGFloat((7 + index1 * 0)) / 255, green: CGFloat((128 + index1 * 2)) / 255, blue: CGFloat((252 + index1 * 0)) / 255, alpha: 1)
            
            createlabels(type: 1, superviewer: actualview, teller: index1, team1: team1, team2: team2)
            createlabels(type: 2, superviewer: actualview, teller: index1, team1: team1, team2: team2)
            createlabels(type: 3, superviewer: actualview, teller: index1, team1: team1, team2: team2)
            createlabels(type: 4, superviewer: actualview, teller: index1, team1: team1, team2: team2)
            
        }

    
    func createlabels (type: Int, superviewer: UIView, teller: Int, team1: String, team2: String ) {
        
        let x0 = superviewer.bounds.width
        let y0 = superviewer.bounds.height
        
        var x1:CGFloat = 0
        let y1 = y0 * 0.5
        let h1 = y0 * 0.2
        var w1:CGFloat = 0
        
        
        let temp1:String = team1
        let temp2:String = String(PronosA[n-1-teller].home_Goals)
        let temp3:String = String(PronosA[n-1-teller].away_Goals)
        let temp4:String = team2
        var temp5:String = ""
        
        
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
