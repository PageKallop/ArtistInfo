//
//  ViewController.swift
//  ArtistInfo
//
//  Created by Page Kallop on 6/30/21.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UITextFieldDelegate, ArtistManagerDelegate {
    
    
    var artistManager = ArtistManager()
    
    //search elements
    var searchField = UIElements().searchTextField
    var buttonSearch = UIElements().searchButton
    
    //UILabels
    var artistLabel = UIElements().artistNameLabel
    var trackName = UIElements().trackNameLabel
    var releaseDate = UIElements().releaseDateLabel
    var primaryGenre = UIElements().genreNameLabel
    var priceTrack = UIElements().trackPriceLabel
    
    //searched item labels
    var name = UIElements().nameLabel
    var track = UIElements().trackLabel
    var release = UIElements().releaseLabel
    var genre = UIElements().genreLabel
    var price = UIElements().track
    
    //holds elements
    var scrollView = UIElements().scrollView
    var stackView = UIElements().stackView
    
    //creates activity monitor
    var activityView = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        //adds items to view
        view.addSubview(searchField)
        view.addSubview(buttonSearch)
        view.addSubview(scrollView)
        
        //sets constraints
        buttonConstrain()
        searchConstrain()
        scrollConstraints()
        
        //assigns delegate method to self
        artistManager.delegate = self
        
        searchField.delegate = self 
        
        
        
        //sets the scrollview content size for scrolling
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height)
        
        //implements button action
        buttonSearch.addTarget(self, action: #selector(didPressButton), for: .touchUpInside)
   
    }
    //button action that retrieves artist name and start activity indicator
    @objc func didPressButton(){
        
        
        showActivityIndicatory()
        
        let name = searchField.text!
        
        let artistName = name.trimmingCharacters(in: .whitespaces).replacingOccurrences(of: " ", with: "%20")
        
        artistManager.getArtist(artistName: artistName)
        
        searchField.endEditing(true)
        print(artistName)
        
        print("Button was Pressed")
    }
    
    //creates activity indicator action and places it
    func showActivityIndicatory() {
       activityView.center = self.view.center
       self.view.addSubview(activityView)
       activityView.startAnimating()
   }
    
    //loads the artist data on the main thread
    func didLoadArtistInfo(_ artistManager: ArtistManager, artistListModel: ArtistModel) {
        
        DispatchQueue.main.async {
            
            
            self.artistLabel.text = artistListModel.artist
            self.trackName.text = artistListModel.track
            self.releaseDate.text = artistListModel.release
            self.primaryGenre.text = artistListModel.primaryGenre
            self.priceTrack.text = "$\(artistListModel.price)"
            
            self.activityView.stopAnimating()
        }
        
    }
    
    func didFailWithError(error: Error) {
        
    }
    //dismiss keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      
        searchField.resignFirstResponder()
        
        return true
    }
    
    
//MARK:- sets constraints for UIElements
    func searchConstrain(){
        
        searchField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        searchField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        searchField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        searchField.trailingAnchor.constraint(equalTo: buttonSearch.leadingAnchor, constant: -5).isActive = true
        searchField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -700).isActive = true
    }
    
    func buttonConstrain(){
        
        buttonSearch.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        buttonSearch.leadingAnchor.constraint(equalTo: searchField.trailingAnchor, constant: 10).isActive = true
        buttonSearch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        buttonSearch.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -700).isActive = true
    }
    
    func scrollConstraints(){
        
        scrollView.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 50).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor ).isActive = true
        
        
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(artistLabel)
        stackView.addArrangedSubview(track)
        stackView.addArrangedSubview(trackName)
        stackView.addArrangedSubview(release)
        stackView.addArrangedSubview(releaseDate)
        stackView.addArrangedSubview(genre)
        stackView.addArrangedSubview(primaryGenre)
        stackView.addArrangedSubview(price)
        stackView.addArrangedSubview(priceTrack)

        stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -50).isActive = true
        stackView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true 
  
    }
    
    
}

