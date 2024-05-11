//
//  MainVCViewModel.swift
//  25. დავალება - Animations - ანიმაციები
//
//  Created by gvantsa gvagvalia on 5/11/24.
//

import Foundation


protocol ViewModelDelegate: AnyObject {
    func updateSliderValue(_ value: Float)
}

class MainVCViewModel {
    weak var delegate: ViewModelDelegate?
    private var songModel: SongModel
    var minValue: Float = 0.0
    var maxValue: Float = 100.0
    var currentValue: Float = 0.0
    private let sliderTimeInterval: TimeInterval = 0.1
    private var selectedButton: Any?
    private var initiallySelectedIndex: Int = 1
    
    var songNameTitle: String {
        songModel.songName
    }
    
    var artistTitle: String {
        songModel.artist
    }
    
    var coverImage: String {
        songModel.image
    }
    
    init(songModel: SongModel) {
        self.songModel = songModel
    }
    
    func tabBarButtonTapped(_ sender: Any) {
        guard sender as AnyObject !== selectedButton as AnyObject else {
            return
        }
        selectedButton = sender
    }
    
    func updateSlider() {
        let totalDuration: Float = 15.0
        let range = maxValue - minValue
        let increment = range / (totalDuration / Float(sliderTimeInterval))
        
        currentValue = min(currentValue + increment, maxValue)
        delegate?.updateSliderValue(currentValue)
    }
}
