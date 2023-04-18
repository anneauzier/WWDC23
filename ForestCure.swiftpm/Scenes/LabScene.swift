//
//  LabScene.swift
//  
//
//  Created by Anne Victoria Batista Auzier on 11/04/23.
//

import Foundation
import SpriteKit

class LabScene: SKScene {
    
    private var currentNode: SKNode?
    
    var bottleNode: BottleNode?
    var guacoLabNode: PlantsNode?
    var andirobaLabNode: AndirobaNode?
    var boldoLabNode: BoldoNode?
    var canaLabNode: CanaNode?
    var card: SKBalloonNode?
    var deliverButton: SKButtonNode?
    
    var backgroundLabMusic = SKAudioNode(fileNamed: "labSound.mp3")
    
    override func sceneDidLoad() {
        bottleNode = BottleNode()
        bottleNode?.name = "bottle"
        bottleNode?.position.x = -90
        self.addChild(bottleNode!)
        
        self.scaleMode = .aspectFill
        
        backgroundLabSound()
    }
    
    override func didMove(to view: SKView) {
        setupLab()
        self.physicsWorld.contactDelegate = self
        
        if ForestScene.shared.plantsCollected.contains("guacoo") {
            guacoLabNode = PlantsNode()
            guacoLabNode?.name = "guacoplantLab"
            guacoLabNode?.position = CGPoint(x: 50, y: 0)
            self.addChild(guacoLabNode!)
        }
        if ForestScene.shared.plantsCollected.contains("andirobaa") {
            andirobaLabNode = AndirobaNode()
            andirobaLabNode?.name = "andirobaplantLab"
            andirobaLabNode?.position = CGPoint(x: 100, y: -30)
            self.addChild(andirobaLabNode!)
        }
        if ForestScene.shared.plantsCollected.contains("boldoo") {
            boldoLabNode = BoldoNode()
            boldoLabNode?.name = "boldoplantLab"
            boldoLabNode?.position = CGPoint(x: 200, y: -60)
            self.addChild(boldoLabNode!)
        }
        if ForestScene.shared.plantsCollected.contains("canaa") {
            canaLabNode = CanaNode()
            canaLabNode?.name = "canaplantLab"
            canaLabNode?.position = CGPoint(x: 300, y: -70)
            self.addChild(canaLabNode!)
        }
        
    }
    
    func setupLab() {
        let background = SKSpriteNode(imageNamed: "lab")
        background.texture?.filteringMode = .nearest
        background.zPosition = -10
        self.addChild(background)
        
        card = SKBalloonNode(imageNamed: "npc_balloon")
        card?.position = CGPoint(x: 200 , y: 0)
        card?.zPosition = 2
        card?.setScale(0.6)
        card?.setHide(true)
        self.addChild(card!)
    }
    
    func backgroundLabSound() {
        backgroundLabMusic.run(SKAction.changeVolume(to: Float(0.2), duration: 0))
        backgroundLabMusic.run(.play())
        self.addChild(backgroundLabMusic)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            
            let touchesNodes = self.nodes(at: location)
            for node in touchesNodes {
                if node.name == "guacoplantLab" || node.name == "andirobaplantLab" || node.name == "boldoplantLab" || node.name == "canaplantLab" {
                    self.currentNode = node
                }
            }
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let node = currentNode {
            let touchLocation = touch.location(in: self)
            node.position = touchLocation
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.currentNode = nil
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.currentNode = nil
    }
}
