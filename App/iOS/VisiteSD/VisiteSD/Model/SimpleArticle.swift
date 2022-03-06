//
//  SimpleArticle.swift
//  VisiteSD
//
//  Created by Dimitri SMITH on 06/01/2022.
//

import Foundation

struct SimpleArticle: Codable {
    
    var id: UUID?
    var title: String
    var category: String
    var description: String
    var decouverte: Bool
    var longitude: String
    var latitude: String
    var data: Data
    var createdAt: String
    var updatedAt: String
}
