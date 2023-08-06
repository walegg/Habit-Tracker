//
//  HabitDetails.swift
//  Habit Tracker
//
//  Created by Louis Mille on 04/08/2023.
//

import SwiftUI

struct HabitDetails: View {
    @StateObject var habits = Habits()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Section {
                ForEach(habits.items.filter { $0.name == "Health" }) { habit in
                    HStack {
                        VStack {
                            Text("\(habit.name)")
                        }
                        VStack {
                            Text("\(habit.type)")
                        }
                        VStack {
                            Text("\(habit.description)")
                        }
                        VStack {
                            Text("\(habit.amount)")
                        }
                    }
                }
                .navigationTitle("Habit details")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}

struct HabitDetails_Previews: PreviewProvider {
    static var previews: some View {
        HabitDetails(habits: Habits())
    }
}
