//
//  ContentView.swift
//  f24-todoapp
//
//  Created by Brenton on 10/8/24.
//

import SwiftUI

struct TodoRowView: View {
    @Binding var todo: Todo
    var body: some View {
        HStack {
            Button {
                todo.isDone.toggle()
            } label: {
                Image(systemName: todo.isDone ? "checkmark.square.fill" : "square")
            }
            Text(todo.text)
        }
    }
}

#Preview {
    // Use a State container view for preview purposes
    TodoRowPreview()
}

// Helper view to provide @State for the preview
struct TodoRowPreview: View {
    @State private var exampleTodo = Todo(text: "Do dishes", isDone: false)

    var body: some View {
        TodoRowView(todo: $exampleTodo)
    }
}

