//
//  AdditionalElements.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 23/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI

struct AdditionalElements: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 1.5) {
            Text("Social")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
                .padding(.leading, 5.0)
            
                ListElement(icon: "envelope.circle", title: "Suggest a feature", subTitle: "Contact me if you wanna suggest a new function")
                
                ListElement(icon: "link", title: "Facebook", subTitle: "Visit RPM Facebook page")
            
                ListElement(icon: "link", title: "Instagram", subTitle: "Visit RPM Instagram")
        }
    }
}

struct AdditionalElements_Previews: PreviewProvider {
    static var previews: some View {
        AdditionalElements()
    }
}
