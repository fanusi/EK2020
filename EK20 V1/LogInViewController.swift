//
//  LogInViewController.swift
//  EK20 V1
//
//  Created by Stéphane Trouvé on 09/05/2020.
//  Copyright © 2020 Stéphane Trouvé. All rights reserved.
//

import UIKit
import Firebase

public var gebruiker = String()
public var teamsA = [String]()
public var gamesA = [String]()
public var fixturesIDA = [Int]()
public var master = [String]()


class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.text = "v@v.com"
        passwordTextField.text = "vvvvvv"
        
        teamsParsing()
        
//        for i in 1...8 {
//
//            print(teamsA[i])
//
//        }
        
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil {
                print("Error logging in")
            }
            else {
                gebruiker = self.emailTextField.text!
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
                
                    fixturesIDA.append(niveau1.api.fixtures[0].fixture_id)
                    fixturesIDA.append(niveau1.api.fixtures[1].fixture_id)
                    fixturesIDA.append(niveau1.api.fixtures[2].fixture_id)
                    fixturesIDA.append(niveau1.api.fixtures[3].fixture_id)
                    fixturesIDA.append(niveau1.api.fixtures[4].fixture_id)
                    fixturesIDA.append(niveau1.api.fixtures[5].fixture_id)
                    fixturesIDA.append(niveau1.api.fixtures[6].fixture_id)
                    fixturesIDA.append(niveau1.api.fixtures[7].fixture_id)
                    fixturesIDA.append(niveau1.api.fixtures[8].fixture_id)

                    teamsA.append(niveau1.api.fixtures[0].homeTeam.team_name.replacingOccurrences(of: ".", with: ""))
                    teamsA.append(niveau1.api.fixtures[0].awayTeam.team_name.replacingOccurrences(of: ".", with: ""))
                    teamsA.append(niveau1.api.fixtures[1].homeTeam.team_name.replacingOccurrences(of: ".", with: ""))
                    teamsA.append(niveau1.api.fixtures[1].awayTeam.team_name.replacingOccurrences(of: ".", with: ""))
                    teamsA.append(niveau1.api.fixtures[2].homeTeam.team_name.replacingOccurrences(of: ".", with: ""))
                    teamsA.append(niveau1.api.fixtures[2].awayTeam.team_name.replacingOccurrences(of: ".", with: ""))
                    teamsA.append(niveau1.api.fixtures[3].homeTeam.team_name.replacingOccurrences(of: ".", with: ""))
                    teamsA.append(niveau1.api.fixtures[3].awayTeam.team_name.replacingOccurrences(of: ".", with: ""))
                    teamsA.append(niveau1.api.fixtures[4].homeTeam.team_name.replacingOccurrences(of: ".", with: ""))
                    teamsA.append(niveau1.api.fixtures[4].awayTeam.team_name.replacingOccurrences(of: ".", with: ""))
                    teamsA.append(niveau1.api.fixtures[5].homeTeam.team_name.replacingOccurrences(of: ".", with: ""))
                    teamsA.append(niveau1.api.fixtures[5].awayTeam.team_name.replacingOccurrences(of: ".", with: ""))
                    teamsA.append(niveau1.api.fixtures[6].homeTeam.team_name.replacingOccurrences(of: ".", with: ""))
                    teamsA.append(niveau1.api.fixtures[6].awayTeam.team_name.replacingOccurrences(of: ".", with: ""))
                    teamsA.append(niveau1.api.fixtures[7].homeTeam.team_name.replacingOccurrences(of: ".", with: ""))
                    teamsA.append(niveau1.api.fixtures[7].awayTeam.team_name.replacingOccurrences(of: ".", with: ""))
                    teamsA.append(niveau1.api.fixtures[8].homeTeam.team_name.replacingOccurrences(of: ".", with: ""))
                    teamsA.append(niveau1.api.fixtures[8].awayTeam.team_name.replacingOccurrences(of: ".", with: ""))
                        
                    gamesA = [teamsA[0] + " - " + teamsA[1], teamsA[2] + " - " + teamsA[3], teamsA[4] + " - " + teamsA[5], teamsA[6] + " - " + teamsA[7], teamsA[8] + " - " + teamsA[9], teamsA[10] + " - " + teamsA[11], teamsA[12] + " - " + teamsA[13], teamsA[14] + " - " + teamsA[15], teamsA[16] + " - " + teamsA[17]]
                        
                } catch {
                    
                    debugPrint(error)
                }
                    
            }
                            
            })
                
            dataTask.resume()

    }
    
}
