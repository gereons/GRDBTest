//
//  ProductDB.swift
//  GRDBTest
//
//  Created by Gereon Steffens on 06.12.17.
//  Copyright © 2017 tarent. All rights reserved.
//

import Foundation
import GRDB

class ProductDB {

    static var db: DatabaseQueue?

    static func dbFilename() -> String {
        var url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        url.appendPathComponent("products.sqlite3")
        return url.path
    }

    static func openDb() -> DatabaseQueue? {
        do {
            let file = dbFilename()
            return try DatabaseQueue(path: file)
        } catch let error {
            print("openDb error \(error)")
            return nil
        }
    }

    static func initialize() {
        self.db = openDb()
    }

}
