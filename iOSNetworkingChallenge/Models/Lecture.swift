//
//  Lecture.swift
//  iOSNetworkingChallenge
//
//  Represents a Model in the app
//
//  Created by Jeffrey Sweeney on 11/14/21.
//

import Foundation

struct Lecture: Decodable, Identifiable {
    var id: Int
    var title: String
    var url: String
}
