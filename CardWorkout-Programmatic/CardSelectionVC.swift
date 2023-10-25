//
//  CardSelectionVC.swift
//  CardWorkout-Programmatic
//
//  Created by Enes Kaya on 25.10.2023.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    let cardImageView   = UIImageView()
    let stopButton      = CWButton(backgroundColor: .systemRed, title: "Stop!", systemImageName: "stop.circle")
    let resetButton     = CWButton(backgroundColor: .systemGreen, title: "Reset", systemImageName: "arrow.clockwise.circle")
    let rulesButton     = CWButton(backgroundColor: .systemBlue, title: "Rules", systemImageName: "list.bullet")
    
    var cards: [UIImage] = CardDeck.allValues
    var timer: Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        startTimer()
            
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomCard), userInfo: nil, repeats: true)
    }
    
    @objc func resetTimer() {
        stopTimer()
        startTimer()
    }
    
    @objc func stopTimer() {
        timer.invalidate()
    }
    
    @objc func showRandomCard() {
        cardImageView.image = cards.randomElement()
    }
        
    func configureUI() {
        configureCardImageView()
        configureStopButton()
        configureResetButton()
        configureRulesButton()
    }
    
    func configureCardImageView() {
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    func configureStopButton() {
        view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 250),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.centerYAnchor.constraint(equalTo: cardImageView.bottomAnchor,constant: 50)
        ])
    }
    
    func configureResetButton() {
        view.addSubview(resetButton)
        resetButton.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 115),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor, constant: 0),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    func configureRulesButton() {
        view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(presentRuleVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor, constant: 0),
            rulesButton .topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    
    @objc func presentRuleVC() {
        present(RulesVC(), animated: true)
    }
    
    
    
}
