//
//  SettingsView.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 23/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var viewModel: RPMEnvironmentViewModel
    var body: some View {
        NavigationView {
            List {
                Section(header: TitleSection(imageName: "person.badge.plus", title: "About you:")) {
                    NavigationLink(destination: AboutYouView()){
                        ListElement(icon: "person.crop.square", title: "About you", subTitle: "Talk about you")
                    }
                    NavigationLink(destination: GoalsView()) {
                        ListElement(icon: "star.circle", title: "Daily goals", subTitle: "Here you can set your daily goals")
                    }
                }
                Section(header: TitleSection(imageName: "link.circle", title: "RPM Social:")) {
                    AdditionalElements()
                }
            }
            .padding(.top, 10.0)
            .navigationBarTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(RPMEnvironmentViewModel())
    }
}
