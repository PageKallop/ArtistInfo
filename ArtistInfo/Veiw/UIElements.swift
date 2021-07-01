//
//  UIElements.swift
//  ArtistInfo
//
//  Created by Page Kallop on 6/30/21.
//

import Foundation
import UIKit


struct UIElements {
    
    
    let searchTextField : UITextField = {
       let searchTextField = UITextField()
         searchTextField.placeholder = "Search"
         searchTextField.borderStyle = .roundedRect
         searchTextField.translatesAutoresizingMaskIntoConstraints = false
         searchTextField.leftViewMode = UITextField.ViewMode.always
         searchTextField.rightViewMode = UITextField.ViewMode.always
         searchTextField.backgroundColor = UIColor(red: 255/255, green: 130/255, blue: 113/255, alpha: 0.2)
         return searchTextField
     }()
    
    let searchButton : UIButton = {
        let button = UIButton(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
        button.backgroundColor = UIColor(red: 255/255, green: 130/255, blue: 113/255, alpha: 0.2)
        button.setTitle("Search Artist", for: .normal)
        button.titleLabel?.font = UIFont(name: "PingFang HK", size: 10)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    let artistNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.black
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let trackNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.black
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.black
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let genreNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.black
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    let trackPriceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.black
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Artist Name"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = UIColor.black
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let trackLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Track Name"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = UIColor.black
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let releaseLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Release Date"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = UIColor.black
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let genreLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Genre Label"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = UIColor.black
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    let track: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Track Price"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = UIColor.black
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var scrollView: UIScrollView = {
      let scrollView = UIScrollView()
      scrollView.backgroundColor = UIColor(red: 255/255, green: 130/255, blue: 113/255, alpha: 0.2)
      scrollView.isScrollEnabled = true
      scrollView.translatesAutoresizingMaskIntoConstraints = false
      return scrollView
    }()
    
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        return stackView
    }()
    
}
