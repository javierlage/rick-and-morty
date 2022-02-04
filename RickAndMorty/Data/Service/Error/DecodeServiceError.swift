//
//  DecodeServiceError.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import Foundation

class DecodeServiceError: ServiceError {
    override init(message: String = "Decode Error") {
        super.init(message: message)
    }
}
