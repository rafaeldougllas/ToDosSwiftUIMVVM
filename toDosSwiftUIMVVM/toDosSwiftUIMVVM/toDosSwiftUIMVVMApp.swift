//
//  ToDosSwiftUIMVVMApp.swift
//  ToDosSwiftUIMVVM
//
//  Created by rafael douglas on 10/08/23.
//

import SwiftUI

@main
struct ToDosSwiftUIMVVMApp: App {
    var body: some Scene {
        WindowGroup {
            ToDosView()
                .environmentObject(DataStore())
        }
    }
}
