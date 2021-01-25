//
//  FBData.swift
//  RapidAPI_Test
//
//  Created by Stéphane Trouvé on 11/11/2020.
//  Copyright © 2020 Stéphane Trouvé. All rights reserved.
//

import Foundation

struct fixture: Codable {
    var venue: String
    var fixture_id: Int
    var awayTeam: AT
    var homeTeam: HT
    var goalsAwayTeam: Int
    var goalsHomeTeam: Int
    
    enum CodingKeys: String, CodingKey { // Our Saviour
           case venue
           case fixture_id
           case awayTeam
           case homeTeam
           case goalsAwayTeam
           case goalsHomeTeam
       }
       
       // The Initializer function from Decodable
       init(from decoder: Decoder) throws {
           // 1 - Container
           let values = try decoder.container(keyedBy: CodingKeys.self)
           
           // 2 - Normal Decoding
           venue = try values.decode(String.self, forKey: .venue)
           fixture_id = try values.decode(Int.self, forKey: .fixture_id)
           awayTeam = try values.decode(AT.self, forKey: .awayTeam)
           homeTeam = try values.decode(HT.self, forKey: .homeTeam)
           
           // 3 - Conditional Decoding
           if var goalsAwayTeam =  try values.decodeIfPresent(Int.self, forKey: .goalsAwayTeam) {
               self.goalsAwayTeam = goalsAwayTeam
           } else {
               self.goalsAwayTeam = -999
           }
        
          if var goalsHomeTeam =  try values.decodeIfPresent(Int.self, forKey: .goalsHomeTeam) {
              self.goalsHomeTeam = goalsHomeTeam
          } else {
              self.goalsHomeTeam = -999
          }
       }
}

struct fixtures: Codable {
    var fixtures: [fixture]
}

struct api1: Codable {
    var api: fixtures
}

struct AT: Codable {
    var team_name: String
}

struct HT: Codable {
    var team_name: String
}
