//
//  FinalView.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 23/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI

struct FinalView: View {
    @EnvironmentObject var viewModel: RPMEnvironmentViewModel
    var body: some View {
        VStack (alignment: .center){
            TitleView(image: "Logo", imageWidth: 100, title: "", subTitle: "RPM")
                    
            VStack(alignment: .center) {
                Text("Revolutions per minute")
                    .font(.headline)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer(minLength: CGFloat(30))
                    VStack {
                        Image("trophy")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: CGFloat(100), alignment: .center)
                            .accessibility(hidden: true)
                        Text("Ride, reach your goals and have fun")
                            .font(.headline)
                            .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
                            .multilineTextAlignment(.center)
                            .accessibility(addTraits: .isHeader)
                        Text("Proceed by entering your personal data for a precise and accurate experience.")
                            .font(.body)
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer(minLength: CGFloat(30))
                        Text("Choose the operating mode and proceed with the training.")
                            .font(.body)
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer(minLength: CGFloat(30))
                        Text("The results are always available and updated, don't worry about anything else and enjoy your ride exploring new landscapes or walking the streets of your city.")
                                .font(.body)
                                .foregroundColor(Color.gray)
                                .multilineTextAlignment(.center)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    Spacer(minLength: CGFloat(20.0))
                    HStack(alignment: .bottom){
                        Button(action: {
                            setSequenceWelcomeView()
                            self.viewModel.currentView+=1
                        }) {
                        Text("Let's Start").customButton()
                    }
                }
            }
            .padding(.horizontal)
            .animation(.ripple())
        }
    }
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView()
    }
}
