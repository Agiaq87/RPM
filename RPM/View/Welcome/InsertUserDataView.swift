//
//  InsertAboutYouView.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 23/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI

struct InsertUserDataView: View {
    @EnvironmentObject var viewModel: RPMEnvironmentViewModel
    @State var next:Bool = false
    
    var body: some View {
        ScrollView {
            VStack{
                TitleView(image: "Logo", imageWidth: 100, title: "Let's talking about", subTitle: "YOU")
                VStack {
                    Text("Inset this information to calibrate RPM")
                    UserDataElement(information: $viewModel.ID, imageSFont: "person.fill", title: "ID:", textFieldName: "Name and surname", keyboardType: UIKeyboardType.alphabet)
                    UserDataElement(information: $viewModel.height, imageSFont: "arrow.up.and.down.circle", title: "Height in cm:", textFieldName: "172", keyboardType: UIKeyboardType.numberPad)
                    UserDataElement(information: $viewModel.weight, imageSFont: "arrow.up.and.down.circle", title: "Weight in Kg:", textFieldName: "85.5", keyboardType: UIKeyboardType.numbersAndPunctuation)
                    UserDataElement(information: $viewModel.radius, imageSFont: "arrow.clockwise.circle", title: "Radius in mm:", textFieldName: "175", keyboardType: UIKeyboardType.numberPad)
                        
                   
                        Button(action: {
                            self.next = self.viewModel.update()
                            if !self.viewModel.errorData {
                                self.viewModel.currentView+=1
                            }
                        }) {
                            if self.next && self.viewModel.allDataCollect{
                                Text("Next").customButton()
                            } else {
                                Text("Waiting for all data...").waitingButton()
                            }
                        }
                        .alert(isPresented: $viewModel.errorData){
                            Alert(title: Text(viewModel.errorType), message: Text(viewModel.errorMsg), dismissButton: .default(Text("OK")))
                    }
                    }.animation(.ripple())
                }
            }
    }
}

struct InsertUserDataView_Previews: PreviewProvider {
    static var previews: some View {
        InsertUserDataView().environmentObject(RPMEnvironmentViewModel())
    }
}


