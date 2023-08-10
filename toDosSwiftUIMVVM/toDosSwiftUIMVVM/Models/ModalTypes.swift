//
//  ModalTypes.swift
//  SwiftUIToDoMVVM
//
//  Created by rafael douglas on 09/08/23.
//

import SwiftUI

enum ModalTypes: Identifiable, View {
    case new
    case update(ToDo)
    
    var id: String {
        switch self {
        case .new:
            return "new"
        case .update(_):
            return "update"
        }
    }
    
    var body: some View {
        switch self {
        case .new:
            return ToDoFormView(formViewModel: ToDoFormViewModel())
        case .update(let toDo):
            return ToDoFormView(formViewModel: ToDoFormViewModel(toDo))
        }
    }
}
