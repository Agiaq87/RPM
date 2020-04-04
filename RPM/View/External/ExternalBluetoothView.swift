//
//  ExternalBluetoothView.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 01/03/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI

struct ExternalBluetoothView: View {
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
                Image("sensor-device")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(.horizontal, 10.0)
                    .frame(width: CGFloat(100), height: CGFloat(100) ,alignment: .center)
                    .accessibility(hidden: true)
                Text("Start Bluetooth")
                    .font(.headline)
                    .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
                    .multilineTextAlignment(.center)
                    .accessibility(addTraits: .isHeader)
                Text("Use the system controller to start Bluetooth")
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
                Text("Wait. RPM connect and manage all for you")
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

struct ExternalBluetoothView_Previews: PreviewProvider {
    static var previews: some View {
        ExternalBluetoothView().environmentObject(RPMEnvironmentViewModel())
    }
}
