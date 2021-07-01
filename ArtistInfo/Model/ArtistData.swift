//
//  ArtistResult.swift
//  ArtistInfo
//
//  Created by Page Kallop on 6/30/21.
//

import Foundation

struct ArtistData: Codable {
    
    var resultCount : Int
    var results : [results]
}


struct results: Codable {
    
    var artistName : String
    var trackName : String
    var releaseDate : String
    var primaryGenreName : String
    var trackPrice : Float
}

