//
//  File.swift
//  
//
//  Created by Anne Victoria Batista Auzier on 18/04/23.
//

import Foundation
import SpriteKit

class FinishScene: SKScene {
    
    var backgroundFinishMusic = SKAudioNode(fileNamed: "forestSound.mp3")
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        let backgroundFinish = SKSpriteNode(imageNamed: "congrads")
        backgroundFinish.texture?.filteringMode = .nearest
        backgroundFinish.zPosition = -10
        backgroundFinish.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        backgroundFinish.scene?.scaleMode = .aspectFill
        self.addChild(backgroundFinish)
        
        text()
        
        backgroundFinishSound()

    }
    override func didMove(to view: SKView) {
        self.scaleMode = .aspectFill
    }
    
    func text(){
        let labelFinish: SKLabelNode = SKLabelNode(text: "")
        labelFinish.verticalAlignmentMode = .center
        labelFinish.fontName = "PixelOperator8"
        labelFinish.fontColor = .white
        labelFinish.fontSize = 12
        labelFinish.position = CGPoint(x: -105, y: -50)
        labelFinish.numberOfLines = 0
        labelFinish.zPosition += 5
        labelFinish.setScale(0.7)
        
        self.addChild(labelFinish)
                
        if LabScene.sharedPlants.contactPlants.contains(4){
            labelFinish.position = CGPoint(x: -95, y: -50)
            labelFinish.text = "Congratulations! You have succeeded in making Guaco tea! \n\n\nA simple and easy natural remedy that can help treat many people, \n\nusing medicinal plants! The medicinal and cultural value that these \n\nplants represent in many regions of Brazil was due to indigenous knowledge \n\nthat was passed from generation to generation. I hope this simple experience \n\nhas made you appreciate this ancient knowledge and realize the beauty and power \n\nof nature to heal our bodies and minds."
        }
        if LabScene.sharedPlants.contactPlants.contains(1) {
            labelFinish.text = "Wow, even though it's not the right plant that treats respiratory \n\nproblems, you still managed to produce Andiroba tea! \n\n\nA simple and neasy natural remedy that can help treat many \n\npeople, using medicinal plants! The medicinal and cultural value that \n\nthese plants represent in many regions of Brazil, were due to \n\nindigenous knowledge that was passed from generation to generation. \n\nI hope this simple experience has made you appreciate this ancient knowledge \n\nand realize the beauty and power of nature to heal our bodies and minds."
            
        }
        if LabScene.sharedPlants.contactPlants.contains(2) {
            labelFinish.text = "Wow, even though it's not the right plant that treats respiratory \n\nproblems, you still managed to produce Boldo tea! \n\n\nA simple and neasy natural remedy that can help treat many \n\npeople, using medicinal plants! The medicinal and cultural value that \n\nthese plants represent in many regions of Brazil, were due to \n\nindigenous knowledge that was passed from generation to generation. \n\nI hope this simple experience has made you appreciate this ancient knowledge \n\nand realize the beauty and power of nature to heal our bodies and minds."
            
        }
        if LabScene.sharedPlants.contactPlants.contains(3) {
            labelFinish.text = "Wow, even though it's not the right plant that treats respiratory \n\nproblems, you still managed to produce Cana-de-Macaco tea! \n\n\nA simple and neasy natural remedy that can help treat many \n\npeople, using medicinal plants! The medicinal and cultural value that \n\nthese plants represent in many regions of Brazil, were due to \n\nindigenous knowledge that was passed from generation to generation. \n\nI hope this simple experience has made you appreciate this ancient knowledge \n\nand realize the beauty and power of nature to heal our bodies and minds."
        }
    }
    
    func backgroundFinishSound() {
        backgroundFinishMusic.run(SKAction.changeVolume(to: Float(0.6), duration: 0))
        backgroundFinishMusic.run(.play())
        self.addChild(backgroundFinishMusic)
    }
}


