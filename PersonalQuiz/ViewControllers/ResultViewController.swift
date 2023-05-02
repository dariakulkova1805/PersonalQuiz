//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by DARYA on 4/20/23.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideButtonBack()
        getResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        navigationController?.dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    private func getResult() {
        let animals = answers.map { $0.animal }
        let mostAnimals = Dictionary(grouping: animals, by: { $0 })
            .mapValues { $0.count }
            .sorted { $0.value > $1.value}
        
        guard let animalSortingResult = mostAnimals.first?.key else { return }
        updateUI(with: animalSortingResult)
    }
    
    private func updateUI(with animal: Animal) {
        animalLabel.text = "Вы - \(animal.rawValue)!"
        descriptionLabel.text = animal.definition
    }
    
    private func hideButtonBack() {
        navigationItem.hidesBackButton = true
    }
}
