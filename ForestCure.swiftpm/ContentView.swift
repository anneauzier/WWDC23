import SwiftUI
import SpriteKit

struct ContentView: View {
    
    // classe para exibicao de cenários
    var scene: SKScene {
        let scene = ForestScene()
//        scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scene.scaleMode = .resizeFill
        scene.anchorPoint = .init(x: 0.5, y: 0.5)
        return scene
    }

    var body: some View {
        // uma visualizacao swiftui que renderiza uma cena do spritekit
        SpriteView(scene: scene)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .ignoresSafeArea()
    }
}
