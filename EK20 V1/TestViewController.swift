//
//  TestViewController.swift
//  EK20 V1
//
//  Created by Stéphane Trouvé on 19/01/2021.
//  Copyright © 2021 Stéphane Trouvé. All rights reserved.
//

import UIKit
import CoreData



class TestViewController: UIViewController {

    var PronosB = [[Pronostiek]]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        testpronos()
        routine()
        createlabels()
    
    }
    
    func createlabels() {
        
        let t:Int = 3
        // Create t+1 test pronos
        
        let g:Int = 20
        // Number of games
        
        let br = view.bounds.width
        let ho = view.bounds.height
        
        let label1 = UILabel(frame: CGRect(x: br * 0.05, y: ho * 0.10 + ho * 0.05, width: br * 0.40, height: ho * 0.05))
        
        let label2 = UILabel(frame: CGRect(x: br * 0.50, y: ho * 0.10 + ho * 0.05, width: br * 0.20, height: ho * 0.05))
        
        label1.textAlignment = NSTextAlignment.left
        label1.text = "Player"
        label1.font.withSize(12)
        //label.backgroundColor = .red
        label1.textColor = .black
        view.addSubview(label1)
                            
        label2.textAlignment = NSTextAlignment.center
        label2.text = "Points"
        label2.font.withSize(12)
        //label.backgroundColor = .red
        label2.textColor = .black
        view.addSubview(label2)
        
        
        for i in 0...t {
            
            let label1 = UILabel(frame: CGRect(x: br * 0.05, y: ho * 0.20 + ho * 0.05 * CGFloat(i), width: br * 0.40, height: ho * 0.05))
            
            let label2 = UILabel(frame: CGRect(x: br * 0.50, y: ho * 0.20 + ho * 0.05 * CGFloat(i), width: br * 0.20, height: ho * 0.05))
            
            //Test 2
            
            label1.textAlignment = NSTextAlignment.left
            label1.text = PronosB[i][0].user
            label1.font.withSize(12)
            //label.backgroundColor = .red
            label1.textColor = .black
            view.addSubview(label1)
                                
            label2.textAlignment = NSTextAlignment.center
            label2.text = String(puntenSommatie(z: g, speler: PronosB[i]))
            label2.font.withSize(12)
            //label.backgroundColor = .red
            label2.textColor = .black
            view.addSubview(label2)
            
        }
        
    }
    
    func puntenSommatie (z: Int, speler: [Pronostiek]) -> Int {
        
        var som:Int = 0
        
        for l in 0...z {
            
            som = som + Int(speler[l].statistiek?.punten ?? 0)
            
        }
        
        return som
        
    }
    
    func calculator (speler: [Pronostiek]) {
        
        let g:Int = 20
        // Number of games
        
        var punten:Int = 0
        
        for j in 0...g {
            
            //reset punten voor elke match
            punten = 0
            
            if PronosA[j].home_Goals > PronosA[j].away_Goals && speler[j].home_Goals > speler[j].away_Goals {
                
                punten = punten + 1
                
                if PronosA[j].home_Goals == speler[j].home_Goals {
                    
                    punten = punten + 1
                    
                }
                
                if PronosA[j].away_Goals == speler[j].away_Goals {
                    
                    punten = punten + 1
                    
                }
                
            }

            if PronosA[j].home_Goals < PronosA[j].away_Goals && speler[j].home_Goals < speler[j].away_Goals {
                
                punten = punten + 1
                
                if PronosA[j].home_Goals == speler[j].home_Goals {
                    
                    punten = punten + 1
                    
                }
                
                if PronosA[j].away_Goals == speler[j].away_Goals {
                    
                    punten = punten + 1
                    
                }
                     
            }

            if PronosA[j].home_Goals == PronosA[j].away_Goals && speler[j].home_Goals == speler[j].away_Goals {
                
                punten = punten + 1
                
                if PronosA[j].home_Goals == speler[j].home_Goals {
                    
                    punten = punten + 2
                    
                }
                     
            }
            
            //toewijzen van punten
            let stat = Statistiek(context: context)
            stat.punten = Int16(punten)
            stat.user = speler[j].user
            
            speler[j].statistiek = stat
            
        }
        
    }
    
    func routine () {
        
        let t:Int = 3
        // Create t+1 test pronos
        
        for i in 0...t {
            
            calculator(speler: PronosB[i])
            
        }
        
    }
    
    func testpronos () {
        
        let t:Int = 3
        // Create t+1 test pronos
    
        let g:Int = 20
        // Number of games
        
        for i in 0...t {
            
            let newArrayFixtures = [Pronostiek(context: self.context)]
            PronosB.append(newArrayFixtures)
            
            PronosB[i][0].user = "User " + String(i+1)
            PronosB[i][0].fixture_ID = PronosA[0].fixture_ID
            PronosB[i][0].home_Goals = Int16.random(in: 0..<4)
            PronosB[i][0].away_Goals = Int16.random(in: 0..<4)
            PronosB[i][0].home_Team = PronosA[0].home_Team
            PronosB[i][0].away_Team = PronosA[0].away_Team
            
            for n in 1...g {

                let newFixture = Pronostiek(context: self.context)
                newFixture.user = "User " + String(i+1)
                newFixture.fixture_ID = PronosA[n].fixture_ID
                newFixture.home_Goals = Int16.random(in: 0..<4)
                newFixture.away_Goals = Int16.random(in: 0..<4)
                newFixture.home_Team = PronosA[n].home_Team
                newFixture.away_Team = PronosA[n].away_Team
                PronosB[i].append(newFixture)
                
            }
            
        }

//        for n in 0...g {
//
//            for i in 0...t  {
//
//                print(n)
//                print(i)
//                print(PronosB[i][n].user ?? "Error 1")
//                print(PronosB[i][n].fixture_ID)
//                print(PronosB[i][n].home_Team)
//                print(PronosB[i][n].away_Team)
//                print(PronosB[i][n].home_Goals ?? "Error 1")
//                print(PronosB[i][n].away_Goals ?? "Error 1")
//                print("Next")
//
//            }
//
//        }
        
    }
    

}
