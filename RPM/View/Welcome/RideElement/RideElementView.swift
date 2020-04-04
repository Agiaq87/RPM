//
//  RideElement.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 27/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI

struct RideElementView: View {
    let image:String
    let imageWidth:CGFloat
    let imageHeight:CGFloat
    let title:String
    let subTitle:String
    
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: imageWidth, height: imageHeight, alignment: .center)
                .accessibility(hidden: true)
            Text(title)
                .font(.headline)
                .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
                .multilineTextAlignment(.center)
                .accessibility(addTraits: .isHeader)
            Text(subTitle)
                .font(.body)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
        }
        .animation(.ripple())
    }
}

struct RideElementView_Previews: PreviewProvider {
    static var previews: some View {
        RideElementView(image: "ESP32-mode", imageWidth: CGFloat(150), imageHeight: CGFloat(150), title: "Ext. device mode", subTitle: "Connect to BLE External device then put your iPhone on the handlebar. Simple and automated")
    }
}
