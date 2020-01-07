//
//  HogeEntity.swift
//  RealmLearnApp
//
//  Created by Fukuchi on 2020/01/07.
//  Copyright © 2020 Fukuchi. All rights reserved.
//

import RealmSwift

class HogeEntity: Object {
    
    @objc dynamic var not_optional_bool = false // 非OptionalなBool
    let optional_bool = RealmOptional<Bool>() // OptionalなBool, importが'Realm'だと使用不可
    
    @objc dynamic var not_optional_int = Int.random(in: 1 ... 10000) // 非OptionalなInt
    let optional_int = RealmOptional<Int>() // OptionalなInt, importが'Realm'だと使用不可
    
    @objc dynamic var not_optional_float: Float = 0.0 // 非Optionalなfloat
    let optional_float = RealmOptional<Float>() // Optionalなfloat, importが'Realm'だと使用不可
    
    @objc dynamic var not_optional_double: Double = 0.0 // 非Optionalなdouble
    let optional_double = RealmOptional<Double>() // Optionalなdouble, importが'Realm'だと使用不可
    
    @objc dynamic var not_optional_string = "" // 非OptionalなString
    @objc dynamic var optional_string: String? = nil // OptionalなString
    
    @objc dynamic var not_optional_data = Data() // 非OptionalなData
    @objc dynamic var optional_data: Data? = nil // OptionalなData
    
    @objc dynamic var not_optional_date = Date() // 非OptionalなDate
    @objc dynamic var optional_date: Date? = nil // OptionalなDate
    
    @objc dynamic var optional_object: TestObject? // OptionalなObject, ObjectはOptionalのみ
    
    let non_optional_list = List<Int>() //非OptionalなList
    
    override static func primaryKey() -> String? {
        
        return "not_optional_int"
    }
}

// 例えば緯度経度をDBに保存する場合は、Object型にして保存してあげると楽かも
class TestObject: Object {
    
    var longitude: Float?
    var latitude: Float?
}
