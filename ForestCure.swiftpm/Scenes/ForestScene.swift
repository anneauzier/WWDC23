//
//  ForestScene.swift
//  ForestCure
//
//  Created by Anne Victoria Batista Auzier on 03/04/23.
//

import Foundation
import SpriteKit

class ForestScene: SKScene {
    
    //Entidade
    var internNode: InternNode?
    //Componentes
    var direction: CGFloat = 0
    var moveSpeed: CGFloat = 2
    
    //quando a cena é carrega pela primeira vez
    override func sceneDidLoad() {
        internNode = InternNode()
        self.addChild(internNode!)
    }
    
    // é usado toda vez que a cena é exibida
    override func didMove(to view: SKView) {
        setupScene()
    }
    
    // metodo chamado continuamente enquanto a cena está sendo exibida, usado pra atualizar estados do jogo e realizar cálculos e lógica do jogo
    override func update(_ currentTime: TimeInterval) {
        if (direction != 0) {
            self.internNode?.xScale = direction // espelhar o player
            self.internNode?.position.x += self.direction * moveSpeed
        }
        self.camera?.run(.moveTo(x: self.internNode?.position.x ?? 0, duration: 0.4))
    }
    
    public func setupScene() {
        
        // ========= Camera =========
        let camera = SKCameraNode()
        self.camera = camera
        camera.xScale = 0.3
        camera.yScale = 0.3
        self.addChild(camera)
        
        // ======== Controls =========
        let leftButton = SKButtonNode(imageNamed: "arrow_bt", clickAction: { [weak self] in
            self?.direction = -1
            self?.internNode?.playAnim(state: .walk)
        }, unclickAction: { [weak self] in
            self?.direction = 0
            self?.internNode?.playAnim(state: .idle)
        })
        leftButton.position = .init(x: -130, y: -95)
        self.camera?.addChild(leftButton)
        
        let rightButton = SKButtonNode(imageNamed: "arrow_bt", clickAction: { [weak self] in
            self?.direction = 1
            self?.internNode?.playAnim(state: .walk)
        }, unclickAction: { [weak self] in
            self?.direction = 0
            self?.internNode?.playAnim(state: .idle)
        })
        rightButton.position = .init(x: -70, y: -95)
        rightButton.xScale = -1
        self.camera?.addChild(rightButton)
    }
}
