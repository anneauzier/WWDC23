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
            print("TOQUEIII")
            self.bottleNode?.bottleNode.color = .green
            self.guacoLabNode?.removeFromParent()
        }
        if contact.bodyA.node?.name == "bottle" && contact.bodyB.node?.name == "andirobaplantLab" || contact.bodyA.node?.name == "andirobaplantLab" && contact.bodyB.node?.name == "bottle" {
            print("TOQUEIII")
            self.bottleNode?.bottleNode.color = .green
            self.andirobaLabNode?.removeFromParent()
        }
        if contact.bodyA.node?.name == "bottle" && contact.bodyB.node?.name == "boldoplantLab" || contact.bodyA.node?.name == "boldoplantLab" && contact.bodyB.node?.name == "bottle" {
            print("TOQUEIII")
            self.bottleNode?.bottleNode.color = .green
            self.boldoLabNode?.removeFromParent()
        }
    }
}
