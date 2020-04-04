//
//  ChartsElementView.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 09/03/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI

struct ChartsRecordView: View {
    let date: String
    let total: Int64
    let max: Int16
    let min: Int16
    let avg: Double
    let km: Double
    let velocity: Double
    let kCal: Int64
    let tag: String
    let modality: String
    let duration: String
    
    init(date: String, total: Int64, max: Int16, min: Int16, avg: Double, km: Double, velocity: Double, kCal: Int64, tag: String, modality: String, duration: String) {
        self.date = date
        self.total = total
        self.max = max
        self.min = min
        self.avg = avg
        self.km = km
        self.velocity = velocity
        self.kCal = kCal
        self.tag = tag
        self.modality = modality
        self.duration = duration
    }
    
    var body: some View {
        Section(header: TitleSection(imageName: "calendar", title: date)){
        VStack {
            HStack{
                Image(modality)
                .padding(.leading, 2.0)
                    .frame(width: CGFloat(50.0), height: CGFloat(30.0), alignment: .center)
                Spacer()
                Image(systemName: "clock")
                    .padding(.leading, 2.0)
                Text("\(duration) minute")
                .font(.headline)
                Spacer()
                Image(systemName: "tag")
                    .padding(.leading, 2.0)
                Text(tag)
                .font(.headline)
                
            }
            .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
            
            HStack {
                Image(systemName: "goforward.plus")
                    .padding(.leading, 2.0)
                    .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
                Text("Total: \(total)")
                    .font(.body)
                Spacer()
            }
            
            HStack {
                Image(systemName: "arrow.up.circle")
                    .padding(.leading, 2.0)
                    .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
                Text("Max: \(max)")
                    .font(.body)
                Spacer()
                Image(systemName: "arrow.down.circle")
                    .padding(.leading, 2.0)
                    .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
                Text("Min: \(min)")
                    .font(.body)
                Spacer()
                Image(systemName: "arrow.up.arrow.down.circle")
                    .padding(.leading, 2.0)
                    .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
                Text("Avg: \(formatAVG(avg: avg))")
                    .font(.body)
            }
            
            HStack {
                Image(systemName: "arrow.right.circle")
                    .padding(.leading, 2.0)
                    .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
                Text("km: \(formatAVG(avg: km))")
                    .font(.body)
                Spacer()
                Image(systemName: "arrow.counterclockwise.circle")
                    .padding(.leading, 2.0)
                    .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
                Text("m/s: \(formatAVG(avg: velocity))")
                    .font(.body)
                Spacer()
                Image(systemName: "heart.circle")
                    .padding(.leading, 2.0)
                    .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
                Text("kCal: \(kCal)")
                    .font(.body)
                
            }
        }
    .padding()
    }
    }
}

struct ChartsRecordView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsRecordView(date: "00-00-00 00:00:00", total: 123456789, max: 130, min: 75, avg: 100.00, km: 55.0, velocity: 25.00, kCal: 255, tag: "Grimpeur", modality: "standalone-book", duration: "32")
    }
}
