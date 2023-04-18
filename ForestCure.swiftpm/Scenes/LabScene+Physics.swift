//
//  File.swift
//  
//
//  Created by Anne Victoria Batista Auzier on 15/04/23.
//

import Foundation
import SpriteKit

extension LabScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == "bottle" && contact.bodyB.node?.name == "guacoplantLab" || contact.bodyA.node?.name == "guacoplantLab" && contact.bodyB.node?.name == "bottle" {
            
            self.bottleNode?.bottleNode.color = .green
            self.guacoLabNode?.removeFromParent()            
        }
        if contact.bodyA.node?.name == "bottle" && contact.bodyB.node?.name == "andirobaplantLab" || contact.bodyA.node?.name == "andirobaplantLab" && contact.bodyB.node?.name == "bottle" {
           
            self.bottleNode?.bottleNode.color = .green
            self.andirobaLabNode?.removeFromParent()
        }
        if contact.bodyA.node?.name == "bottle" && contact.bodyB.node?.name == "boldoplantLab" || contact.bodyA.node?.name == "boldoplantLab" && contact.bodyB.node?.name == "bottle" {
         
            self.bottleNode?.bottleNode.color = .green
            self.boldoLabNode?.removeFromParent()
        }
        if contact.bodyA.node?.name == "bottle" && contact.bodyB.node?.name == "canaplantLab" || contact.bodyA.node?.name == "canaplantLab" && contact.bodyB.node?.name == "bottle" {
            
            self.bottleNode?.bottleNode.color = .green
            self.canaLabNode?.removeFromParent()
        }
        if bottleNode?.bottleNode.color == .green {
            deliverButton = SKButtonNode(imageNamed: "deliver", clickAction: {[weak self] in
//                self?.card?.setHide(false)
                let finishScene = FinishScene()
                finishScene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                finishScene.scaleMode = .aspectFit
                finishScene.anchorPoint = .init(x: 0.5, y: 0.5)
                self!.view?.presentScene(finishScene)
                
                self?.deliverButton?.removeFromParent()
            })
            deliverButton?.position = CGPoint(x: 20, y: 0)
            self.addChild(deliverButton!)
        }
    }
}
