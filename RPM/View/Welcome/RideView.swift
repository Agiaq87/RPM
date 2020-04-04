//
//  RideView.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 23/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI

struct RideView: View {
    @EnvironmentObject var viewModel: RPMEnvironmentViewModel
    
    var body: some View {
//        ScrollView {
            VStack (alignment: .center){
                TitleView(image: "Logo", imageWidth: 100, title: "", subTitle: "RIDE")
                    VStack(alignment: .center) {
                        Text("Set it for optimal use")
                            .font(.headline)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                        RideElementView(image: "Standalone-mode", imageWidth: CGFloat(100), imageHeight: CGFloat(150), title: "Standalone mode", subTitle: "Calibrate your iPhone, then put in your pocket. Simple and automated")
                RideElementView(image: "ESP32-mode", imageWidth: CGFloat(150), imageHeight: CGFloat(150), title: "Ext. device mode", subTitle: "Connect to BLE External device then put your iPhone on the handlebar. Simple and automated")

                }
                .padding(.horizontal)
                Spacer(minLength: CGFloat(20.0))
                HStack(alignment: .bottom){
                   Button(action: {self.viewModel.currentView+=1}) {
                        Text("Next").customButton()
                    }
                }
            }
        .padding(.horizontal)
//        }
    }
}

struct RideView_Previews: PreviewProvider {
    static var previews: some View {
        RideView().environmentObject(RPMEnvironmentViewModel())
    }
}


