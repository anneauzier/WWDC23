
import SpriteKit

extension ForestScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        if contact.bodyA.node?.name == "intern" && contact.bodyB.node?.name == "plants" || contact.bodyA.node?.name == "plants" && contact.bodyB.node?.name == "intern" {
            
            self.infoPlantsButton = SKButtonNode(imageNamed: "bt", text: "Saiba mais", clickAction: { [weak self] in
                print("SAIBA MAIS")
                self?.namePlantCard?.setHide(false)
                self!.infoPlantsButton?.removeFromParent()
                
                self?.collectPlantsButton = SKButtonNode(imageNamed: "bt", text: "Collect", clickAction: {[weak self] in
                    self?.namePlantCard?.setHide(true)
                    self?.plantsNode?.removeFromParent()
                    self!.collectPlantsButton?.removeFromParent()
                    self?.cancelPlantsButton?.removeFromParent()
                    self!.hashAlgoritm.append(2)
                    
                    print(self!.hashAlgoritm)
                })
                self?.collectPlantsButton?.position.x = 80
                self?.collectPlantsButton?.position.y = -30
                self?.collectPlantsButton?.setScale(0.8)
                self?.addChild(self!.collectPlantsButton!)
                
                self?.cancelPlantsButton = SKButtonNode(imageNamed: "bt", text: "Cancel", clickAction: {[weak self] in
                    self?.namePlantCard?.setHide(true)
                    self?.cancelPlantsButton?.removeFromParent()
                    self?.collectPlantsButton?.removeFromParent()
                })
                self?.cancelPlantsButton?.position.x = 40
                self?.cancelPlantsButton?.position.y = -30
                self?.cancelPlantsButton?.setScale(0.8)
                self?.addChild(self!.cancelPlantsButton!)
                
            })
            self.infoPlantsButton?.position.y = -40
            self.infoPlantsButton?.position.x = 80
            self.infoPlantsButton?.setScale(0.8)
            self.addChild(infoPlantsButton!)
        }
        
        if contact.bodyA.node?.name == "intern" && contact.bodyB.node?.name == "lab" || contact.bodyA.node?.name == "lab" && contact.bodyB.node?.name == "intern" {
            print("contato2")
            
            self.infoPlantsButton = SKButtonNode(imageNamed: "bt", text: "Saiba mais", clickAction: { [weak self] in
                print("SAIBA MAIS")
                self?.namePlantCard?.setHide(false)
                self!.infoPlantsButton?.removeFromParent()
                
                self?.collectPlantsButton = SKButtonNode(imageNamed: "bt", text: "Collect", clickAction: {[weak self] in
                    self?.namePlantCard?.setHide(true)
                    self?.plants2Node?.removeFromParent()
                    self!.collectPlantsButton?.removeFromParent()
                    self!.hashAlgoritm.append(32)
                    print(self!.hashAlgoritm)
                
                })
                self?.collectPlantsButton?.position.x = 200
                self?.collectPlantsButton?.position.y = -30
                self?.collectPlantsButton?.setScale(0.8)
                self?.addChild(self!.collectPlantsButton!)
            })
            self.infoPlantsButton?.position.y = -40
            self.infoPlantsButton?.position.x = 200
            self.infoPlantsButton?.setScale(0.8)
            self.addChild(infoPlantsButton!)
        }
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        self.infoPlantsButton?.removeFromParent()
    }
}

//  let infoScene = DiscoverScene(size: self!.size)
//  infoScene.scaleMode = self!.scaleMode
//  self!.view?.presentScene(infoScene)


//for value in self!.hashAlgoritm {
//    self!.number *= value
//    print(self!.number)
//}
