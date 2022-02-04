//
//  Encodable.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import Foundation

extension Encodable {
    subscript(key: String) -> Any? {
        return dictionary[key]
    }

    var data: Data? {
        return try? JSONEncoder().encode(self)
    }

    var dictionary: [String: Any] {
        if let encodedData = data {
            do {
                return (try JSONSerialization.jsonObject(with: encodedData) as? [String: Any])!
            } catch {
                return [:]
            }
        }
        return [:]
    }
}
