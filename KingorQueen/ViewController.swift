import UIKit

class ViewController: UIViewController {
    
    // variables ////////////////////////
    @IBOutlet weak var questionlabel: UILabel!
    
    //buttons
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    var buttonArray: [UIButton] {return [button1, button2, button3, button4 ]}
    
    //question variables
    var questions = [Question]()
    var currentQuestionIndex = 0
    var currentQuestion: Question { return questions[currentQuestionIndex] }
    
    
    //init player
    var passedPlayerName:String!
    var passedPlayerGender:Bool!
    var player:Player?
    
    
    //
    
    //json variables
    let answersDataPath = "http://joeltrew.com/kfadAnswers.json"
    var answersService: AnswersService!
    //
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    
    
    func addScoreToPlayer(buttonIndex:Int) {
        //adds answer scores to player scores and prints
        
        let answer = currentQuestion.answers[buttonIndex]
        player!.strength += currentQuestion.answers[buttonIndex].answerStrength
        player!.morality += currentQuestion.answers[buttonIndex].answerMorality
        player!.humour += currentQuestion.answers[buttonIndex].answerHumour
        player!.modern += currentQuestion.answers[buttonIndex].answerModern
        player!.printPlayerScores()
    }
    
    func createPlayerObject() {
        if passedPlayerGender == true{
            player = Player(name: passedPlayerName,
                            gender: .Male)
        }else {
            player = Player(name: passedPlayerName,
                            gender: .Female)
        }
        
    }
    
    
    func finalScorePrint() {
        
        println("\n----FINAL SCORES----\n")
        player!.printPlayerScores()
    }
    
    
    @IBAction func tappedButton(sender: UIButton) {
        
        let lastQuestion = questions.count-1
        let buttonIndex = find(buttonArray, sender)!
        
        
        if currentQuestionIndex == (lastQuestion){
            addScoreToPlayer(buttonIndex)
            finalScorePrint()
            performSegueWithIdentifier("quizFinished", sender: nil)
            // do something else here which removes the buttons
        }else {
            // Which button was tapped
            addScoreToPlayer(buttonIndex)
            
            //Checks to make sure questions array does not get out of range
            
            if currentQuestionIndex < (lastQuestion){
                currentQuestionIndex++
                //sets question label to the current question text
                questionlabel.text = questions[currentQuestionIndex].questionText
            }
            
            //Goes through each item in the button array
            for (index, button) in enumerate(self.buttonArray) {
                
                //sets the button title to answer
                button.setTitle(currentQuestion.answers[index].answerText, forState: UIControlState.Normal)
                
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        createPlayerObject()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answersService = AnswersService(answersDataPath: answersDataPath)
        answersService.delegate = self
        answersService.loadAnswers()
        
        
        //sets question label to first question in question array
        questionlabel.text = questions[0].questionText
        
        
        for (index, item) in enumerate(self.buttonArray) {
            //sets the line break mode for each button to warp to the next line
            item.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
            
            //sets the button title to
            item.setTitle(currentQuestion.answers[index].answerText, forState: UIControlState.Normal)
            
            
        }
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
}

extension ViewController: AnswersServiceDelegate {
    func didLoadQuestionsAndAnswers(questionsAndAnswers:[Question]){
        
        questions = questionsAndAnswers
        //set the array of json downloaded questions to the empty 'questions' array which our app will use
        
    }
}


