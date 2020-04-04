//
//  TitleView.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 23/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI

struct TitleView: View {
    var image: String
    var imageWidth: Int
    var title: String
    var subTitle: String
    
    var body: some View {
        VStack {
            Image(self.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: CGFloat(imageWidth), alignment: .center)
                .accessibility(hidden: true)
            
            Text(self.title)
                .fontWeight(.black)
                .font(.title)
                .foregroundColor(Color.black)
            
            Text(self.subTitle)
                .fontWeight(.black)
                .font(.headline)
                .foregroundColor(Color.green)
                .shadow(color: Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)), radius: 1, x: 1, y: 1)
        }
        .padding(.top)
    }
}


struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(image: "Logo", imageWidth: 100, title: "Title", subTitle:"SubTitle")
    }
}
