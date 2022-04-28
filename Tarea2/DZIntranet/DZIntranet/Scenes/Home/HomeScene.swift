//
//  HomeScene.swift
//  DZIntranet
//
//  Created by Kenyi Rodriguez on 19/04/22.
//

import Foundation

class HomeScene: Scene {
    
    var input = HomeSceneInputs()
    
    var homeOption: HomeOption = .none {
        didSet { self.selectOptionMenu() }
    }
    
    override func drawView() {
        super.drawView()
        let optionValue = self.input.txtMenu.getInput()
        self.homeOption = HomeOption(rawValue: Int(optionValue) ?? 0) ?? .none
    }
    
    func selectOptionMenu() {
        guard let scene = self.homeOption.scene else { return }
        self.navigationScene?.pushScene(scene)
    }
}
