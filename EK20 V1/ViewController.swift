//
//  ViewController.swift
//  EK20 V1
//
//  Created by Stéphane Trouvé on 29/04/2020.
//  Copyright © 2020 Stéphane Trouvé. All rights reserved.
//

import UIKit
import CoreData
import Firebase

public var PronosA = [Pronostiek]()

class ViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fixtureParsing()
        //loadPronos()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToForm" {
            
            let destinationVC = segue.destination as! FormViewController
            
        }
    }
    
    
    func loadPronos() {
        
        let request: NSFetchRequest<Pronostiek> = Pronostiek.fetchRequest()
        
        do {
            
            PronosA = try context.fetch(request)
            
        } catch {
            
            print("error while loading \(error)")
            
        }
        
        //tableView.reloadData()
        
    }
    
    
    func savePronos () {
        
        do {
            
            try context.save()
            
        } catch {
            
            print("error while saving \(error)")
            
        }
        
        //tableView.reloadData()
        
    }
    
    func fixtureParsing () {
        
            let headers = [
                "x-rapidapi-key": "a08ffc63acmshbed8df93dae1449p15e553jsnb3532d9d0c9b",
                "x-rapidapi-host": "api-football-v1.p.rapidapi.com"
            ]

            let request = NSMutableURLRequest(url: NSURL(string: "https://api-football-v1.p.rapidapi.com/v2/fixtures/league/2660?timezone=Europe%2FLondon")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers
            
        
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                
                
            if error == nil && data != nil {
                
                    
            let decoder = JSONDecoder()
                    
            do {
                        
                
                    let g = 305
                    let niveau1 = try decoder.decode(api1.self, from: data!)
                
                    print(niveau1)
                    
                
                    for n in 0...g {

                        //print(niveau1.api.fixtures[n].fixture_id)
                        let newFixture = Pronostiek(context: self.context)
                        newFixture.user = gebruiker
                        newFixture.fixture_ID = Int32(niveau1.api.fixtures[n].fixture_id)
                        newFixture.home_Goals = Int16(niveau1.api.fixtures[n].goalsHomeTeam)
                        newFixture.away_Goals = Int16(niveau1.api.fixtures[n].goalsAwayTeam)
                        newFixture.home_Team = niveau1.api.fixtures[n].homeTeam.team_name
                        newFixture.away_Team = niveau1.api.fixtures[n].awayTeam.team_name
                        
                        
//                        if let homeGoals = niveau1.api.fixtures[n].goalsHomeTeam {
//                            newFixture.home_Goals = String(homeGoals)
//                        } else {
//                            newFixture.home_Goals = "-"
//                        }
//
//                        if let awayGoals = niveau1.api.fixtures[n].goalsAwayTeam {
//                            newFixture.away_Goals = String(awayGoals)
//                        } else {
//                            newFixture.away_Goals = "-"
//                        }
                        
//                        newFixture.home_Goals = String(niveau1.api.fixtures[n].goalsHomeTeam ?? -1)
//                        newFixture.away_Goals = String(niveau1.api.fixtures[n].goalsAwayTeam ?? -1)
//
//
//                        if newFixture.home_Goals == "-1" {
//                            newFixture.home_Goals = "-"
//                        }
//
//
//                        if newFixture.away_Goals == "-1" {
//                            newFixture.away_Goals = "-"
//                        }
                        
                        PronosA.append(newFixture)
                        
                        //try self.context.savePronos2()

                    }
                
   
//                    for n in 0...g {
//                        
//                        print(PronosA[n].user ?? "Error 1")
//                        print(PronosA[n].fixture_ID)
//                        print(PronosA[n].home_Team)
//                        print(PronosA[n].away_Team)
//                        print(PronosA[n].home_Goals ?? "Error 1")
//                        print(PronosA[n].away_Goals ?? "Error 1")
//                        
//                    }
                
//                    fixturesIDA.append(niveau1.api.fixtures[0].fixture_id)
//                    fixturesIDA.append(niveau1.api.fixtures[1].fixture_id)
//
//
//                    teamsA.append(niveau1.api.fixtures[0].homeTeam.team_name.replacingOccurrences(of: ".", with: ""))
//                    teamsA.append(niveau1.api.fixtures[0].awayTeam.team_name.replacingOccurrences(of: ".", with: ""))
                        
                } catch {
                    
                    debugPrint(error)
                }
                    
            }
                            
            })
                
            dataTask.resume()

    }
    

}

//extension NSManagedObjectContext {
//    func savePronos2() throws {
//        let context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
//        context.parent = self
//
//        context.perform({
//            do {
//                try context.save()
//            } catch {
//                print(error)
//            }
//        })
//    }
//}



