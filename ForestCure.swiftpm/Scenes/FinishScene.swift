//
//  File.swift
//  
//
//  Created by Anne Victoria Batista Auzier on 18/04/23.
//

import Foundation
import SpriteKit

class FinishScene: SKScene {
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        let backgroundFinish = SKSpriteNode(imageNamed: "congrads")
        backgroundFinish.texture?.filteringMode = .nearest
        backgroundFinish.zPosition = -10
        backgroundFinish.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        backgroundFinish.scene?.scaleMode = .aspectFill
        self.addChild(backgroundFinish)
        
        text()
    }
    override func didMove(to view: SKView) {
        self.scaleMode = .aspectFill
    }
    
    func text(){
        let labelFinish: SKLabelNode = SKLabelNode(text: "")
        labelFinish.verticalAlignmentMode = .center
        labelFinish.fontName = "PixelOperator8"
        labelFinish.fontColor = .white
        labelFinish.fontSize = 14
        labelFinish.position = CGPoint(x: -10, y: 0)
        labelFinish.numberOfLines = 0
        labelFinish.zPosition += 5
        labelFinish.setScale(0.7)
        
        self.addChild(labelFinish)
        
        if LabScene.sharedPlants.contactPlants.contains(4){
            labelFinish.text = "Congratulations! You have succeeded in making Guaco tea! \n\nA simple and easy natural remedy that can help treat many people, using medicinal plants! \n\nThe medicinal and cultural value that these plants represent in many regions of Brazil \n\nwas due to indigenous knowledge that was passed from generation to generation. \n\nI hope this simple experience has made you appreciate this ancient knowledge and realize the beauty \n\nand power of nature to heal our bodies and minds."
        }
        if LabScene.sharedPlants.contactPlants.contains(1) {
            labelFinish.text = "Wow, even though it's not the right plant that \n\ntreats respiratory problems, \n\nyou still managed to produce Andiroba tea. \n\nA simple and easy natural remedy that can \n\nhelp treat many people, using medicinal plants! \n\nThe medicinal and cultural value that these plants \n\nrepresent in many regions of Brazil, \n\nwere due to indigenous knowledge that was passed from \n\ngeneration to generation. I hope this simple experience \n\nhas made you appreciate this ancient knowledge and realize the beauty \n\nand power of nature to heal our bodies and minds."
        }
        if LabScene.sharedPlants.contactPlants.contains(2) {
            backgroundColor = .blue
            labelFinish.text = "boldooo"
        }
        if LabScene.sharedPlants.contactPlants.contains(3) {
            backgroundColor = .red
            labelFinish.text = "cannnaaa"
        }
    }
}


