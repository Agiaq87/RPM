//
//  MotherView.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 28/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI

struct MotherView: View {
    @EnvironmentObject var viewModel: RPMEnvironmentViewModel
    
    public init() {
        print("MotherView")
    }
    
    var body: some View {
        VStack{
            self.viewModel.changeView()
        }
        .animation(.ripple())
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView()
    }
}
