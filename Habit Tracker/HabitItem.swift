//
//  File.swift
//  Habit Tracker
//
//  Created by Louis Mille on 04/08/2023.
//

import Foundation

struct HabitItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
    let description: String
}
