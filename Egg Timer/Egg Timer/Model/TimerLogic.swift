//
//  TimerLogic.swift
//  Egg Timer
//
//  Created by Genilson do Carmo Silva on 28/07/23.
//
import AVFoundation
import Foundation
import Foundation
import AVFoundation

protocol TimerLogicDelegate: AnyObject {
    func timerDidFinish()
    func timerDidUpdate(progress: Float)
}

class TimerLogic {
    weak var delegate: TimerLogicDelegate?
    private var timer: Timer?
    private var segundosPassados = 0
    private var totaltimer = 0
    private var player: AVAudioPlayer?

    let pontoGema = ["Soft": 380, "Média": 480, "Dura": 720]

    func startTimer(for escolha: String) {
        totaltimer = pontoGema[escolha]!
        segundosPassados = 0
        timer?.invalidate()

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] (timer) in
            guard let self = self else { return }

            if self.segundosPassados < self.totaltimer {
                self.segundosPassados += 1
                let progress = Float(self.segundosPassados) / Float(self.totaltimer)
                self.delegate?.timerDidUpdate(progress: progress)
            } else {
                self.timer?.invalidate()
                self.delegate?.timerDidFinish()
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        segundosPassados = 0
    }

    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else {
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Erro ao reproduzir o som: \(error)")
        }
    }
}
