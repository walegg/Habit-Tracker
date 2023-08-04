//
//  AddHabit.swift
//  Habit Tracker
//
//  Created by Louis Mille on 04/08/2023.
//

import SwiftUI

struct AddHabit: View {
    @State private var name = ""
    @State private var type = "Health"
    @State private var description = ""
    @State private var amount = 0
    @ObservedObject var habits: Habits
    @Environment(\.dismiss) var dismiss
    
    let types = ["Health", "Work", "Relationships", "Personal Growth"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                TextField("Description", text: $description)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                Stepper("Current streak: \(amount)", value: $amount, in: 0...30, step: 1)
            }
            .navigationTitle("Add new habit")
            .toolbar {
                Button("Save") {
                    let item = HabitItem(name: name, type: type, amount: amount)
                    habits.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddHabit(habits: Habits())
    }
}
