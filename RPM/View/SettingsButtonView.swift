//
//  SettingsButtonView.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 29/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI

struct SettingsButtonView: View {

    var body: some View {
        HStack {
            NavigationLink(destination: SettingsView()) {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .accessibility(label: Text("Settings"))
                    .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
            }
            NavigationLink(destination: ChartsView()) {
                Image(systemName: "book")
                    .imageScale(.large)
                    .accessibility(label: Text("Report"))
                    .padding()
                    .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
            }
        }
    }
}

struct SettingsButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButtonView()
    }
}
