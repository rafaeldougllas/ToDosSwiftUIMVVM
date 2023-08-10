//
//  ToDo.swift
//  SwiftUIToDoMVVM
//
//  Created by rafael douglas on 09/08/23.
//

import Foundation

struct ToDo: Identifiable, Codable {
    var id: String = UUID().uuidString
    var name: String
    var completed: Bool = false
    
    static var sampleData: [ToDo] {
        [
            ToDo(name: "Buy a new car"),
            ToDo(name: "Do Exercises", completed: true)
        ]
    }
}
