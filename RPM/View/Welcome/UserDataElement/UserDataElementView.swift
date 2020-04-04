//
//  UserDataElementView.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 27/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI

struct UserDataElement: View {
    @Binding var information:String
    let imageSFont:String
    let title:String
    let textFieldName:String
    let keyboardType:UIKeyboardType
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: imageSFont)
                .font(.largeTitle)
                .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
                .padding()
                .accessibility(hidden: true)
            Text(title)
                .font(.callout)
                .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
                .bold()
            TextField(textFieldName, text: $information)
                .keyboardType(keyboardType)
        }.padding(.horizontal, 10)
    }
}

