//
//  ChartsView.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 07/03/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import SwiftUI
import CoreData

struct ChartsView: View {
    @EnvironmentObject var viewModel: RPMEnvironmentViewModel
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Session.entity(), sortDescriptors: []) var sessions: FetchedResults<Session>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.sessions) { s in
                    ChartsRecordView(date: s.date, total: s.total, max: s.max, min: s.min, avg: s.avg, km: s.distance, velocity: s.velocity, kCal: s.kcal, tag: s.goal, modality: s.modality, duration: s.duration)
                }.onDelete { index in
                    let delete = self.sessions[index.first!]
                    self.moc.delete(delete)
                    
                    do {
                        try self.moc.save()
                    } catch {
                        print("Delete error")
                    }
                }
            }
            .padding(.top, 2.0)
            .navigationBarTitle("Sessions")
        }
    }
}

struct ChartsView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsView().environmentObject(RPMEnvironmentViewModel())
    }
}


