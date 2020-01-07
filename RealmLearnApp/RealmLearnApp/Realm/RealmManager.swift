//
//  RealmManager.swift
//  RealmLearnApp
//
//  Created by Fukuchi on 2020/01/07.
//  Copyright © 2020 Fukuchi. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmActionProtocol {
    
    func add()
    
    func delete(entity: HogeEntity)
    
    func fetch(primaryKey: Int) -> HogeEntity?
    
    func fetch() -> [HogeEntity]?
    
    func update()
}

class RealmManager: RealmActionProtocol {
    
    func add() {
        
        let entity = HogeEntity()
        
        entity.not_optional_string = "新しく追加したよ"
        
        do {
            let realm = try Realm()
            try realm.write {
                
                realm.add(entity)
            }
        }
        catch {
            
            print(error.localizedDescription)
        }
    }
    
    func delete(entity: HogeEntity) {
        
        do {
            let realm = try Realm()
            try realm.write {
                
                realm.delete(entity)
            }
        }
        catch {
            
            print(error.localizedDescription)
        }
    }
    
    func fetch(primaryKey: Int) -> HogeEntity? {
        
        do {
            
            let realm = try Realm()
            return realm.object(ofType: HogeEntity.self, forPrimaryKey: primaryKey)
        }
        catch {
            
            print(error.localizedDescription)
            return nil
        }
    }
    
    func fetch() -> [HogeEntity]? {
        
        let predicate = NSPredicate(format: "not_optional_string contains 'FUGA'")
        
        do {
            
            let realm = try Realm()
            return Array(realm.objects(HogeEntity.self).filter(predicate))
        }
        catch {
            
            print(error.localizedDescription)
            return nil
        }
    }
    
    func update() {

        do {
            let realm = try Realm()
            
            guard let updateTarget = realm.object(ofType: HogeEntity.self, forPrimaryKey: 1) else {
                
                return
            }
            try realm.write {

                updateTarget.not_optional_bool = true
            }
        }
        catch {
            
            print(error.localizedDescription)
        }
    }
}
