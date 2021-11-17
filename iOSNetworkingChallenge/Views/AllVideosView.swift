//
//  AllVideosView.swift
//  iOSNetworkingChallenge
//
//  Created by Jeffrey Sweeney on 11/14/21.
//

import SwiftUI

struct AllVideosView: View {
    @EnvironmentObject var model: LectureModel
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List(searchResults) { lecture in
                NavigationLink(destination: {LectureView(lecture: lecture)}) {
                    Text(lecture.title)
                }
            }
            .searchable(text: $searchText)
            .navigationBarTitle("All Videos")
        }
    }
    
    private var searchResults: [Lecture] {
        guard !searchText.isEmpty else {
            return model.lectures
        }
        
        return model.lectures.filter {$0.title.contains(searchText)}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AllVideosView()
            .environmentObject(LectureModel())
    }
}
