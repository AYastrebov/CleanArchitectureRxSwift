//
//  CDAlbum+Ext.swift
//  CleanArchitectureRxSwift
//
//  Created by Andrey Yastrebov on 10.03.17.
//  Copyright © 2017 sergdort. All rights reserved.
//

import Foundation
import CoreData
import Domain
import QueryKit
import RxSwift

extension CDAlbum {
    static var title: Attribute<String> { return Attribute("title")}
    static var userId: Attribute<Int> { return Attribute("userId")}
    static var uid: Attribute<Int> { return Attribute("uid")}
}

extension CDAlbum: DomainConvertibleType {
    func asDomain() -> Album {
        return Album(title: title!,
                     uid: Int(uid),
                     userId: Int(userId))
    }
}

extension CDAlbum: Persistable {
    static var entityName: String {
        return "CDAlbum"
    }
}

extension Album: CoreDataRepresentable {
    typealias CoreDataType = CDAlbum
    
    func update(entity: CDAlbum) {
        entity.uid = Int64(uid)
        entity.title = title
        entity.userId = Int64(userId)
    }
}