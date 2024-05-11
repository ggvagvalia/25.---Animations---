//
//  MainVC.swift.swift
//  25. დავალება - Animations - ანიმაციები
//
//  Created by gvantsa gvagvalia on 5/10/24.
//

import UIKit

class MainVC: UIViewController {
    // MARK: - Properties
    let mainVCViewModel: MainVCViewModel
    var selectedButton: UIButton?
    var isPlaying = false
    var previousSliderValue: Float = 0.0
    var sliderTimer: Timer?
    let sliderTimeInterval: TimeInterval = 0.1
    var sliderPaused = false
    var sliderPausedTime: TimeInterval = 0
    let sliderIncrement: Float = 0.1
    
    let heartsStackView: CustomHStackView = {
        let view = CustomHStackView()
        return view
    }()
    
    let heartButton1: CustomButton = {
        let view = CustomButton(type: .custom)
        return view
    }()
    
    let heartButton2: CustomButton = {
        let view = CustomButton(type: .custom)
        return view
    }()
    
    let heartButton3: CustomButton = {
        let view = CustomButton(type: .custom)
        return view
    }()
    
    let heartButton4: CustomButton = {
        let view = CustomButton(type: .custom)
        return view
    }()
    
    let heartButton5: CustomButton = {
        let view = CustomButton(type: .custom)
        return view
    }()
    
