//
//  PastTenseCD+CoreDataClass.swift
//  Verbs.Hebrew
//
//  Created by Anton Rubenchik on 03/03/2019.
//  Copyright © 2019 Anton Rubenchik. All rights reserved.
//
//

import Foundation
import CoreData


public class PastTenseCD: NSManagedObject {
    convenience init() {
        // Описание сущности
        let entity = NSEntityDescription.entity(forEntityName: "PastTenseCD", in: CoreDataManager.instance.persistentContainer.viewContext)
        // Создание нового объекта
        self.init(entity: entity!, insertInto: CoreDataManager.instance.persistentContainer.viewContext)
    }
}
