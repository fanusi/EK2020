//
//  Temp.swift
//  EK20 V1
//
//  Created by Stéphane Trouvé on 06/07/2020.
//  Copyright © 2020 Stéphane Trouvé. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

//class GlobalVar: Object {
//
//    var Sleutels = [String]()
//
//}

class Adres: Object {
    @objc dynamic var mail = ""
    @objc dynamic var sleutel = ""
//    var parentCategory = LinkingObjects(fromType: Bestand.self, property: "adressen")
}

//class Bestand: Object {
//    @objc dynamic var name = ""
//    let adressen = List<Adres>()
//}

