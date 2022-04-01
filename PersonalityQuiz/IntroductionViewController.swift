//
//  IntroductionViewController.swift
//  PersonalityQuiz
//
//  Created by Иван Гребенюк on 26.03.2022.
//

import UIKit

class IntroductionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AnimalsSegue" {
            let questionsViewController = segue.destination as! QuestionsViewController
            questionsViewController.questions = questionsViewController.animalsQuestions
        }
    }
    
    @IBAction func unwindToQuizIntrodection(segue: UIStoryboardSegue) { }
}

