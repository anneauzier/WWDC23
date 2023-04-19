
import Foundation
import SpriteKit

extension ForestScene {
    
    func restart(){
        
        self.timer?.restartTimer()
        pauseTime = false
        direction = 0
        
        sceneNode.removeAllChildren()
        sceneNode.removeAllActions()
        
        restartSetup()
    }
    
    func restartMap() {
        camera?.removeAllChildren()
    }
    
    func restartSetup(){
        guard let scene else {return}
        
        sceneNode.addChild(internNode!)
        internNode?.spriteIntern.position.y = -80
        sceneNode.addChild(gaucoNode!)
        gaucoNode?.spritePlants.position = CGPoint(x: -72, y: 800)
        sceneNode.addChild(canaNode!)
        canaNode?.canaPlant.position = CGPoint(x: -75, y: 600)
        sceneNode.addChild(andirobaNode!)
        andirobaNode?.andirobaPlant.position = CGPoint(x: -75, y: 200)
        sceneNode.addChild(boldoNode!)
        boldoNode?.boldoPlant.position = CGPoint(x: -75, y: 400)
        sceneNode.addChild(labNode!)
        labNode?.spriteLab.position = CGPoint(x: -55, y: -190)

        sceneNode.addChild(backgroundForestMusic)
        sceneNode.addChild(collectPlantsMusic)
        sceneNode.addChild(cancelPlantsMusic)
        
        self.plantsCollected = []

        scene.addChild(sceneNode)
    }
}


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
