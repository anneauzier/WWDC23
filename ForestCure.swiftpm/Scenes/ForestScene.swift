//
//  ForestScene.swift
//  ForestCure
//
//  Created by Anne Victoria Batista Auzier on 03/04/23.
//

import Foundation
import AVFoundation
import SpriteKit

class ForestScene: SKScene {
    
    var internNode: InternNode?
    var plantsNode: PlantsNode?
    var plants2Node: PlantsNode?
    var labNode: LabNode?
    
    var direction: CGFloat = 0
    var moveSpeed: CGFloat = 2
    var pause: Bool = false
    
    var infoPlantsButton: SKButtonNode?
    var collectPlantsButton: SKButtonNode?
    var cancelPlantsButton: SKButtonNode?
    var testeButton: SKButtonNode?
    var namePlantCard: SKBalloonNode?
    var teste: SKBalloonNode?
    
    var timer: TimerNode?
    
    var backgroundForestMusic = SKAudioNode(fileNamed: "forestSound.mp3")
    var collectPlantsMusic = SKAudioNode(fileNamed: "collectSound.mp3")
    var cancelPlantsMusic = SKAudioNode(fileNamed: "cancelSound.mp3")
    
    var parallaxNodes: [SKNode] = []
    
    var introText: [String] = [
        "texto 2",
        "texto 3",
    ]
    var indexText = -1
    
//    var hashAlgoritm: [Int] = []
//    var number = 1
//
    override func sceneDidLoad() {
        
        internNode = InternNode()
        internNode?.name = "intern"
        internNode?.position.y = -90
        self.addChild(internNode!)
        
        timer = TimerNode()
        timer?.position.x = -80
        timer?.position.y = 80
        timer?.zPosition = 20
        self.addChild(timer!)
        
        plantsNode = PlantsNode()
        plantsNode?.name = "plants"
        plantsNode?.zPosition = -1
        plantsNode?.position.y = -85
        plantsNode?.position.x = 80
        //        plantsNode?.setScale(0.8)
        self.addChild(plantsNode!)
        
        plants2Node = PlantsNode()
        plants2Node?.name = "plants2"
        plants2Node?.zPosition = -1
        plants2Node?.position.y = -85
        plants2Node?.position.x = 200
        self.addChild(plants2Node!)

        //        labNode = LabNode()
        //        labNode?.name = "lab"
        //        labNode?.zPosition = -1
        //        labNode?.position.y = -65
        //        labNode?.position.x = -30
        //        self.addChild(labNode!)
        
        setupBackgroundParallax()
        backgroundForestSound()
    }
    
    override func didMove(to view: SKView) {
        setupForest()
        self.scaleMode = .aspectFill
        self.physicsWorld.contactDelegate = self
        
        createInfitinyBackground()
    }
    
    override func update(_ currentTime: TimeInterval) {
        if (direction != 0) {
            self.internNode?.xScale = direction // espelhar o player
            self.internNode?.position.x += self.direction * moveSpeed
        }
        self.camera?.run(.moveTo(x: self.internNode?.position.x ?? 0, duration: 0.4))
        moveBackgroundParallax()
        if pause == true {
            self.timer?.isPaused = true
        } else {
            self.timer?.isPaused = false
            self.timer!.updateTimer(currentTime: currentTime)
        }
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
        
//        teste = SKBalloonNode(imageNamed: "npc_balloon")
//        teste?.position = CGPoint(x: -10, y: -80)
////        teste?.zPosition = 4
//        teste?.setScale(2)
//        teste?.setHide(false)
//        teste?.change(text: "texto 1")
//        self.addChild(teste!)
        
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
        
//        testeButton = SKButtonNode(imageNamed: "arrow_bt", clickAction: { [weak self] in
//            self?.indexText += 1
//
//            if(self!.indexText >= self!.introText.count) {
//                self?.teste?.removeFromParent()
//                self?.testeButton?.setHideButton(true)
//                // self?.teste?.change(text: "")
//            } else {
//                self?.teste?.change(text: (self?.introText[self?.indexText ?? 0])!)
//            }
//        })
//        testeButton?.position = .init(x: 90, y: 0)
//        testeButton?.xScale = -1
//        self.addChild(testeButton!)
    }
}


