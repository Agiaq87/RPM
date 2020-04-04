//
//  SimpleElementView.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 27/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI

struct SimpleElementView: View {
    let image:String
    let imageWidth:CGFloat
    let imageHeight:CGFloat
    let title:String
    let subTitle:String
    
    var body: some View {
        VStack (alignment: .center){
            HStack {
                Image(image)
                    .resizable()
//                    .aspectRatio(contentMode: .fill)
                    .frame(width: imageWidth, height: imageHeight, alignment: .center)
                    .accessibility(hidden: true)
                VStack {
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
            }
        .padding()
            .animation(.ripple())
        }
    }
}

struct SimpleElementView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleElementView(image: "standalone", imageWidth: CGFloat(60), imageHeight: CGFloat(120), title: "Standalone", subTitle: "Insert your iPhone into your pocket and start a new ride automatically")
    }
}
