//
//  NavigationScene.swift
//  DZIntranet
//
//  Created by Kenyi Rodriguez on 19/04/22.
//

import Foundation

class NavigationScene: Scene {
    
    var scenes = [Scene]()
    
    init(rootScene: Scene) {
        super.init(title: "")
        self.pushScene(rootScene)
    }
    
    func pushScene(_ scene: Scene) {
        scene.navigationScene = self
        self.scenes.last?.willDisappear()
        self.scenes.append(scene)
        scene.didLoad()
        scene.willAppear()
    }
    
    func popScene() {
        self.scenes.last?.willDisappear()
        self.scenes.removeLast()
        self.scenes.last?.willAppear()
    }
    
    func popToRootScene() {
        if self.scenes.count <= 1 { return }
        self.scenes.last?.willDisappear()
        self.scenes = [self.scenes.first].compactMap({ $0 })
        self.scenes.last?.willAppear()
    }
    
    override func willAppear() {
        self.scenes.last?.willAppear()
    }
}
