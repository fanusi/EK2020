//
//  Prono.swift
//  EK20 V1
//
//  Created by Stéphane Trouvé on 15/09/2020.
//  Copyright © 2020 Stéphane Trouvé. All rights reserved.
//

import Foundation

class Prono {
    
    var sender: String = ""
    var Game1H: String = ""
    var Game1A: String = ""
    var Game2H: String = ""
    var Game2A: String = ""
    var Game3H: String = ""
    var Game3A: String = ""
    var Game4H: String = ""
    var Game4A: String = ""
    var Game5H: String = ""
    var Game5A: String = ""
    var Game6H: String = ""
    var Game6A: String = ""
    var Game7H: String = ""
    var Game7A: String = ""
    var Game8H: String = ""
    var Game8A: String = ""
    var Game9H: String = ""
    var Game9A: String = ""
    
    init(sender: String, Game1H: String, Game1A: String, Game2H: String, Game2A: String, Game3H: String, Game3A: String, Game4H: String, Game4A: String, Game5H: String, Game5A: String, Game6H: String, Game6A: String, Game7H: String, Game7A: String, Game8H: String, Game8A: String, Game9H: String, Game9A: String) {
        self.sender = sender
        self.Game1H = Game1H
        self.Game1A = Game1A
        self.Game2H = Game2H
        self.Game2A = Game2A
        self.Game3H = Game3H
        self.Game3A = Game3A
        self.Game4H = Game4H
        self.Game4A = Game4A
        self.Game5H = Game1H
        self.Game5A = Game1A
        self.Game6H = Game2H
        self.Game6A = Game2A
        self.Game7H = Game3H
        self.Game7A = Game3A
        self.Game8H = Game4H
        self.Game8A = Game4A
        self.Game9H = Game4H
        self.Game9A = Game4A
    }
    
}
