//
//  StorageManager.swift
//  swiftbook-5-MyPlaces
//
//  C reated by Влад on 12.02.23.
//

import RealmSwift

let realm = try! Realm()

class StorageManager{
    static func saveObject(_ place: Place){
        try! realm.write{
            realm.add(place)
        }
    }
    static func deleteObject(_ place: Place){
        try! realm.write{
            realm.delete(place)
        }
    }
}
