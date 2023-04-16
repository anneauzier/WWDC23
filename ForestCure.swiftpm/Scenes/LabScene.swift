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
    var plantsLabNode: LabPlantsNode?
    var connectWithForest = ForestScene()
    
    override func sceneDidLoad() {
        bottleNode = BottleNode()
        bottleNode?.name = "bottle"
        bottleNode?.position.x = -90
        self.addChild(bottleNode!)

        self.scaleMode = .aspectFill
        
        print("\(connectWithForest.hasGuaco)")
    }
    
    override func didMove(to view: SKView) {
        setupLab()
        self.physicsWorld.contactDelegate = self
        
        if connectWithForest.hasGuaco == true {
            plantsLabNode = LabPlantsNode()
            plantsLabNode?.name = "plantsLab"
            self.addChild(plantsLabNode!)
        }
        
    }
    
    func setupLab() {
        let background = SKSpriteNode(imageNamed: "lab")
        background.texture?.filteringMode = .nearest
        background.zPosition = -10
        self.addChild(background)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            
            let touchesNodes = self.nodes(at: location)
            for node in touchesNodes {
                if node.name == "plantsLab" {
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
