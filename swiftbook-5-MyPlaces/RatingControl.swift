//
//  RatingControl.swift
//  swiftbook-5-MyPlaces
//
//  Created by Влад on 13.02.23.
//

import UIKit

class RatingControl: UIStackView {
    
    //MARK: Properties
    
    private var  ratingButtons = [UIButton]()
    
    var rating = 0
    
    //MARK: Initilization
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    //MARK: Button Action
    @objc func retingButtonTapped(button: UIButton){
        print("Button pressed")
    }
    
    //MARK: Private Methods
    
    private func setupButtons(){
        
        for _ in 1...5 {
            //Create the butto
            let button = UIButton()
            button.backgroundColor = .red
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 45.0).isActive = true
            button.widthAnchor.constraint(equalToConstant: 45.0).isActive = true
            
            //Setup yhe button action
            button.addTarget(self, action: #selector(retingButtonTapped(button:)), for: .touchUpInside )
            
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            //Add the new button on the rating button array
            ratingButtons.append(button)
            
        }
        
    }
    
}
