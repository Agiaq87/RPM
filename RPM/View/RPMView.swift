//
//  RPMView.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 23/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI

struct RPMView: View {
    @Binding var last: Int16
    @Binding var max: Int16
    @Binding var min: Int16
    @Binding var avg: Double
    @Binding var distance: Double
    @Binding var velocity: Double
    @Binding var counted: Int16
    @Binding var total: Int64
    @Binding var cal:Int64
    
    var body: some View {
        VStack {
            HStack(alignment: .top){
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "gauge")
                            .font(.largeTitle)
                            .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
                        Text("RPM:")
                            .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
                        Text("\(last)")
                    }
                        .font(.largeTitle)
                        .padding(.top, 1.0)
                        .padding(.leading, -20.0)

                    HStack {
                        TitleSection(imageName: "goforward.plus", title: "REV: \(counted) \nTOT: \(total)")
                        Spacer()
                    }
                    .padding(.leading, -8.0)
                    .padding(.top, -25.0)
                    .font(.title)
                }
                .padding(.leading)
                Spacer()
                VStack(alignment: .leading) {
                    TitleSection(imageName: "arrow.up.circle", title: "MAX: \(max)")
                    TitleSection(imageName: "arrow.down.circle", title: "MIN: \(min)")
                    TitleSection(imageName: "arrow.up.arrow.down.circle", title: "AVG: \(formatAVG(avg: avg))")
                }
            }
            HStack(alignment: .top) {
                TitleSection(imageName: "arrow.right.circle", title: "m: \(formatAVG(avg: distance))").padding(.leading, 8.0)
                Spacer()
                TitleSection(imageName: "arrow.counterclockwise.circle", title: "m/s: \(formatAVG(avg: velocity))")
                Spacer()
                TitleSection(imageName: "heart.circle", title: "Cal:\(cal)")
                Spacer()
            }
            .padding(.leading, 4.0)
            .font(.headline)
            }
        .padding(.horizontal)
    }

}

struct RPMView_Previews: PreviewProvider {
    static var previews: some View {
        RPMView(
            last: .constant(130),
            max: .constant(145),
            min: .constant(90),
            avg: .constant(100.50),
            distance: .constant(280.33),
            velocity: .constant(170.15),
            counted: .constant(132),
            total: .constant(18456),
            cal: .constant(300)
        )
    }
}

