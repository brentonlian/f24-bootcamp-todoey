//
//  TodoModel.swift
//  f24-todoapp
//
//  Created by Brenton on 10/8/24.
//

import Foundation

struct Todo: Identifiable {
    var id = UUID()
    var text:String
    var isDone = false
}

extension Todo {
    static let example = Todo(text: "Do the dishes", isDone:false)
    static let exampleList = [example, Todo(text: "Cook food", isDone:false), Todo(text: "Wash clothes", isDone:false)]
}

