//
//  Iterator.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 9/24/22.
//

import Foundation

// Iterator design pattern: The iterator pattern is used to provide a standard interface for traversing a collection of items in an aggregate object without the need to understand its underlying structure.

struct PetType {
    let type: String
}

struct PetTypes {
    let types: [PetType]
}

struct PetsIterator: IteratorProtocol {

    private var current = 0
    private let types: [PetType]

    init(types: [PetType]) {
        self.types = types
    }

    mutating func next() -> PetType? {
        defer { current += 1 }
        return types.count > current ? types[current] : nil
    }
}

extension PetTypes: Sequence {
    func makeIterator() -> PetsIterator {
        return PetsIterator(types: types)
    }
}

let petTypes = PetTypes(types: [PetType(type: "dog"), PetType(type: "cat"), PetType(type: "other")])

func petTypeList() -> [String] {
    var types: [String] = []
    for type in petTypes {
        types.append(type.type)
    }
    return types
}
