//
//  AboutYouView.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 23/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI

class AboutYouViewModel: ObservableObject {
    @Published var ID:String = getUserID()
//    @Published var age:String = String(getUserAge())
    @Published var height:String = String(getUserHeight())
    @Published var weight:String = String(getUserWeight())
    @Published var crank:String = String(getRadius())
    
    public func update() {
        setUserID(ID: self.ID)
//        setUserAge(age: Int(self.age)!)
        setUserHeight(height: Int(self.height)!)
        setUserWeight(weight: Double(self.weight)!)
        setRadius(radius: Int(self.crank) ?? 0)
        print("Save all")
    }
}

struct AboutYouView: View {
    
    @ObservedObject var controller = AboutYouViewModel()
    
    var body: some View {
        ScrollView {
            HStack {
                Image(systemName: "questionmark.circle")
                    .font(.largeTitle)
                    .padding()
                    .accessibility(hidden: true)
                Text("Name:")
                    .font(.callout)
                    .bold()
                TextField("Name", text: $controller.ID)
                    .keyboardType(.alphabet)
            }
            
            HStack {
                Image(systemName: "questionmark.circle")
                    .font(.largeTitle)
                    .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
                    .padding()
                    .accessibility(hidden: true)
                Text("Height:")
                    .font(.callout)
                    .bold()
                TextField("172", text: $controller.height)
                    .keyboardType(.numberPad)
            }
            
            HStack {
                Image(systemName: "questionmark.circle")
                    .font(.largeTitle)
                    .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
                    .padding()
                    .accessibility(hidden: true)
                Text("Weight:")
                    .font(.callout)
                    .bold()
                TextField("85.5", text: $controller.weight)
                    .keyboardType(.decimalPad)
            }
            
            HStack {
                Image(systemName: "questionmark.circle")
                    .font(.largeTitle)
                    .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
                    .padding()
                    .accessibility(hidden: true)
                Text("Crank:")
                    .font(.callout)
                    .bold()
                TextField("175", text: $controller.crank)
                    .keyboardType(.decimalPad)
            }
            
            Button(action: {
                self.controller.update()
            }) {
                Text("Save")
                .customButton()
                .padding()
            }
        }
    }
}

struct AboutYouView_Previews: PreviewProvider {
    static var previews: some View {
        AboutYouView()
    }
}
