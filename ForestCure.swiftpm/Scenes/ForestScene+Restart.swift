
import Foundation
import SpriteKit

extension ForestScene {
    func restartGame(){
        guard let scene else {return}
        
        sceneNode.addChild(internNode!)
        sceneNode.addChild(gaucoNode!)
        sceneNode.addChild(canaNode!)
        sceneNode.addChild(andirobaNode!)
        sceneNode.addChild(boldoNode!)
        sceneNode.addChild(labNode!)
        
        sceneNode.addChild(collectPlantsButton!)
        sceneNode.addChild(collectAndirobaButton!)
        sceneNode.addChild(collectBoldoButton!)
        sceneNode.addChild(collectCanaButton!)
        sceneNode.addChild(cancelPlantsButton!)
        sceneNode.addChild(cancelAndirobaButton!)
        sceneNode.addChild(cancelBoldoButton!)
        sceneNode.addChild(cancelCanaButton!)
        
        
    }
    
}

//var timer: TimerNode?


//func restartGame() {
//        guard let scene else { return }
//        scene.isPaused = false
//        fruitsGot = 0
//        enemiesKilled = 0
//
//        treeNode.removeAllFruits()
//        sceneNode.removeAllChildren()
//        sceneNode.removeAllActions()
//
//        self.removeAllChildren()
//        self.removeAllActions()
//
//        scene.addChild(sceneNode)
//        addFirstNodes()
//        startGame()
//    }
