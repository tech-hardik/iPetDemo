//
//  Content-ViewModel.swift
//  iPetDemo
//
//  Created by HARDIK SHARMA on 31/05/23.
//

import Foundation
import SwiftUI

extension ContentView {
    class ViewModel: ObservableObject {
        @Published var pet: Pet
        private var repository = PetRepository()
        
        init(){
            pet = repository.loadData()
        }
         
        func saveData() {
            objectWillChange.send()
            repository.saveData(pet: pet)
        }
        
        func feed() {
            pet.lastMeal = Date()
            saveData()
        }
        
        func giveWater(){
            pet.lastDrink = Date()
            saveData()
        }
    }
}
