//
//  TitleSection.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 23/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI

struct TitleSection: View {
    let imageName: String
    let title: String
    
    var body: some View {
        HStack{
            Image(systemName: imageName)
                .padding(.leading, -10.0)
            .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
            Text(title)
                .font(.headline)
            
        }
    }
}

struct TitleSection_Previews: PreviewProvider {
    static var previews: some View {
        TitleSection(imageName: "clockwise", title: "Hello")
    }
}
