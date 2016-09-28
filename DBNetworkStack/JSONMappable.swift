//
//  JSONMappable.swift
//  DBNetworkStack
//
//	Legal Notice! DB Systel GmbH proprietary License!
//
//	Copyright (C) 2015 DB Systel GmbH
//	DB Systel GmbH; Jürgen-Ponto-Platz 1; D-60329 Frankfurt am Main; Germany; http://www.dbsystel.de/

//	This code is protected by copyright law and is the exclusive property of
//	DB Systel GmbH; Jürgen-Ponto-Platz 1; D-60329 Frankfurt am Main; Germany; http://www.dbsystel.de/

//	Consent to use ("licence") shall be granted solely on the basis of a
//	written licence agreement signed by the customer and DB Systel GmbH. Any
//	other use, in particular copying, redistribution, publication or
//	modification of this code without written permission of DB Systel GmbH is
//	expressly prohibited.

//	In the event of any permitted copying, redistribution or publication of
//	this code, no changes in or deletion of author attribution, trademark
//	legend or copyright notice shall be made.
//
//  Created by Lukas Schmidt on 30.08.16.
//

import Foundation

/**
 `JSONMappable` provides an interface for initializing objects with dictionarys.
 
 `JSONMappable` can be used to get an object from JSON
 */
public protocol JSONMappable {
    
    /**
     Creates an instance with a dictionary.
     */
    init(object: Dictionary<String, AnyObject>) throws
}

extension Array where Element: JSONMappable {
    init(JSONArray: Array<Dictionary<String, AnyObject>>) throws {
        self.init(try JSONArray.map { json in
                return try Element(object: json)
            })
    }
}
