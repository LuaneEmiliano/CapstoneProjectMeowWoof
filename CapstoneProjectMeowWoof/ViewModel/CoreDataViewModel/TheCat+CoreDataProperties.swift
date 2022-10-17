//
//  TheCat+CoreDataProperties.swift
//  Week9HomeWorkCoreData
//
//  Created by luane Niejelski on 10/16/22.
//

import SwiftUI
import CoreData

extension TheCat {
    
    @NSManaged public var name: String
    @NSManaged public var childFriendly: Int32
    @NSManaged public var dogFriendly: Int32
    @NSManaged public var energyLevel: Int32
    @NSManaged public var temperament: String
    
    static func createWith(
        name: String,
        childFriendly: Int32,
        dogFriendly: Int32,
        energyLevel: Int32,
        temperament: String,
        using managedObjectContext: NSManagedObjectContext) {
        let managedObject =  TheCat(context: managedObjectContext)
        managedObject.name = name
        managedObject.childFriendly = childFriendly
        managedObject.dogFriendly = dogFriendly
        managedObject.temperament = temperament
        managedObject.energyLevel = energyLevel
        do {
            try managedObjectContext.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror),\(nserror.userInfo)")
        }
    }
    
    static func basicFetchRequest() -> FetchRequest<TheCat> {
        FetchRequest<TheCat>(entity: TheCat.entity(), sortDescriptors: [])
    }
}
