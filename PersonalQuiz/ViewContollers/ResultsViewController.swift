//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Артур Петин on 14.12.2021.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet var animalTypeLabe: UILabel!
    @IBOutlet var descriptionLabel: UILabel!

    var choosenAnswer: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        sortedAnimal()

        // Do any additional setup after loading the view.
    }
    

    private func sortedAnimal() {

        let sortedAnimal = Dictionary(grouping: choosenAnswer) { $0.type }
            .sorted { $0.value.count > $1.value.count }
            .first?.key
        
        updateUI(with: sortedAnimal)
        
    }
    
    private func updateUI(with animal: AnimalType?) {
        animalTypeLabe.text = "Вы - \(animal?.rawValue ?? "🐶")!"
        descriptionLabel.text = animal?.definition ?? ""
        
    }

}
