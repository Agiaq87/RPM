//
//  StandaloneView.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 23/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct StandaloneView: View {
    
    @Environment(\.managedObjectContext) var moc
    @EnvironmentObject var viewModel: RPMEnvironmentViewModel
    @ObservedObject var reader = RPMMotionReader(reference: getReferenceGy(), radius: getRadius(), begin: -1, weight: getUserWeight())
    
    @State var showingAlert:Bool = false

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
            session.modality = "standalone-book"
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
            VStack {
            List {
                Section(header: TitleSection(imageName: "slider.horizontal.3", title: "Session:")) {
                    VStack{
                    RPMView(
                        last: self.$reader.rpm.last,
                        max: self.$reader.rpm.max,
                        min: self.$reader.rpm.min,
                        avg: self.$reader.rpm.avg,
                        distance: self.$reader.rpm.distance,
                        velocity: self.$reader.rpm.velocityLast,
                        counted: self.$reader.rpm.counted,
                        total: self.$reader.rpm.total,
                        cal: self.$reader.rpm.kcal
                    )
                    }
                }
                Section(header: TitleSection(imageName: "chart.bar", title: "Charts:")) {
                    HStack {
                        LineView(data: self.reader.rpm.rpmData, title: "RPM")
                            .padding(.top, 120.0)
                    }
                }
            }
        }
            .navigationBarHidden(false)
            .navigationBarTitle(Text("RPM"), displayMode: .inline)
            .navigationBarItems(leading: SettingsButtonView(), trailing: saveButton)
        }
    }
}


struct StandaloneView_Previews: PreviewProvider {
    static var previews: some View {
        StandaloneView().environmentObject(RPMEnvironmentViewModel())
    }
}