    let coverPhotoView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        return view
    }()
    
    let coverPhoto: CustomImageView = {
        let view = CustomImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        return view
    }()
    
    let spinningCircle = CustomSpinningView()
    
    let spinningView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let songInfoView: CustomHStackView = {
        let view = CustomHStackView()
        view.axis = .vertical
        view.alignment = .center
        return view
    }()
    
    lazy var songNameLabel: CustomLabel = {
        let view = CustomLabel()
        view.text = mainVCViewModel.songNameTitle
        view.font = UIFont.systemFont(ofSize: 24)
        return view
    }()
    
    lazy var artistNameLabel: CustomLabel = {
        let view = CustomLabel()
        view.text = mainVCViewModel.artistTitle
        view.font = UIFont.systemFont(ofSize: 18)
        return view
    }()
    
    let slider: UISlider = {
        let view = UISlider()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.minimumValue = 0
        view.maximumValue = 100
        view.value = 0
        view.tintColor = .blue
        return view
    }()
    
    let songPlaingStatusView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.alignment = .center
        return view
    }()
    
    let backwardEndButton: CustomButton = {
        let view = CustomButton(type: .custom)
        view.tintColor = .white
        view.backgroundColor = .clear
        view.setImage(UIImage(systemName: "backward.end"), for: .normal)
        return view
    }()
    
    let playButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 35)
        button.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.setImage(UIImage(systemName: "play"), for: .normal)
        button.setImage(UIImage(systemName: "pause"), for: .selected)
        button.layer.cornerRadius = 40
        button.clipsToBounds = true
        return button
    }()
    
    let forwardEndButton: CustomButton = {
        let view = CustomButton(type: .custom)
        view.tintColor = .white
        view.backgroundColor = .clear
        view.setImage(UIImage(systemName: "forward.end"), for: .normal)
        return view
    }()
    
    let repeatButton: CustomButton = {
        let view = CustomButton(type: .custom)
        view.tintColor = .white
        view.backgroundColor = .clear
        view.setImage(UIImage(systemName: "repeat"), for: .normal)
        return view
    }()
    
    let shuffleButton: CustomButton = {
        let view = CustomButton(type: .custom)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = .white
        view.backgroundColor = .clear
        view.setImage(UIImage(systemName: "shuffle"), for: .normal)
        return view
    }()
    
    lazy var tabBarView: UIStackView = {
        let view = UIStackView()
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.layer.cornerRadius = 40
        view.layer.shadowColor = UIColor.white.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 40
        view.translatesAutoresizingMaskIntoConstraints = false
        let darkBlueColor = UIColor(red: 10/155, green: 9/255, blue: 30/255, alpha: 1.0)
        view.backgroundColor = darkBlueColor
        view.axis = .horizontal
        view.distribution = .fillProportionally
        return view
    }()
    
    let homeSymbolButton: CustomButton = {
        let view = CustomButton(type: .custom)
        view.tintColor = .white
        view.backgroundColor = .clear
        view.setImage(UIImage(systemName: "house"), for: .normal)
        return view
    }()
    
    let musicSymbolButton: CustomButton = {
        let view = CustomButton(type: .custom)
        view.tintColor = .white
        view.backgroundColor = .clear
        view.setImage(UIImage(systemName: "music.note.list"), for: .normal)
        return view
    }()
    
    let heartSymbolButton: CustomButton = {
        let view = CustomButton(type: .custom)
        view.tintColor = .white
        view.backgroundColor = .clear
        return view
    }()
    
    init(mainVCViewModel: MainVCViewModel) {
        self.mainVCViewModel = mainVCViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        mainVCViewModel.delegate = self
    }
    
    // MARK: - setupUI
    func setupUI() {
        setupCovePhoto()
        setupSongInfo()
        addSlider()
        addSongPlaingStatusView()
        addTaabbarView()
        setupHeartsStackView()
    }
    
    func setupHeartsStackView() {
        view.addSubview(heartsStackView)
        heartsStackView.addArrangedSubview(heartButton1)
        heartsStackView.addArrangedSubview(heartButton2)
        heartsStackView.addArrangedSubview(heartButton3)
        heartsStackView.addArrangedSubview(heartButton4)
        heartsStackView.addArrangedSubview(heartButton5)
        
        NSLayoutConstraint.activate([
            heartsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            heartsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
    }
    
    func setupCovePhoto() {
        view.addSubview(coverPhotoView)
        coverPhotoView.addSubview(coverPhoto)
        
        NSLayoutConstraint.activate([
            coverPhotoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            coverPhotoView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.79),
            coverPhotoView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.77),
            coverPhotoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            coverPhoto.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.52),
            coverPhoto.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            coverPhoto.centerXAnchor.constraint(equalTo: coverPhotoView.centerXAnchor),
            coverPhoto.centerYAnchor.constraint(equalTo: coverPhotoView.centerYAnchor),
        ])
    }
    
    internal func configureLoadingView() {
        view.addSubview(spinningCircle)
        spinningCircle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            spinningCircle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinningCircle.centerYAnchor.constraint(equalTo: songInfoView.topAnchor, constant: -35),
            spinningCircle.widthAnchor.constraint(equalToConstant: 50),
            spinningCircle.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func stopLoading() {
        spinningCircle.removeFromSuperview()
    }
    func setupSongInfo() {
        view.addSubview(songInfoView)
        songInfoView.addArrangedSubview(songNameLabel)
        songInfoView.addArrangedSubview(artistNameLabel)
        
        NSLayoutConstraint.activate([
            songInfoView.topAnchor.constraint(equalTo: coverPhotoView.bottomAnchor, constant: 60),
            songInfoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func addSlider() {
        view.addSubview(slider)
        
        NSLayoutConstraint.activate([
            slider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 22),
            slider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -22),
            slider.topAnchor.constraint(equalTo: songInfoView.safeAreaLayoutGuide.bottomAnchor, constant: 10),
        ])
    }
    
    func addSongPlaingStatusView() {
        view.addSubview(songPlaingStatusView)
        songPlaingStatusView.addArrangedSubview(shuffleButton)
        songPlaingStatusView.addArrangedSubview(backwardEndButton)
        songPlaingStatusView.addArrangedSubview(playButton)
        songPlaingStatusView.addArrangedSubview(forwardEndButton)
        songPlaingStatusView.addArrangedSubview(repeatButton)
        
        NSLayoutConstraint.activate([
            songPlaingStatusView.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 20),
            songPlaingStatusView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 22),
            songPlaingStatusView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -22),
            songPlaingStatusView.heightAnchor.constraint(equalToConstant: 100),
            
            playButton.centerXAnchor.constraint(equalTo: songPlaingStatusView.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: songPlaingStatusView.centerYAnchor),
            playButton.widthAnchor.constraint(equalToConstant: 80),
            playButton.heightAnchor.constraint(equalToConstant: 80)
        ])
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
    }
    
    func addTaabbarView() {
        view.addSubview(tabBarView)
        tabBarView.addArrangedSubview(homeSymbolButton)
        tabBarView.addArrangedSubview(musicSymbolButton)
        tabBarView.addArrangedSubview(heartSymbolButton)
        
        NSLayoutConstraint.activate([
            tabBarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 22),
            tabBarView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -22),
            tabBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            tabBarView.heightAnchor.constraint(equalToConstant: 90)
        ])
        
        let buttons = [homeSymbolButton, musicSymbolButton, heartSymbolButton]
        for button in buttons {
            button.addTarget(self, action: #selector(tabBarButtonTapped(_:)), for: .touchUpInside)
        }
    }
    @objc func playButtonTapped() {
        animateButtonPop(playButton)
        
        if !playButton.isSelected {
            configureLoadingView()
            spinningCircle.startAnimation()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.stopLoading()
                self.sliderPaused = false
                let currentTime = Date().timeIntervalSinceReferenceDate - self.sliderPausedTime
                self.previousSliderValue += Float(currentTime / 10 ) * self.slider.maximumValue - self.slider.minimumValue
                let scaleX = self.coverPhotoView.bounds.width / self.coverPhoto.bounds.width
                let scaleY = self.coverPhotoView.bounds.height / self.coverPhoto.bounds.height
                self.coverPhoto.transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
                self.isPlaying = true
                self.startSliderTimer()
                self.playButton.isSelected.toggle()
            }
        } else {
            sliderPaused = true
            sliderPausedTime = Date().timeIntervalSinceReferenceDate
            slider.isSelected = false
            coverPhoto.transform = .identity
            isPlaying = false
            sliderTimer?.invalidate()
            playButton.isSelected.toggle()
        }
    }
    
    func startSliderTimer() {
        sliderTimer = Timer.scheduledTimer(timeInterval: sliderTimeInterval, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
    }
    
    @objc func updateSlider() {
        mainVCViewModel.updateSlider()
    }
    
    func animateButtonPop(_ button: UIButton) {
        let originalColor = button.backgroundColor
        let fadedColor = originalColor?.withAlphaComponent(0.8)
        
        UIView.animate(withDuration: 0.3, animations: {
            button.backgroundColor = fadedColor
        }) { _ in
            UIView.animate(withDuration: 0.3) {
                button.backgroundColor = originalColor
            }
        }
        
        UIView.animate(withDuration: 0.3, animations: {
            button.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        }) { _ in
            UIView.animate(withDuration: 0.3) {
                button.transform = .identity
            }
        }
    }
    
    @objc func tabBarButtonTapped(_ sender: UIButton) {
        guard sender != selectedButton else {
            return
        }
        selectedButton?.transform = .identity
        selectedButton?.tintColor = .white
        selectedButton = sender
        
        UIView.animate(withDuration: 0.3) {
            sender.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            sender.tintColor = .blue
        }
    }
}

extension MainVC: ViewModelDelegate {
    //    func startSliderProgress(progress: Float, animated: Bool) {
    //    }
    //
    func updateSliderValue(_ value: Float) {
        slider.value = mainVCViewModel.currentValue
        slider.value = value
    }
    
}
