//
//  ContentView.swift
//  RealmLearnApp
//
//  Created by Fukuchi on 2020/01/07.
//  Copyright © 2020 Fukuchi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let realmAction = RealmManager()
    var body: some View {
        
        return VStack {
            
            Button(action: {
                // Add Action
                self.realmAction.add()
            }) {
                Text("Add")
            }
            
            Button(action: {
                // Delete Action
            }) {
                Text("Delete")
            }
            
            Button(action: {
                // Fetch Action
            }) {
                Text("Fetch")
            }
            
            Button(action: {
                // Update Action
            }) {
                Text("Update")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}
