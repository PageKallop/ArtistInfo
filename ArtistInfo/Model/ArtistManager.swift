//
//  ArtistManager.swift
//  ArtistInfo
//
//  Created by Page Kallop on 6/30/21.
//

import Foundation

//creates protcal
protocol ArtistManagerDelegate {
    func didLoadArtistInfo(_ artistManager: ArtistManager, artistListModel: ArtistModel)
    func didFailWithError(error: Error)
}

struct ArtistManager {
    
    let artistURL = "https://itunes.apple.com/search?term="
    
    //sets the delegate
    var delegate: ArtistManagerDelegate?
    
    //creates url from text field input
    func getArtist(artistName: String){
        
        let urlString = "\(artistURL)\(artistName)"
 
    performRequest(with: urlString)
    }
    
    //creates api call and url session
    func performRequest(with urlString: String) {
       
        print(urlString)
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, responce, error in
                
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    print(error)
                    return
   
                }
                
                if let safeData = data {
                    if let artistListModel = self.parseJSON(safeData) {
                        self.delegate?.didLoadArtistInfo(self, artistListModel: artistListModel)
                        
                        print(safeData)
                    }
                }
                
            }
            task.resume()
        }
    
    }
    //Parses the json data and creates artist list
    func parseJSON(_ artistData: Data) -> ArtistModel? {

        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(ArtistData.self, from: artistData)
            print(decodedData)
            let artistName = decodedData.results[0].artistName
            let trackName = decodedData.results[0].trackName
            let releaseDate = decodedData.results[0].releaseDate
            let genre = decodedData.results[0].primaryGenreName
            let price = decodedData.results[0].trackPrice
            let artistListModel = ArtistModel(artist: artistName, track: trackName, release: releaseDate, primaryGenre: genre, price: price)
            print(artistListModel.artist)
            return artistListModel
        } catch {
            delegate?.didFailWithError(error: error)
            print(error)
            return nil
        }
    }
    
}
