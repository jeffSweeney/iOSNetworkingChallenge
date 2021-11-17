//
//  LectureView.swift
//  iOSNetworkingChallenge
//
//  Created by Jeffrey Sweeney on 11/14/21.
//

import SwiftUI
import AVKit

struct LectureView: View {
    let lecture: Lecture
    
    var body: some View {
        VStack (spacing: 30) {
            // Title
            Text(lecture.title)
                .bold()
                .font(.title)
                .padding()
            
            // Video
            if let url = URL(string: lecture.url) {
                VideoPlayer(player: AVPlayer(url: url))
            } else {
                Text("Error: Unable to Load Video")
            }
            
            Spacer()
        }
    }
}
