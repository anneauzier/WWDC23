//
//  ForestScene.swift
//  ForestCure
//
//  Created by Anne Victoria Batista Auzier on 03/04/23.
//

import Foundation
import SpriteKit
import SwiftUI

class ForestScene: SKScene {
    
    var internNode: InternNode?
    var gaucoNode: PlantsNode?
    var andirobaNode: AndirobaNode?
    var boldoNode: BoldoNode?
    var labNode: LabNode?
    var timer: TimerNode?
    
    var rightButton: SKButtonNode?
    var leftButton: SKButtonNode?
    var infoPlantsButton: SKButtonNode?
    var collectPlantsButton: SKButtonNode?
    var cancelPlantsButton: SKButtonNode?
    var testeButton: SKButtonNode?
    
    var guacoCard: SKBalloonNode?
    var andirobaCard: SKBalloonNode?
    var boldoCard: SKBalloonNode?
    var teste: SKBalloonNode?
    
    var backgroundForestMusic = SKAudioNode(fileNamed: "startSound.mp3")
    var collectPlantsMusic = SKAudioNode(fileNamed: "collectSound.mp3")
    var cancelPlantsMusic = SKAudioNode(fileNamed: "cancelSound.mp3")
    
    var direction: CGFloat = 0
    var moveSpeed: CGFloat = 2
    var pauseTime: Bool = false
    
    public static let shared = ForestScene()
    var plantsCollected: [String] = []
    
    var parallaxNodes: [SKNode] = []
    
    var introText: [String] = [
        "texto 2",
        "texto 3",
    ]
    var indexText = -1
    
    override func sceneDidLoad() {
        internNode = InternNode()
        internNode?.name = "intern"
        internNode?.position.y = -80
        self.addChild(internNode!)
        
        gaucoNode = PlantsNode()
        gaucoNode?.name = "guaco"
        gaucoNode?.zPosition = -1
        gaucoNode?.position.y = -75
        gaucoNode?.position.x = 80
        self.addChild(gaucoNode!)
        
        andirobaNode = AndirobaNode()
        andirobaNode?.name = "andiroba"
        andirobaNode?.zPosition = -1
        andirobaNode?.position.y = -75
        andirobaNode?.position.x = 200
        self.addChild(andirobaNode!)
        
        boldoNode = BoldoNode()
        boldoNode?.name = "boldo"
        boldoNode?.zPosition = -1
        boldoNode?.position.y = -75
        boldoNode?.position.x = 400
        self.addChild(boldoNode!)

        labNode = LabNode()
        labNode?.name = "lab_semfundo"
        labNode?.zPosition = -1
        labNode?.position.y = -55
        labNode?.position.x = -230
        self.addChild(labNode!)
        
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
        if pauseTime == true {
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
        let constraint: SKConstraint = .distance(.init(lowerLimit: -100, upperLimit: 1000), to: .zero)
        self.camera?.constraints = [constraint]
        
        timer = TimerNode()
        timer?.position.x = -300
        timer?.position.y = 80
        timer?.zPosition = 2
        self.camera?.addChild(timer!)
        
        //===== Discover Image ====
        
        guacoCard = SKBalloonNode(imageNamed: "guaco_card")
        guacoCard?.position = CGPoint(x: 80, y: 0)
        guacoCard?.zPosition = 2
        guacoCard?.setScale(0.6)
        guacoCard?.setHide(true)
//        guacoCard?.run(SKAction.moveTo(y: -120, duration: 0.8))
        self.addChild(guacoCard!)
        
        andirobaCard = SKBalloonNode(imageNamed: "andiroba_card")
        andirobaCard?.position = CGPoint(x: 200 , y: 0)
        andirobaCard?.zPosition = 2
        andirobaCard?.setScale(0.6)
        andirobaCard?.setHide(true)
        self.addChild(andirobaCard!)
        
        boldoCard = SKBalloonNode(imageNamed: "boldo_card")
        boldoCard?.position = CGPoint(x: 400, y: 0)
        boldoCard?.zPosition = 2
        boldoCard?.setScale(0.6)
        boldoCard?.setHide(true)
        self.addChild(boldoCard!)
        
//        teste = SKBalloonNode(imageNamed: "npc_balloon")
//        teste?.position = CGPoint(x: -10, y: -80)
////        teste?.zPosition = 4
//        teste?.setScale(2)
//        teste?.setHide(false)
//        teste?.change(text: "texto 1")
//        self.addChild(teste!)
        
        // ======== Controls =========
        
        leftButton = SKButtonNode(imageNamed: "arrow_bt", clickAction: { [weak self] in
            self?.direction = -1
            self?.internNode?.playAnim(state: .walk)
        }, unclickAction: { [weak self] in
            self?.direction = 0
            self?.internNode?.playAnim(state: .idle)
        })
        leftButton?.position = .init(x: -260, y: -95)
        self.camera?.addChild(leftButton!)
        
        rightButton = SKButtonNode(imageNamed: "arrow_bt", clickAction: { [weak self] in
            self?.direction = 1
            self?.internNode?.playAnim(state: .walk)
        }, unclickAction: { [weak self] in
            self?.direction = 0
            self?.internNode?.playAnim(state: .idle)
        })
        rightButton?.position = .init(x: -230, y: -95)
        rightButton?.xScale = -1
        self.camera?.addChild(rightButton!)
        
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


