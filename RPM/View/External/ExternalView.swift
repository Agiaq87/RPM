//
//  ExternalView.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 23/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct ExternalView: View {
    
    @State private var showingAlert = true
    @State private var showingBLE = true
    let gradient = Gradient(colors: [
        Color(#colorLiteral(red: 0.0597813651, green: 0.1324662268, blue: 0.08185582608, alpha: 1)),Color(#colorLiteral(red: 0.1076718643, green: 0.2384770513, blue: 0.1503904462, alpha: 1)),Color(#colorLiteral(red: 0.1811983883, green: 0.3980368376, blue: 0.2562336028, alpha: 1)),Color(#colorLiteral(red: 0.03790822998, green: 0.5133500099, blue: 0.159158349, alpha: 1)),Color(#colorLiteral(red: 0, green: 0.7401025295, blue: 0.2273449302, alpha: 1)),Color(#colorLiteral(red: 0, green: 0.9750948548, blue: 0.2962669134, alpha: 1))
    ])
    
    @EnvironmentObject var viewModel: RPMEnvironmentViewModel
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var reader = RPMBleReader(begin: 0, radius: getRadius(), weight: getUserWeight())
    @ObservedObject var compass = CompassManager()

    var saveButton: some View {
        Button(action: {
            let date = Date()
            let format = DateFormatter()
            format.timeZone = .current
            format.dateFormat = "yyyy-MM-dd hh:mm.ss"
            let session = Session(context: self.moc)
            session.date = format.string(from: date)
            session.max = self.reader.rpm.max
            session.min = self.reader.rpm.min
            session.avg = self.reader.rpm.avg
            session.distance = self.reader.rpm.distance
            session.velocity = self.reader.rpm.velocityLast
            session.kcal = self.reader.rpm.kcal
            session.total = self.reader.rpm.total
            session.modality = "external-book"
            session.goal = getGoal()
            session.duration = String(self.reader.rpm.minute)
            
            print(session)
            
            do {
                try self.moc.save()
                self.showingAlert = true
            } catch {
                print(error)
            }
        }) {
            Text("End session")
            .foregroundColor(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)))
        }
    .alert(isPresented: $showingAlert){
        Alert(title: Text("Saving report"), message: Text("You can see an report of this session touching book button"), dismissButton: .default(Text("Gotcha")))
        }
    }
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 20)!]
        self.reader.startRPM()
    }
    
    var body: some View {
        NavigationView {
            List {
            Section{
               RPMView(
                last: self.$reader.rpm.last,
                max: self.$reader.rpm.max,
                min: self.$reader.rpm.min,
                avg: self.$reader.rpm.avg,
                distance: self.$reader.rpm.distance,
                velocity: self.$reader.rpm.velocityLast,
                counted: self.$reader.rpm.counted,
                total: self.$reader.rpm.total,
                cal: self.$reader.rpm.kcal)
                    ZStack {
                            MapView()
                                .padding(.top, 100)
                                .padding(.horizontal, -10.0)
                                .frame(height: 700)
                        ZStack {
                            Circle()
                            .stroke(Color(#colorLiteral(red: 0.08664352447, green: 0.4768136144, blue: 0.2081719935, alpha: 1)), lineWidth: 2)
                            .opacity(0.1)
                            Circle()
                                .stroke(LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .trailing), lineWidth: 4)
                                .rotationEffect(Angle(degrees:-90))
                            ForEach(Marker.markers(), id: \.self) { marker in
                                Compass(marker: marker,
                                compassDegress: 0)
                            }
                        }
                        .frame(width: 60,
                               height: 80)
                            .rotationEffect(Angle(degrees: compass.degrees))
                        .statusBar(hidden: true)
                            .padding(.vertical, 4.0)
                            .position(.init(x: 330, y: 175))
                    }.frame(height: 500, alignment: .center)
                }
                
            }
            .navigationBarTitle(Text("External mode"), displayMode: .inline)
            .navigationBarItems(
                leading: SettingsButtonView(),
                trailing: saveButton
                )
        }
        .sheet(isPresented: $showingBLE) {
            BLEConnectionView(connection: self.$reader.connectedToDevice)
        }
    }
}

struct ExternalView_Previews: PreviewProvider {
    static var previews: some View {
        ExternalView().environmentObject(RPMEnvironmentViewModel())
    }
}
