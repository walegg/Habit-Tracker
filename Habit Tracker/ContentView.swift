//
//  ContentView.swift
//  Habit Tracker
//
//  Created by Louis Mille on 04/08/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habits = Habits()
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(habits.items.filter { $0.type == "Health"}) { activity in
                        HStack {
                            VStack(alignment: .leading) {
                                if activity.type == "Health" {
                                    Text(activity.name)
                                        .foregroundColor(.green)
                                        .font(.headline)
                                        .fontWeight(.bold)
                                }
                            }
                            Spacer()
                        }
//                        VStack {
//                            if activity.type == "Health" {
//                                CheckedButtonView()
//                            }
//                        }
                    }
                    .onDelete(perform: removeItems)
                    .onMove { source, destination in
                        habits.items.move(fromOffsets: source, toOffset: destination)
                    }
                } header: {
                    Text("Health")
                }
                
                Section {
                    ForEach(habits.items.filter { $0.type == "Work"}) { activity in
                        HStack {
                            VStack(alignment: .leading) {
                                if activity.type == "Work" {
                                    Text(activity.name)
                                        .foregroundColor(.blue)
                                        .font(.headline)
                                        .fontWeight(.bold)
                                }
                            }
                            
                            Spacer()
                        }
//                        VStack {
//                            if activity.type == "Work" {
//                                CheckedButtonView()
//                            }
//                        }
                    }
                    .onDelete(perform: removeItems)
                    .onMove { source, destination in
                        habits.items.move(fromOffsets: source, toOffset: destination)
                    }
                } header: {
                    Text("Work")
                }
                
                Section {
                    ForEach(habits.items.filter { $0.type == "Relationships"}) { activity in
                        HStack {
                            VStack(alignment: .leading) {
                                if activity.type == "Relationships" {
                                    Text(activity.name)
                                        .foregroundColor(.orange)
                                        .font(.headline)
                                        .fontWeight(.bold)
                                }
                            }
                            Spacer()
                        }
//                        VStack {
//                            if activity.type == "Relationships" {
//                                CheckedButtonView()
//                            }
//                        }
                    }
                    .onDelete(perform: removeItems)
                    .onMove { source, destination in
                        habits.items.move(fromOffsets: source, toOffset: destination)
                    }
                } header: {
                    Text("Relationships")
                }
                
                Section {
                    ForEach(habits.items.filter { $0.type == "Personal Growth"}) { activity in
                        HStack {
                            VStack(alignment: .leading) {
                                if activity.type == "Personal Growth" {
                                    Text(activity.name)
                                        .foregroundColor(.purple)
                                        .font(.headline)
                                        .fontWeight(.bold)
                                }
                            }
                            Spacer()
                            
                        }
//                        VStack {
//                            if activity.type == "Personal Growth" {
//                                CheckedButtonView()
//                            }
//                        }
                    }
                    .onDelete(perform: removeItems)
                    .onMove { source, destination in
                        habits.items.move(fromOffsets: source, toOffset: destination)
                    }
                } header: {
                    Text("Personal Growth")
                }
            }
            .navigationBarTitle("Habit Tracker")
            .toolbar {
                EditButton()
                Button {
                    showingAddHabit = true
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $showingAddHabit) {
                    AddHabit(habits: habits)
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
