//
//  ContentView.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 23/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI

struct MainChooserView: View {
    
    @EnvironmentObject var viewModel: RPMEnvironmentViewModel
    
//    var settingsButton: some View {
//        NavigationLink(destination: SettingsView()) {
//                Image(systemName: "gear")
//                .imageScale(.large)
//                .accessibility(label: Text("User Profile"))
//                .padding()
//            .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
//        }
//    }
//    
//    var chartButton: some View {
////        NavigationLink(destination: ChartView(), label:
//        Button(action: {self.viewModel.chartView.toggle() }) {
//                Image(systemName: "chart.bar")
//                .imageScale(.large)
//                .accessibility(label: Text("User Profile"))
//                .padding()
//            }.foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
////        )
//    }
//    private var trouble = UINotificationFeedbackGenerator()
    
    var body: some View {
        ScrollView{
            VStack{
                SimpleView(title:"CHOOSE MODALITY",showNextButton: false)
                HStack {
                    NavigationLink(destination: StandaloneView()){
                        Text("Standalone")
                            .customButton()
                    }
                    .padding(.horizontal)

                    NavigationLink(destination: ExternalView()) {
                        Text("External")
                            .customButton()
                    }
                    .padding(.horizontal)
                    
                }
            }
//            .navigationBarTitle(Text("RPM"), displayMode: .inline)
//            .navigationBarItems(
//                leading: chartButton,
//                trailing: settingsButton
//                )
        }
    }
}

struct MainChooserView_Previews: PreviewProvider {
    static var previews: some View {
        MainChooserView().environmentObject(RPMEnvironmentViewModel())
    }
}
