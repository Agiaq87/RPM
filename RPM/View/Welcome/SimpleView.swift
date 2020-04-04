//
//  SimpleView.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 23/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI

struct SimpleView: View {
    @EnvironmentObject var viewModel: RPMEnvironmentViewModel
    let title:String
    let showNextButton:Bool
    
    var body: some View {
//        ScrollView {
            VStack (alignment: .center){
                TitleView(image: "Logo", imageWidth: 100, title: "", subTitle: self.title)
                Text("Choose the prefered modality")
                .font(.headline)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                VStack(alignment: .center) {
                    SimpleElementView(image: "standalone", imageWidth: CGFloat(60), imageHeight: CGFloat(120), title: "Standalone", subTitle: "Insert your iPhone into your pocket and start a new ride automatically")
                    
                    SimpleElementView(image: "sensor-device", imageWidth: CGFloat(60), imageHeight: CGFloat(150), title: "External device", subTitle: "Connect the ESP32 to observe your informations on the iPhone screen")
                        .padding(.horizontal)
                }
                .padding(.horizontal)
                Spacer(minLength: CGFloat(20.0))
                if showNextButton {
                    HStack(alignment: .bottom){
                        Button(action: {self.viewModel.currentView+=1}) {
                            Text("Next").customButton()
                        }
                    }
                }
            }
//        }
        .padding(.horizontal)
    }
}

struct SimpleView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleView(title: "CHOOSE",showNextButton: true)
    }
}
