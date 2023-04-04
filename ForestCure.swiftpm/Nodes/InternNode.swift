import Foundation
import SpriteKit

enum InternAnimState {
    case idle, walk, none
}

class InternNode: SKNode {
    
    var spriteIntern: SKSpriteNode
    var lastState: InternAnimState = .none
    
    override init() {
        spriteIntern = SKSpriteNode(imageNamed: "char_idle1")
        super.init()
        
        spriteIntern.texture?.filteringMode = .nearest
        self.addChild(spriteIntern)
        
        playAnim(state: .idle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func playAnim(state: InternAnimState) {
        switch state {
        case .idle:
            guard lastState != .idle else {return}
            lastState = .idle
            self.spriteIntern.run(.repeatForever(.animate(with: .init(withFormat: "char_idle%@", range: 1...4), timePerFrame: 0.1)))
        case .walk:
            guard lastState != .walk else {return}
            lastState = .walk
            self.spriteIntern.run(.repeatForever(.animate(with: .init(withFormat: "char_walk%@", range: 1...4), timePerFrame: 0.1)))
        default:
            break
        }
    }
}

