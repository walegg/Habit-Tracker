//
//  CheckedButtonView.swift
//  Habit Tracker
//
//  Created by Louis Mille on 05/08/2023.
//

import SwiftUI

struct CheckedButtonView: View {
    @StateObject var habits: Habits
    @State private var showingHabitDetails = false
    @State private var name = ""
    @State private var type = "Health"
    @State private var description = ""
    @State private var amount = 0
    
    var body: some View {
        Button {
            showingHabitDetails = true
            let item = HabitItem(name: name, type: type, amount: amount, description: description)
            habits.items.append(item)
        } label: {
            Text("\(Image(systemName: "plus")) Checked")
        }
        .sheet(isPresented: $showingHabitDetails) {
            HabitDetails()
        }
    }
}

struct CheckedButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CheckedButtonView(habits: Habits())
    }
}
