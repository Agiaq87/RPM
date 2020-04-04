//
//  StandaloneCalibrationView.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 28/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI

struct StandaloneCalibrationView: View {
    @EnvironmentObject var viewModel: RPMEnvironmentViewModel
    var body: some View {
        VStack{
            TitleView(image: "Logo", imageWidth: 100, title: "", subTitle: "CALIBRATION")
                .padding(.top, 0)
            Text("Follow the steps described")
                .font(.headline)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
            Spacer(minLength: CGFloat(30))
            VStack {
                Image("Standalone-mode")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: CGFloat(100), height: CGFloat(100) ,alignment: .center)
                    .accessibility(hidden: true)
                Text("Perpendicular to the ground")
                    .font(.headline)
                    .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
                    .multilineTextAlignment(.center)
                    .accessibility(addTraits: .isHeader)
                Text("Put your right foot on the pedal and lower it completely perpendicular to the ground")
                    .font(.body)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                Image("mobile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: CGFloat(100), alignment: .center)
                    .accessibility(hidden: true)
                Text("Then")
                    .font(.headline)
                    .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
                    .multilineTextAlignment(.center)
                    .accessibility(addTraits: .isHeader)
                Text("Place your iphone on the right leg and keep it fixed")
                    .font(.body)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .fixedSize(horizontal: false, vertical: true)
                Image("touch")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: CGFloat(100), alignment: .center)
                    .accessibility(hidden: true)
                Text("Finally")
                    .font(.headline)
                    .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
                    .multilineTextAlignment(.center)
                    .accessibility(addTraits: .isHeader)
                Text("Touch start to init")
                    .font(.body)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .animation(.ripple())
            Spacer()
            Button(action: {
                self.viewModel.currentView+=1
            }) {
                Text("Start").customButton()
            }
        }
    }
}

struct StandaloneCalibrationView_Previews: PreviewProvider {
    static var previews: some View {
        StandaloneCalibrationView().environmentObject(RPMEnvironmentViewModel())
    }
}
