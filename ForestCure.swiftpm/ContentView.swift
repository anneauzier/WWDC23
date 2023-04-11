import SwiftUI
import SpriteKit

struct ContentView: View {
    
//    let orientation = UIInterfaceOrientation.landscapeRight
//    let screenSize = UIScreen.main.bounds.size
//    let deviceSize = CGSize(width: min(self.screenSize.width, screenSize.height), height: max(screenSize.width, screenSize.height))
//    let rect = CGRect(origin: .zero, size: deviceSize)
//    let vc = GameViewController()
//    vc.view.frame = rect
//    vc.view.backgroundColor = .white
//    vc.preferredContentSize = deviceSize
//    vc.allowedOrientations = [.landscapeRight, .landscapeLeft] // Define as orientações permitidas
//    PlaygroundPage.current.liveView = vc

    // Configura a cena do SpriteKit
//    let skView = SKView(frame: rect)
//    skView.showsFPS = true
//    skView.showsNodeCount = true
//    skView.ignoresSiblingOrder = true
//    vc.view.addSubview(skView)


//    // Define as propriedades do view controller do SpriteKit
//    class GameViewController: UIViewController {
//        var allowedOrientations: UIInterfaceOrientationMask = .landscapeRight // Define a orientação permitida
//
//        override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//            return allowedOrientations
//        }
//
//        override var shouldAutorotate: Bool {
//            return true
//        }
//    }
//
    // classe para exibicao de cenários
    var scene: SKScene {
        let scene = ForestScene()
        scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scene.scaleMode = .aspectFill
        scene.anchorPoint = .init(x: 0.5, y: 0.5)
        return scene
    }

    var body: some View {
        // uma visualizacao swiftui que renderiza uma cena do spritekit
        SpriteView(scene: scene, debugOptions: [.showsPhysics])
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), contentMode: .fill)
            .ignoresSafeArea()
    }
}
