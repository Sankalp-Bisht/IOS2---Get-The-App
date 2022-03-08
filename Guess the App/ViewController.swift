//
//  ViewController.swift
//  Guess the App
//
//  Created by Sankalp Singh Bisht on 07/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    let label = UILabel()
    var quesCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

//        self.navigationController!.navigationBar.barStyle = .black
//        self.navigationController!.navigationBar.isTranslucent = false
//        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        

        
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.black.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askquestion()
        
        //let navView = UIView()
       

        
        
    }
    func askquestion(action: UIAlertAction! = nil){
        quesCount+=1
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
        
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if(sender.tag==correctAnswer){
            title = "Correct Answer"
            score += 1
        }else{
            title = "Wrong Answer, Correct answer is Flag number \(correctAnswer)"
            score -= 1
        }
        
        label.text = String(score)
        print(score)
        //navView.addSubview(label)

        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: label)
        
        if quesCount < 10{
        let ac = UIAlertController(title: title, message: "Your Score is \(score)", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler:askquestion))
        
        present(ac,animated: true)
        }
        
        else{
            title = "Game Over"
            
            let ac2 = UIAlertController(title: title, message: "Your Score is \(score)", preferredStyle: .alert)
            
            quesCount = 0
            score = 0
            
            ac2.addAction(UIAlertAction(title: "Restart", style: .default, handler:askquestion))
            
            
            present(ac2,animated:true)
            
        }
    }
    

}

