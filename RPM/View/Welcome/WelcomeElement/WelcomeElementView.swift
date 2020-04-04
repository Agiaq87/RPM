//
//  PresentationElement.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 27/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI

struct WelcomeElementView: View {
    let imageSFont:String
    let title:String
    let subTitle:String
    
    var body: some View {
        Group{
        HStack(alignment: .center) {
            Image(systemName: imageSFont)
                .font(.largeTitle)
                .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
                .padding()
                .accessibility(hidden: true)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
                    .accessibility(addTraits: .isHeader)
                Text(subTitle)
                    .font(.body)
                    .foregroundColor(Color.gray)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .animation(.ripple())
        .padding(.top)
        }
    }
}

struct WelcomeElementView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeElementView(imageSFont: "clock", title: "Hello", subTitle: "tester")
    }
}
