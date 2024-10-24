//
//  CourseModel.swift
//  SemanaTec
//
//  Created by Rafael Alejandro Rivas González on 22/10/24.
//

import Foundation

struct Course: Codable, Identifiable{
    var id: Int
    var name: String?
    var course_code: String?
    var assigments: [Assignment] = []
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case course_code
    }
}
