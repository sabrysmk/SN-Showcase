//
//  DataService.swift
//  SN-Showcase
//
//  Created by Александр Сабри on 23/02/16.
//  Copyright © 2016 Александр Сабри. All rights reserved.
//

import Foundation
import Firebase

class DataService {
    static let ds = DataService()
    
    private var _REF_BASE = Firebase(url:"http://sn-showcase.firebaseio.com")
    
    var REF_BASE: Firebase{
        return _REF_BASE
    }
    
}