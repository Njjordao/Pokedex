//
//  PokedexApp.swift
//  Pokedex
//
//  Created by user226748 on 9/26/22.
//

import SwiftUI

@main
struct PokedexApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(PokController())
        }
    }
}
