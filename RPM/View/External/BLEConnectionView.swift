//
//  BLEConnectionView.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 13/03/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI

struct BLEConnectionView: View {
    @State private var sixth = false
    @State private var fifthWave = false
    @State private var fourthWave = false
    @State private var thirdWave = false
    @State private var secondWave = false
    @State private var firstWave = false
    
    @Binding var connection:Bool
    
    var body: some View {
        VStack {
            ZStack {
                Circle() // Outer Wave
                    .stroke()
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0.9750948548, blue: 0.2962669134, alpha: 1)))
                    .scaleEffect(sixth ? 16.75 : 1)
                    .opacity(sixth ? 0.5 : 1)
                    .animation(
                        Animation.easeInOut(duration: 1.0)
                            .delay(0.2)
                            .repeatForever(autoreverses: false)
                            .delay(1.8)
                    )
                    .onAppear() {
                        self.sixth.toggle()
                }
                
                Circle() // Outer Wave
                    .stroke()
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0.7401025295, blue: 0.2273449302, alpha: 1)))
                    .scaleEffect(fifthWave ? 16.50 : 1)
                    .opacity(fifthWave ? 0.5 : 1)
                    .animation(
                        Animation.easeInOut(duration: 1.0)
                            .delay(0.2)
                            .repeatForever(autoreverses: false)
                            .delay(1.8)
                    )
                    .onAppear() {
                        self.fifthWave.toggle()
                }
                
                Circle() // Outer Wave
                    .stroke()
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color(#colorLiteral(red: 0.03790822998, green: 0.5133500099, blue: 0.159158349, alpha: 1)))
                    .scaleEffect(fourthWave ? 16.25 : 1)
                    .opacity(fourthWave ? 0.5 : 1)
                    .animation(
                        Animation.easeInOut(duration: 1.0)
                            .delay(0.2)
                            .repeatForever(autoreverses: false)
                            .delay(1.8)
                    )
                    .onAppear() {
                        self.fourthWave.toggle()
                }
                
                Circle() // Outer Wave
                    .stroke()
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color(#colorLiteral(red: 0.1076718643, green: 0.2384770513, blue: 0.1503904462, alpha: 1)))
                    .scaleEffect(thirdWave ? 16 : 1)
                    .opacity(thirdWave ? 0.5 : 1)
                    .animation(
                        Animation.easeInOut(duration: 1.0)
                            .delay(0.2)
                            .repeatForever(autoreverses: false)
                            .delay(1.4)
                    )
                    .onAppear() {
                        self.thirdWave.toggle()
                }
                
                Circle() // Middle Wave
                    .stroke()
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color(#colorLiteral(red: 0.1076718643, green: 0.2384770513, blue: 0.1503904462, alpha: 1)))
                    .scaleEffect(secondWave ? 15.75 : 1)
                    .opacity(secondWave ? 0.5 : 1)
                    .animation(
                        Animation.easeInOut(duration: 1.0)
                            .delay(0.2)
                            .repeatForever(autoreverses: false)
                            .delay(1.2)
                    )
                    .onAppear() {
                        self.secondWave.toggle()
                }
                
                Circle() // Inner Wave
                    .stroke()
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color(#colorLiteral(red: 0.0597813651, green: 0.1324662268, blue: 0.08185582608, alpha: 1)))
                    .scaleEffect(firstWave ? 15.5 : 1)
                    .opacity(firstWave ? 0.5 : 1)
                    .animation(
                        Animation.easeInOut(duration: 1.0)
                            .delay(0.2)
                            .repeatForever(autoreverses: false)
                            .delay(1.0)
                    )
                    .onAppear() {
                        self.firstWave.toggle()
                }
                
                Circle()
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color(#colorLiteral(red: 0.0597813651, green: 0.1324662268, blue: 0.08185582608, alpha: 1)))
                Image(systemName: "antenna.radiowaves.left.and.right")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    
            }
            Text(self.connection ? "Connecting..." : "Connected, please swipe down")
                .foregroundColor(self.connection ? Color.black : Color(#colorLiteral(red: 0.03790822998, green: 0.5133500099, blue: 0.159158349, alpha: 1)))
        }
    }
}

struct BLEConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        BLEConnectionView(connection: .constant(false))
    }
}
