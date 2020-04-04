//
//  GaugeView.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 23/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI

struct GaugeView: View {
    @EnvironmentObject var viewModel: RPMEnvironmentViewModel
    
    var body: some View {
//        ScrollView {
            VStack (alignment: .center){
                TitleView(image: "Logo", imageWidth: 100, title: "", subTitle: "GAUGE and CHECK")
                        
                VStack(alignment: .center) {
                    Text("Watch your results")
                        .font(.headline)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer(minLength: CGFloat(30))
                        VStack {
                            Image("clipboard")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: CGFloat(100), alignment: .center)
                                .accessibility(hidden: true)
                            Text("Keep track of your results and goals")
                                .font(.headline)
                                .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
                                .multilineTextAlignment(.center)
                                .accessibility(addTraits: .isHeader)
                            Text("Observe your goal and informations about your performance")
                                .font(.body)
                                .foregroundColor(Color.gray)
                                .multilineTextAlignment(.center)
                                .fixedSize(horizontal: false, vertical: true)
                            Image("map-compass")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: CGFloat(100), alignment: .center)
                                .accessibility(hidden: true)
                            Text("Don't lose your position")
                                .font(.headline)
                                .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
                                .multilineTextAlignment(.center)
                                .accessibility(addTraits: .isHeader)
                            Text("You can always know where you are thanks to the built-in map and compass")
                                .font(.body)
                                .foregroundColor(Color.gray)
                                .multilineTextAlignment(.center)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .animation(.ripple())
                }
                .padding(.horizontal)
                Spacer(minLength: CGFloat(20.0))
                HStack(alignment: .bottom){
                    Button(action: {self.viewModel.currentView+=1}) {
                        Text("Next").customButton()
                    }
                }
            }
        .padding(.horizontal)
//        }
    }
}

struct GaugeView_Previews: PreviewProvider {
    static var previews: some View {
        GaugeView()
    }
}
