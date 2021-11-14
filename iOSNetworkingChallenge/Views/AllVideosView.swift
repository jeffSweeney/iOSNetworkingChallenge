//
//  AllVideosView.swift
//  iOSNetworkingChallenge
//
//  Created by Jeffrey Sweeney on 11/14/21.
//

import SwiftUI

struct AllVideosView: View {
    @EnvironmentObject var model: LectureModel
    
    var body: some View {
        NavigationView {
            List(model.lectures) { lecture in
                NavigationLink(destination: {LectureView(lecture: lecture)}) {
                    Text(lecture.title)
                }
            }
            .navigationBarTitle("All Videos")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AllVideosView()
            .environmentObject(LectureModel())
    }
}
