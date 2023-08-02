//
//  ViewController.swift
//  Egg Timer
//
//  Created by Genilson do Carmo Silva on 28/07/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var softEggButton: UIButton!
    @IBOutlet weak var middleEggButton: UIButton!
    @IBOutlet weak var hardEggButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    let timerLogic = TimerLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }

    @IBAction func eggPointSelected(_ sender: UIButton) {
      
                UIView.animate(withDuration: 0.3) {
                    sender.alpha = 0.3
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    UIView.animate(withDuration: 0.5) {
                        sender.alpha = 1
                    }
                }

                let escolha = sender.currentTitle!
                textLabel.text = escolha
                progressBar.progress = 0.0

                timerLogic.delegate = self
                timerLogic.startTimer(for: escolha)
            }
        }

        extension ViewController: TimerLogicDelegate {
            func timerDidFinish() {
                textLabel.text = "Pronto! \nVamos comer 🥚🧂"
                timerLogic.playSound()
            }

            func timerDidUpdate(progress: Float) {
                progressBar.progress = progress
            }
        }


