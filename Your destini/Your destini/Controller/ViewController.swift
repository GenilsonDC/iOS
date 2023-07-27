//
//  ViewController.swift
//  Your destini
//
//  Created by Genilson do Carmo Silva on 27/07/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choiceButton1: UIButton!
    @IBOutlet weak var choiceButton2: UIButton!
    
    var storyLogic = StoryLogic()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func choiceStory(_ sender: UIButton) {
        storyLogic.nextStory(userChoice: sender.currentTitle!)
        updateUI()
    }
    
    func updateUI(){
        storyLabel.text = storyLogic.getStoryTitle()
        choiceButton1.setTitle(storyLogic.getChoice1(), for: .normal)
        choiceButton2.setTitle(storyLogic.getChoice2(), for: .normal)
    }

}
