//
//  RegisterViewController.swift
//  EK20 V1
//
//  Created by Stéphane Trouvé on 09/05/2020.
//  Copyright © 2020 Stéphane Trouvé. All rights reserved.
//

import UIKit
import Firebase
import RealmSwift

class RegisterViewController: UIViewController {
    
    let link1 = "ek-20-test.de1a.cloud.realm.io"
    let realm = try! Realm()
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        teamsParsing()

    }
    

    @IBAction func registerPressed(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            if error != nil {
                print(error!)
            }
            else {
                
                gebruiker = self.emailTextfield.text!
                print("Successful registration")
                self.performSegue(withIdentifier: "goToForm", sender: self)
            }
            
        }
        
        
    }
    
    func teamsParsing () {
            
                let headers = [
                    "x-rapidapi-key": "a08ffc63acmshbed8df93dae1449p15e553jsnb3532d9d0c9b",
                    "x-rapidapi-host": "api-football-v1.p.rapidapi.com"
                ]

                let request = NSMutableURLRequest(url: NSURL(string: "https://api-football-v1.p.rapidapi.com/v2/fixtures/league/2660/next/10?timezone=Europe%2FLondon")! as URL,
                                                        cachePolicy: .useProtocolCachePolicy,
                                                    timeoutInterval: 10.0)
                request.httpMethod = "GET"
                request.allHTTPHeaderFields = headers

                let session = URLSession.shared
                let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                    
    //            if let data = data {
    //            if let jsonString = String(data: data, encoding: .utf8) {
    //                    print(jsonString)
    //                }
    //            }
                        
                        
                if error == nil && data != nil {
                    
                        
                let decoder = JSONDecoder()
                        
                do {
                        let niveau1 = try decoder.decode(api1.self, from: data!)

                        teamsA.append(niveau1.api.fixtures[0].homeTeam.team_name)
                        teamsA.append(niveau1.api.fixtures[0].awayTeam.team_name)
                        teamsA.append(niveau1.api.fixtures[1].homeTeam.team_name)
                        teamsA.append(niveau1.api.fixtures[1].awayTeam.team_name)
                        teamsA.append(niveau1.api.fixtures[2].homeTeam.team_name)
                        teamsA.append(niveau1.api.fixtures[2].awayTeam.team_name)
                        teamsA.append(niveau1.api.fixtures[3].homeTeam.team_name)
                        teamsA.append(niveau1.api.fixtures[3].awayTeam.team_name)
                            
                        gamesA = [teamsA[0] + " - " + teamsA[1], teamsA[2] + " - " + teamsA[3], teamsA[4] + " - " + teamsA[5], teamsA[6] + " - " + teamsA[7]]
                            
                    } catch {
                        
                        debugPrint(error)
                    }
                        
                }
                                
                })
                    
                dataTask.resume()

    }
    
}
