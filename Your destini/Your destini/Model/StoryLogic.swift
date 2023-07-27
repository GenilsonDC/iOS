//
//  StoryLogic.swift
//  Your destini
//
//  Created by Genilson do Carmo Silva on 27/07/23.
//

import Foundation

struct StoryLogic{
    var storyNumber = 0
    
    let stories = [
               
           Story( title: "Seu carro teve um pneu furado em uma estrada sinuosa no meio do nada, sem sinal de celular. Você decide pedir carona. Uma caminhonete enferrujada para ao seu lado. Um homem com um chapéu de aba larga e olhos sem alma abre a porta do passageiro para você e pergunta: 'Precisa de uma carona, meu jóvem?'",
            choice1: "Opah, quero sim meu querido. Obrigado pela ajuda!", choice1Destination: 2,
            choice2: "Vixi!! Melhor perguntar a ele se ele é um assassino primeiro.", choice2Destination: 1
        ),
        Story(
            title: "Ele acena lentamente, sem se abalar com a resposta.",
            choice1: "Pelo menos ele é honesto. Vou entrar.", choice1Destination: 2,
            choice2: "Espere, eu mesmo sei como trocar um pneu.", choice2Destination: 3
        ),
        Story(
            title: "Enquanto vocês estão dirigindo pela estreda, o estranho começa a falar sobre sua relação com a mãe. Ele fica cada vez mais irritado a cada minuto. Ele pede para você abrir o porta-luvas. Dentro, você encontra uma faca ensanguentada, dois dedos cortados e uma fita cassete de Elton John. Ele alcança o porta-luvas.",
            choice1: "Eu amo Elton John! Entrego a ele a fita cassete.", choice1Destination: 5,
            choice2: "É ele ou eu! Você pega a faca e o esfaqueia.", choice2Destination: 4
        ),
        Story(
            title: "O que? Que saída fácil! Você sabia que acidentes de trânsito são a segunda principal causa de morte acidental para a maioria dos grupos etários adultos?",
            choice1: "e é isso", choice1Destination: 0,
            choice2: "Fim", choice2Destination: 0
        ),
        Story(
            title: "Enquanto você atravessa a guarda do corrimão e se precipita em direção às rochas pontiagudas abaixo, você reflete sobre a sabedoria duvidosa de esfaquear alguém enquanto está dentro de um carro.",
            choice1: "e é isso", choice1Destination: 0,
            choice2: "Fim", choice2Destination: 0
        ),
        Story(
            title: "Você se conecta com o assassino enquanto canta versos de 'Can you feel the love tonight'. Ele te deixa na próxima cidade. Antes de ir, ele pergunta se você conhece algum bom lugar para descartar corpos. Você responde: 'Tente o píer.'",
            choice1: "e é isso", choice1Destination: 0,
            choice2: "Fim", choice2Destination: 0
        )
    ]
    
    func getStoryTitle() -> String {
        return stories [storyNumber].title
    }
    func getChoice1() -> String{
        return stories[storyNumber].choice1
    }
    func getChoice2() -> String{
        return stories[storyNumber].choice2
    }
    
    mutating func nextStory(userChoice: String){
        let currentStory = stories[storyNumber]
        
        if userChoice == currentStory.choice1 {
            storyNumber = currentStory.choice1Destination
        }
        else if userChoice == currentStory.choice2 {
            storyNumber = currentStory.choice2Destination
        }
    }
   
}
