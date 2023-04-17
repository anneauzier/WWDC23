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
    var canaNode: CanaNode?
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
    var canaCard: SKBalloonNode?
    var cientist: SKBalloonNode?
    
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
        "My name is Steve, I'm a scientist, and I'm very relieved \nthat you showed up here  to help me create natural remedies to treat common diseases \nhere in the Amazon region!",
        "texto 3",
    ]
    var indexText = -1
    
    override func sceneDidLoad() {
        internNode = InternNode()
        internNode?.name = "intern"
        internNode?.position.y = -80
        self.addChild(internNode!)
        
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
        
        canaNode = CanaNode()
        canaNode?.name = "cana"
        canaNode?.zPosition = -1
        canaNode?.position.y = -75
        canaNode?.position.x = 600
        self.addChild(canaNode!)
        
        gaucoNode = PlantsNode()
        gaucoNode?.name = "guaco"
        gaucoNode?.zPosition = -1
        gaucoNode?.position.y = -72
        gaucoNode?.position.x = 800
        self.addChild(gaucoNode!)
        
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
        
        let background = SKSpriteNode(imageNamed: "black")
        background.texture?.filteringMode = .nearest
        background.zPosition = -1
        background.position = CGPoint(x: 0, y: 0)
        self.addChild(background)
        
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
        
        andirobaCard = SKBalloonNode(imageNamed: "andiroba_card")
        andirobaCard?.position = CGPoint(x: 200 , y: 15)
        andirobaCard?.zPosition = 2
        andirobaCard?.setScale(0.67)
        andirobaCard?.setHide(true)
        self.addChild(andirobaCard!)
        
        boldoCard = SKBalloonNode(imageNamed: "boldo_card")
        boldoCard?.position = CGPoint(x: 400, y: 15)
        boldoCard?.zPosition = 2
        boldoCard?.setScale(0.67)
        boldoCard?.setHide(true)
        self.addChild(boldoCard!)
        
        canaCard = SKBalloonNode(imageNamed: "cana_card")
        canaCard?.position = CGPoint(x: 600, y: 15)
        canaCard?.zPosition = 2
        canaCard?.setScale(0.67)
        canaCard?.setHide(true)
        self.addChild(canaCard!)
        
        guacoCard = SKBalloonNode(imageNamed: "guaco_card")
        guacoCard?.position = CGPoint(x: 800, y: 15)
        guacoCard?.zPosition = 2
        guacoCard?.setScale(0.67)
        guacoCard?.setHide(true)
        //        guacoCard?.run(SKAction.moveTo(y: -120, duration: 0.8))
        self.addChild(guacoCard!)
        
        cientist = SKBalloonNode(imageNamed: "cientist")
        cientist?.position.x = -4
        cientist?.zPosition = 4
        cientist?.setScale(0.8)
//        cientist?.scene?.scaleMode = .resizeFill
        self.pauseTime = true
        cientist?.setHide(false)
        cientist?.change(text: "Hello, trainee! Welcome to my Institute!")
        self.addChild(cientist!)
        
        // ======== Controls =========
        
        leftButton = SKButtonNode(imageNamed: "left1", clickAction: { [weak self] in
            self?.direction = -1
            self?.internNode?.playAnim(state: .walk)
        }, unclickAction: { [weak self] in
            self?.direction = 0
            self?.internNode?.playAnim(state: .idle)
        })
        leftButton?.position = .init(x: -320, y: -160)
        leftButton?.setScale(0.2)
        leftButton?.zPosition = 2
        self.camera?.addChild(leftButton!)
        
        rightButton = SKButtonNode(imageNamed: "right1", clickAction: { [weak self] in
            self?.direction = 1
            self?.internNode?.playAnim(state: .walk)
        }, unclickAction: { [weak self] in
            self?.direction = 0
            self?.internNode?.playAnim(state: .idle)
        })
        rightButton?.position = .init(x: -230, y: -160)
        rightButton?.setScale(0.2)
        rightButton?.zPosition = 2
        self.camera?.addChild(rightButton!)
        
        testeButton = SKButtonNode(imageNamed: "right2", clickAction: { [weak self] in
            self?.indexText += 1
            
            if(self!.indexText >= self!.introText.count) {
                self?.cientist?.removeFromParent()
                self?.testeButton?.setHideButton(true)
                self?.pauseTime = false
                background.removeFromParent()
                // self?.teste?.change(text: "")
            } else {
                self?.cientist?.change(text: (self?.introText[self?.indexText ?? 0])!)
            }
        })
        testeButton?.position = .init(x: 215, y: -90)
        testeButton?.setScale(0.15)
        self.addChild(testeButton!)
    }
}


