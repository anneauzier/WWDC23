//
//  ForestScene.swift
//  ForestCure
//
//  Created by Anne Victoria Batista Auzier on 03/04/23.
//

import Foundation
import SpriteKit

class ForestScene: SKScene {
    
    var internNode: InternNode?
    var plantsNode: PlantsNode?
    var plants2Node: PlantsNode?
    var labNode: LabNode?

    var direction: CGFloat = 0
    var moveSpeed: CGFloat = 2
    
    var infoPlantsButton: SKButtonNode?
    var collectPlantsButton: SKButtonNode?
    var cancelPlantsButton: SKButtonNode?
    var namePlantCard: SKBalloonNode?
    
    var parallaxNodes: [SKNode] = []
    
    var hashAlgoritm: [Int] = []
    var number = 1
    
    //quando a cena é carrega pela primeira vez
    override func sceneDidLoad() {
        
        internNode = InternNode()
        internNode?.name = "intern"
        internNode?.position.y = -70
        self.addChild(internNode!)
        
        plantsNode = PlantsNode()
        plantsNode?.name = "plants"
        plantsNode?.zPosition = -1
        plantsNode?.position.y = -65
        plantsNode?.position.x = 80
//        plantsNode?.setScale(0.8)
        self.addChild(plantsNode!)
        
        plants2Node = PlantsNode()
        plants2Node?.name = "plants2"
        plants2Node?.zPosition = -1
        plants2Node?.position.y = -65
        plants2Node?.position.x = 200
        self.addChild(plants2Node!)
        
//        labNode = LabNode()
//        labNode?.name = "lab"
//        labNode?.zPosition = -1
//        labNode?.position.y = -65
//        labNode?.position.x = -30
//        self.addChild(labNode!)
        
        setupBackgroundParallax()

    }
    
    // é usado toda vez que a cena é exibida
    override func didMove(to view: SKView) {
        setupForest()
        self.scaleMode = .aspectFill
        self.physicsWorld.contactDelegate = self
        
        createBackground()
    }
    
    // método chamado continuamente enquanto a cena está sendo exibida, usado pra atualizar estados do jogo e realizar cálculos e lógica do jogo
    override func update(_ currentTime: TimeInterval) {
        if (direction != 0) {
            self.internNode?.xScale = direction // espelhar o player
            self.internNode?.position.x += self.direction * moveSpeed
        }
        self.camera?.run(.moveTo(x: self.internNode?.position.x ?? 0, duration: 0.4))
        moveBackgroundParallax()
    }
    
    public func setupForest() {
            
        // ========= Camera =========
        
        let camera = SKCameraNode()
        self.camera = camera
        camera.xScale = 0.6
        camera.yScale = 0.6
        self.addChild(camera)
        
        //===== Discover Image ====
        
        namePlantCard = SKBalloonNode(imageNamed: "npc_balloon")
        namePlantCard?.position = CGPoint(x: 0, y: 0)
        namePlantCard?.zPosition = 2
        namePlantCard?.setHide(true)
        self.camera?.addChild(namePlantCard!)
        
        // ======== Controls =========
        
        let leftButton = SKButtonNode(imageNamed: "arrow_bt", clickAction: { [weak self] in
            self?.direction = -1
            self?.internNode?.playAnim(state: .walk)
        }, unclickAction: { [weak self] in
            self?.direction = 0
            self?.internNode?.playAnim(state: .idle)
        })
        leftButton.position = .init(x: -260, y: -95)
        self.camera?.addChild(leftButton)
        
        let rightButton = SKButtonNode(imageNamed: "arrow_bt", clickAction: { [weak self] in
            self?.direction = 1
            self?.internNode?.playAnim(state: .walk)
        }, unclickAction: { [weak self] in
            self?.direction = 0
            self?.internNode?.playAnim(state: .idle)
        })
        rightButton.position = .init(x: -230, y: -95)
        rightButton.xScale = -1
        self.camera?.addChild(rightButton)
        
    }
    
    func setupBackgroundParallax() {
        
        var calculateZPosition: CGFloat = 10
        let backgroundOrder: [String] = [
            "layer_4",
            "layer_3",
            "layer_2",
            "layer_1",
        ]
        for layer in backgroundOrder {
            let bgLayer = SKSpriteNode(imageNamed: layer)
            bgLayer.name = layer
            bgLayer.position.y = (bgLayer.size.height / 5)
            bgLayer.zPosition = -calculateZPosition
            bgLayer.texture?.filteringMode = .nearest
            self.addChild(bgLayer)
            
            parallaxNodes.append(bgLayer)
            
            calculateZPosition += 2
        }
    }

    func moveBackgroundParallax() {
        var calculateDuration: CGFloat = 0
        
        for parallaxNode in parallaxNodes {
            parallaxNode.run(.moveTo(x: camera?.position.x ?? 0, duration: calculateDuration))
            calculateDuration += 0.8
        }
    }
    
    func createBackground() {
        for i in 0...3{
            let ground = SKSpriteNode(imageNamed: "ground")
            ground.name = "ground"
            ground.size = CGSize(width: self.scene?.size.width ?? 0, height: 50)
            ground.texture?.filteringMode = .nearest
            ground.zPosition = -10
            ground.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            ground.position = CGPoint(x: CGFloat(i) * ground.size.width, y: -100)
            
            self.addChild(ground)
        }
    }
    
    
}

//        let constraint: SKConstraint = .distance(.init(lowerLimit: -100, upperLimit: 100), to: .zero)
//        self.camera?.constraints = [constraint]

//        let jumpButton = SKButtonNode(imageNamed: "arrow_bt", clickAction: { [weak self] in
//            self!.internNode?.jump()
//        })
//        jumpButton.position = .init(x: 70, y: -205)
//        self.camera?.addChild(jumpButton)

// ==== Background ====
//
//        let background = SKSpriteNode(imageNamed: "ground")
//        background.texture?.filteringMode = .nearest
//        background.zPosition = -10
//        background.position.x = 0
//        background.position.y = -100
//        self.addChild(background)


//cognitiveButton = SKButtonNode(imageNamed: "botao2", clickAction: { [weak self] in
//
//    let secondScene = CognitiveSkills()
//        secondScene.size = CGSize(width: 1080/2, height: 1920/2)
//        secondScene.scaleMode = .aspectFit
//        secondScene.anchorPoint = .init(x: 0.5, y: 0.5)
//        self?.view?.presentScene(secondScene, transition: .fade(withDuration: 1))
//
//        })
//
//cognitiveButton?.position = .init(x: 50, y: 10)
//cognitiveButton?.setScale(0.2)
//self.addChild(cognitiveButton!)
//cognitiveButton?.setHideButton(true)
