
import SpriteKit

extension ForestScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        if contact.bodyA.node?.name == "intern" && contact.bodyB.node?.name == "guaco" || contact.bodyA.node?.name == "guaco" && contact.bodyB.node?.name == "intern" {
            
            self.infoPlantsButton = SKButtonNode(imageNamed: "bt", text: "Saiba mais", clickAction: { [weak self] in
                print("SAIBA MAIS")
                self?.guacoCard?.setHide(false)
                self?.infoPlantsButton?.removeFromParent()
                self?.pauseTime = true
                
                self?.collectPlantsButton = SKButtonNode(imageNamed: "bt", text: "Collect", clickAction: { [weak self] in
                    self?.guacoCard?.setHide(true)
                    self?.gaucoNode?.removeFromParent()
                    self?.collectPlantsButton?.removeFromParent()
                    self?.cancelPlantsButton?.removeFromParent()
                    self?.infoPlantsButton?.removeFromParent()
                    self?.collectPlantsSound()
                    ForestScene.shared.plantsCollected.append("guacoo")
                    
                }, unclickAction: { [weak self] in
                    self?.collectPlantsMusic.removeFromParent()
                    self!.pauseTime = false
                })
                self?.collectPlantsButton?.position.x = 80
                self?.collectPlantsButton?.position.y = -30
                self?.collectPlantsButton?.setScale(0.8)
                self?.addChild(self!.collectPlantsButton!)
                
                self?.cancelPlantsButton = SKButtonNode(imageNamed: "bt", text: "Cancel", clickAction: {[weak self] in
                    self?.guacoCard?.setHide(true)
                    self?.cancelPlantsButton?.removeFromParent()
                    self?.collectPlantsButton?.removeFromParent()
                    self?.cancelPlantsSound()
                }, unclickAction: {[weak self] in
                    self?.cancelPlantsMusic.removeFromParent()
                    self?.pauseTime = false
                })
                self?.cancelPlantsButton?.position.x = 40
                self?.cancelPlantsButton?.position.y = -30
                self?.cancelPlantsButton?.setScale(0.8)
                self?.addChild(self!.cancelPlantsButton!)
                
            })
            self.infoPlantsButton?.position.y = -40
            self.infoPlantsButton?.position.x = 80
            self.infoPlantsButton?.zPosition = -1
            self.infoPlantsButton?.setScale(0.8)
            self.addChild(infoPlantsButton!)
        }
        
        if contact.bodyA.node?.name == "intern" && contact.bodyB.node?.name == "andiroba" || contact.bodyA.node?.name == "andiroba" && contact.bodyB.node?.name == "intern" {
            
            self.infoPlantsButton = SKButtonNode(imageNamed: "bt", text: "Saiba mais", clickAction: { [weak self] in
                print("SAIBA MAIS")
                self?.andirobaCard?.setHide(false)
                self?.infoPlantsButton?.removeFromParent()
                self?.pauseTime = true
                
                self?.collectPlantsButton = SKButtonNode(imageNamed: "bt", text: "Collect", clickAction: {[weak self] in
                    self?.andirobaCard?.setHide(true)
                    self?.andirobaNode?.removeFromParent()
                    self?.collectPlantsButton?.removeFromParent()
                    self?.cancelPlantsButton?.removeFromParent()
                    self?.infoPlantsButton?.removeFromParent()
                    self?.collectPlantsSound()
                    ForestScene.shared.plantsCollected.append("andirobaa")
                    
                }, unclickAction: {[weak self] in
                    self?.collectPlantsMusic.removeFromParent()
                    self!.pauseTime = false
                })
                self?.collectPlantsButton?.position.x = 230
                self?.collectPlantsButton?.position.y = -30
                self?.collectPlantsButton?.setScale(0.8)
                self?.addChild(self!.collectPlantsButton!)
                
                self?.cancelPlantsButton = SKButtonNode(imageNamed: "bt", text: "Cancel", clickAction: {[weak self] in
                    self?.andirobaCard?.setHide(true)
                    self?.cancelPlantsButton?.removeFromParent()
                    self?.collectPlantsButton?.removeFromParent()
                    self?.cancelPlantsSound()
                }, unclickAction: {[weak self] in
                    self?.cancelPlantsMusic.removeFromParent()
                    self?.pauseTime = false
                })
                self?.cancelPlantsButton?.position.x = 200
                self?.cancelPlantsButton?.position.y = -30
                self?.cancelPlantsButton?.setScale(0.8)
                self?.addChild(self!.cancelPlantsButton!)
                
            })
            self.infoPlantsButton?.position.y = -40
            self.infoPlantsButton?.position.x = 200
            self.infoPlantsButton?.zPosition = -1
            self.infoPlantsButton?.setScale(0.8)
            self.addChild(infoPlantsButton!)
        }
        
        if contact.bodyA.node?.name == "intern" && contact.bodyB.node?.name == "boldo" || contact.bodyA.node?.name == "boldo" && contact.bodyB.node?.name == "intern" {
            
            self.infoPlantsButton = SKButtonNode(imageNamed: "bt", text: "Saiba mais", clickAction: { [weak self] in
                
                self?.boldoCard?.setHide(false)
                self?.infoPlantsButton?.removeFromParent()
                self?.pauseTime = true
                
                self?.collectPlantsButton = SKButtonNode(imageNamed: "bt", text: "Collect", clickAction: {[weak self] in
                    self?.boldoCard?.setHide(true)
                    self?.boldoNode?.removeFromParent()
                    self?.collectPlantsButton?.removeFromParent()
                    self?.cancelPlantsButton?.removeFromParent()
                    self?.infoPlantsButton?.removeFromParent()
                    self?.collectPlantsSound()
                    ForestScene.shared.plantsCollected.append("boldoo")
                    
                }, unclickAction: {[weak self] in
                    self?.collectPlantsMusic.removeFromParent()
                    self!.pauseTime = false
                })
                self?.collectPlantsButton?.position.x = 430
                self?.collectPlantsButton?.position.y = -30
                self?.collectPlantsButton?.setScale(0.8)
                self?.addChild(self!.collectPlantsButton!)
                
                self?.cancelPlantsButton = SKButtonNode(imageNamed: "bt", text: "Cancel", clickAction: {[weak self] in
                    self?.boldoCard?.setHide(true)
                    self?.cancelPlantsButton?.removeFromParent()
                    self?.collectPlantsButton?.removeFromParent()
                    
                    self?.cancelPlantsSound()
                }, unclickAction: {[weak self] in
                    self?.cancelPlantsMusic.removeFromParent()
                    self?.pauseTime = false
                })
                self?.cancelPlantsButton?.position.x = 390
                self?.cancelPlantsButton?.position.y = -30
                self?.cancelPlantsButton?.setScale(0.8)
                self?.addChild(self!.cancelPlantsButton!)
                
            })
            self.infoPlantsButton?.position.y = -40
            self.infoPlantsButton?.position.x = 400
            self.infoPlantsButton?.zPosition = -1
            self.infoPlantsButton?.setScale(0.8)
            self.addChild(infoPlantsButton!)
        }
        
        if contact.bodyA.node?.name == "intern" && contact.bodyB.node?.name == "lab_semfundo" || contact.bodyA.node?.name == "lab_semfundo" && contact.bodyB.node?.name == "intern" {
            
            self.infoPlantsButton = SKButtonNode(imageNamed: "bt", text: "Entrar", clickAction: { [weak self] in
                let labScene = LabScene()
                labScene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                labScene.scaleMode = .aspectFill
                labScene.anchorPoint = .init(x: 0.5, y: 0.5)
                self!.view?.presentScene(labScene)
//                self?.backgroundForestMusic.removeFromParent()
            })
            self.infoPlantsButton?.position.y = 20
            self.infoPlantsButton?.position.x = -250
            self.infoPlantsButton?.setScale(0.8)
            self.addChild(infoPlantsButton!)
        }
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        self.infoPlantsButton?.removeFromParent()
    }
}

