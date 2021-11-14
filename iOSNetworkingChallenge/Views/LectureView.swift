//
//  LectureView.swift
//  iOSNetworkingChallenge
//
//  Created by Jeffrey Sweeney on 11/14/21.
//

import SwiftUI

struct LectureView: View {
    let lecture: Lecture
    
    var body: some View {
        // TODO: Implement video player
        Text("You've reached the \(lecture.title) lecture")
            .padding()
    }
}
