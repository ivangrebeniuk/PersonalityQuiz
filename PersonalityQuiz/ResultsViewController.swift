//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Иван Гребенюк on 26.03.2022.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var responses: [Answer]!
    
    // MARK: - Outlets
    
    
    @IBOutlet weak var resultsAnswerLabel: UILabel!
    @IBOutlet weak var resultsDefinitionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonality()
        updateNavBar()
    }
    
    func calculatePersonality() {
        var result = [AnimalType: Int]()
        let responsesType = responses.map { $0.definition }
        
        for animal in responsesType {
            if let oldValue = result[animal] {
                result[animal] = oldValue + 1
            } else {
                result[animal] = 1
            }
        }
        let sortedAnswers = result.sorted { $0.value > $1.value }
        let mostCommonValue = sortedAnswers[0].key
        
        resultsAnswerLabel.text = "You are a \(mostCommonValue.rawValue)"
        resultsDefinitionLabel.text = mostCommonValue.definition
    }
    
    func updateNavBar() {
        navigationItem.hidesBackButton = true
    }

}
