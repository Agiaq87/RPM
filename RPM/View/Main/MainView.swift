//
//  MainView.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 29/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: RPMEnvironmentViewModel
    
    var body: some View {
//        ScrollView {
            VStack{
//            Text("OK")
            SimpleView(title: "CHOOSE", showNextButton: false)
            HStack{
                Button(action: {
                    self.viewModel.currentView+=1
                    }) {
                        Text("Standalone Mode").customButton()
                    }
                
                Button(action: {
                    self.viewModel.currentView+=3
                }) {
                    Text("External Mode").customButton()
                }
            }
            }
//        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(RPMEnvironmentViewModel())
    }
}
