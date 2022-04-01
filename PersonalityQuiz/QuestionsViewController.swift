//
//  QuestionsViewController.swift
//  PersonalityQuiz
//
//  Created by Иван Гребенюк on 26.03.2022.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    var questionsIndex = 0
    var answersChosen = [Answer]()
    var questions: [Question]!
    var animalsQuestions: [Question] = [
        Question(text: "Which food do you like most?",
                 type: .single,
                 answers: [
                    Answer(text: "Steak", definition: .dog),
                    Answer(text: "Fish", definition: .cat),
                    Answer(text: "Carrots", definition: .rabbit),
                    Answer(text: "Corn", definition: .turtle)
                 ].shuffled()),
        Question(text: "Where would you like to live?",
                 type: .multiple,
                 answers: [
                    Answer(text: "Green fields", definition: .rabbit),
                    Answer(text: "City", definition: .cat),
                    Answer(text: "Sea shore", definition: .turtle),
                    Answer(text: "Farm", definition: .dog)
                 ].shuffled()),
        Question(text: "Which activities do you enjoy?",
                 type: .multiple,
                 answers: [
                    Answer(text: "Swimming", definition: .turtle),
                    Answer(text: "Sleeping", definition: .cat),
                    Answer(text: "Cuddling", definition: .rabbit),
                    Answer(text: "Eating", definition: .dog)
                 ]),
        Question(text: "What cartoon do you like most?",
                 type: .single,
                 answers: [
                    Answer(text: "Tom & Jerry", definition: .cat),
                    Answer(text: "Teenage Mutant Ninja Turtles", definition: .turtle),
                    Answer(text: "Isle of Dogs", definition: .dog),
                    Answer(text: "Bugs bunny", definition: .rabbit)
                 ]),
        Question(text: "How much do you enjoy car rides?",
                 type: .ranged,
                 answers: [
                    Answer(text: "I dislike them", definition: .cat),
                    Answer(text: "I get a little nervous", definition: .rabbit),
                    Answer(text: "I barely notice them", definition: .turtle),
                    Answer(text: "I adore them", definition: .dog)
                 ])
    ].shuffled()
        
    // MARK: - Outlets
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multipleLabel1: UILabel!
    @IBOutlet weak var multipleLabel2: UILabel!
    @IBOutlet weak var multipleLabel3: UILabel!
    @IBOutlet weak var multipleLabel4: UILabel!
    @IBOutlet weak var multiSubmitButton: UIButton!
    
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    @IBOutlet weak var rangedSlider: UISlider!
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        updateNavBar()
    }
    
    func updateUI() {
        
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
                
        let currentQuestion = questions[questionsIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionsIndex) / Float(questions.count)
        
        navigationItem.title = "Question #\(questionsIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
        
        func updateSingleStack(using answers: [Answer]) {
            singleStackView.isHidden = false
            singleButton1.setTitle(answers[0].text, for: .normal)
            singleButton2.setTitle(answers[1].text, for: .normal)
            singleButton3.setTitle(answers[2].text, for: .normal)
            singleButton4.setTitle(answers[3].text, for: .normal)
        }
        
        func updateMultipleStack(using answers: [Answer]) {
            multipleStackView.isHidden = false
            multiSubmitButton.isEnabled = false
            
            multiSwitch1.isOn = false
            multiSwitch2.isOn = false
            multiSwitch3.isOn = false
            multiSwitch4.isOn = false

            multipleLabel1.text = answers[0].text
            multipleLabel2.text = answers[1].text
            multipleLabel3.text = answers[2].text
            multipleLabel4.text = answers[3].text
        }
        
        func updateRangedStack(using answer: [Answer]) {
            rangedStackView.isHidden = false
            rangedSlider.setValue(0.5, animated: false)
            rangedLabel1.text = answer.first?.text
            rangedLabel2.text = answer.last?.text
        }
    }
    
    func nextQuestion() {
        questionsIndex += 1
        if questionsIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
        
    }
    
    func updateNavBar() {
        navigationItem.hidesBackButton = true
    }
    
    // MARK: - Actions
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionsIndex].answers
        
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionsIndex].answers
        
        if multiSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        
        nextQuestion()
    }

    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionsIndex].answers
        
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    @IBAction func multiSwitchPressed(_ sender: UISwitch) {
        multiSubmitButton.isEnabled = true
        if !multiSwitch1.isOn && !multiSwitch2.isOn && !multiSwitch3.isOn && !multiSwitch4.isOn {
            multiSubmitButton.isEnabled = false
        }
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.responses = answersChosen
        }
    }
}
