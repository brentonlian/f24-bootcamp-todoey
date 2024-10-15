//
//  TodoListView.swift
//  f24-todoapp
//
//  Created by Brenton on 10/8/24.
//

import SwiftUI

struct TodoListView: View {
    @State private var todoList = Todo.exampleList
    @State private var newItemText = ""  // Updated name for clarity

    var body: some View {
        NavigationStack {
            List {
                Section("Add Todo") {
                    TextField("Add todo", text: $newItemText)
                        .onSubmit {
                            guard !newItemText.isEmpty else { return }
                            let newTodo = Todo(text: newItemText)
                            todoList.append(newTodo)  // Add new todo to list
                            newItemText = ""  // Clear input field
                        }
                }

                Section("Todos") {
                    ForEach($todoList) { $todo in
                        TodoRowView(todo: $todo)  // Use @Binding for todo item
                    }
                    .onDelete(perform: deleteTodo)  // Enable deletion
                }
            }
            .navigationTitle("Todoey")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("Count: \(todoList.count)")  // Display todo count
                }
            }
        }
    }

    // Function to delete a todo
    private func deleteTodo(at offsets: IndexSet) {
        todoList.remove(atOffsets: offsets)
    }
}

#Preview {
    TodoListView()
}

