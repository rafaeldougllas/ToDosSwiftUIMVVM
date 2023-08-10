//
//  ToDoFormView.swift
//  SwiftUIToDoMVVM
//
//  Created by rafael douglas on 09/08/23.
//

import SwiftUI

struct ToDoFormView: View {
    @EnvironmentObject var dataStore: DataStore
    @ObservedObject var formViewModel: ToDoFormViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                VStack(alignment: .leading) {
                    TextField("ToDo", text: $formViewModel.name)
                    Toggle("Completed", isOn: $formViewModel.completed)
                }
            }
            .navigationTitle("ToDo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    cancelButton
                }
                ToolbarItem(placement: .topBarTrailing) {
                    updateSaveButton
                }
            }
        }
    }
}
extension ToDoFormView {
    func updateToDo() {
        let toDo = ToDo(id: formViewModel.id!,
                        name: formViewModel.name,
                        completed: formViewModel.completed)
        dataStore.updateToDo(toDo)
        presentationMode.wrappedValue.dismiss()
    }
    
    func addToDo() {
        let toDo = ToDo(name: formViewModel.name,
                        completed: formViewModel.completed)
        dataStore.addToDo(toDo)
        presentationMode.wrappedValue.dismiss()
    }
    
    var cancelButton: some View {
        Button("Cancel") {
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    var updateSaveButton: some View {
        Button(formViewModel.updating ? "Update" : "Save", action: formViewModel.updating ? updateToDo : addToDo)
            .disabled(formViewModel.isDisabled)
    }
}

#Preview {
    ToDoFormView(formViewModel: ToDoFormViewModel())
        .environmentObject(DataStore())
}
