//
//  Pet-Model.swift
//  iPetDemo
//
//  Created by HARDIK SHARMA on 31/05/23.
//

import Foundation

struct Pet: Codable {
    var name: String
    var birthday = Date()
    var lastMeal: Date
    var lastDrink: Date
    
    var age: Int {
        let timeSince = calcTimeSince(data: birthday)
        return timeSince
    }
    
    var happinessLevel: String {
        hunger == "Hungry" || thirst == "Thirsty" ? "Unhappy" : "Happy"
    }
    
    var hunger: String {
        let timeSince = calcTimeSince(data: lastMeal)
        var string = "Hungry"
        
        switch timeSince{
        case 0..<10: string = "Satiated"
        case 10..<20: string = "Getting Hungry"
        case 20...: string = "Hungry"
        default: string = "Confused"
        }
        
        return string
    }
    
    var thirst: String {
        let timeSince = calcTimeSince(data: lastDrink)
        var string = "Thirsty"
        
        switch timeSince{
        case 0..<10: string = "Satiated"
        case 10..<20: string = "Getting Thirsty"
        case 20...: string = "Thirsty"
        default: string = "Confused"
        }
        
        return string
    }
}
