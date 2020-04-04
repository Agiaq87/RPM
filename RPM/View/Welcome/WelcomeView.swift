//
//  WelcomeView.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 23/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI
import Combine


struct WelcomeView: View {
    @EnvironmentObject var viewModel: RPMEnvironmentViewModel
        
    var body: some View {
        ScrollView{
        VStack{
            TitleView(image: "Logo", imageWidth: 160, title: "Welcome to", subTitle: "RPM")
            WelcomeElementView(imageSFont: "hand.thumbsup", title: "Simple", subTitle: "Choose the prefered modality. Use RPM with ESP-WROOM-32 linked via Bluetooth or standalone ")
                .padding(.horizontal, 12.0)
            WelcomeElementView(imageSFont: "gear", title: "Ride", subTitle: "Start a new session riding with your favorite bicycle. Discover new place and track your position with map ")
            WelcomeElementView(imageSFont: "gauge.badge.plus", title: "Gauge", subTitle: "Be free to ride as you wish. RPM will take care of the rest")
            WelcomeElementView(imageSFont: "chart.bar", title: "Check", subTitle: "Observe your performance and keep track of your activity")
            Spacer(minLength: CGFloat(20.0))
            HStack(alignment: .bottom){
                if showSequenceWelcomeView() {
                    Button(action: {self.viewModel.currentView+=1}) {
                        Text("Next").customButton()
                    }
                } else {
                    Button(action: {self.viewModel.currentView+=6}) {
                        Text("Next").customButton()
                    }
                }
                
            }
        }
        .padding(.horizontal)
    }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView().environmentObject(RPMEnvironmentViewModel())
    }
}
