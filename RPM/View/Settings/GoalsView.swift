//
//  GoalsView.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 11/03/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI

struct GoalsView: View {
    @EnvironmentObject var viewModel: RPMEnvironmentViewModel
    var body: some View {
        ScrollView {
            HStack {
                Image(systemName: "questionmark.circle")
                    .font(.largeTitle)
                    .padding()
                    .accessibility(hidden: true)
                Text("Select your goal:")
                    .font(.callout)
                    .bold()
                
            }
            
            
            Button(action: {
                self.viewModel.updateGoal()
            }) {
                Text("Save")
                .customButton()
                .padding()
            }
        }
    }
}

struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView().environmentObject(RPMEnvironmentViewModel())
    }
}
