//
//  ToDosView.swift
//  SwiftUIToDoMVVM
//
//  Created by rafael douglas on 09/08/23.
//

import SwiftUI

struct ToDosView: View {
    @EnvironmentObject var dataStore: DataStore
    @State private var modalType: ModalTypes? = nil
    var body: some View {
        NavigationView {
            List() {
                ForEach(dataStore.toDos) { toDo in
                    Button {
                        modalType = .update(toDo)
                    } label: {
                        Text(toDo.name)
                            .font(.title3)
                            .strikethrough(toDo.completed)
                            .foregroundStyle(toDo.completed ? .green : Color(.label))
                        
                    }
                }
                .onDelete(perform: dataStore.deleteToDo)
            }
            .listStyle(InsetGroupedListStyle())
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("My ToDos")
                        .font(.largeTitle)
                        .foregroundStyle(Color.red)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        modalType = .new
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
        }
        .sheet(item: $modalType, content: { $0 })
    }
}

#Preview {
    ToDosView()
        .environmentObject(DataStore())
}
