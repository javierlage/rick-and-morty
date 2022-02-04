//
//  ServiceError.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import Foundation

class ServiceError: Error {
    var message: String
    init(message: String = "Ops!!! something went wrong") {
        self.message = message
    }
}
