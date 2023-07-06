//
//  ContentView.swift
//  iPetDemo
//
//  Created by HARDIK SHARMA on 31/05/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    private let timer = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        Form {
            Section("Pet"){
                TextField("Name your pet!",text:$vm.pet.name)
                Image(vm.pet.happinessLevel == "Happy" ? "happy_pet" : "sad_pet")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200,height: 200)
                    .centerH()
                Text("Age: **\(vm.pet.age)** seconds")
                Text("Status: **\(vm.pet.happinessLevel)**")
                Text("Hunger: **\(vm.pet.hunger)**")
                Text("Thirst: **\(vm.pet.thirst)**")
            }
            Section("Actions"){
                Button("Feed", action: vm.feed)
                Button("Give Water", action: vm.giveWater)
            }
        }
        .onReceive(timer) { _ in
            vm.saveData()
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
