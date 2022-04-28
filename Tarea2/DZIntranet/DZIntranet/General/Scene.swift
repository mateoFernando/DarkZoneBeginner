//
//  Scene.swift
//  DZIntranet
//
//  Created by Kenyi Rodriguez on 19/04/22.
//

import Foundation

class Scene {
    
    unowned var navigationScene: NavigationScene?
    
    let title: String
    
    func didLoad() { //Se va a llamar cuando la vista inicie y se llama una sola vez!
    }
    
    func willAppear() {  //Se llama cada vez que la vista quiera aparecer o esta por aparecer
        self.drawView()
    }
    
    func willDisappear() { //Se llama cada vez que la vista quiera desaparecer o esta por desaparecer
        print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
    }
    
    func backScene() {
        let message = """
        
                Presione Enter para regresar
        
        """
        _ = Input.Text(message: message).getInput()
        self.navigationScene?.popScene()
    }
    
    func drawView() {
        self.drawHeader()
    }

    private func drawHeader() {
        
        let line = Array(repeating: "=", count: self.title.count + 14).joined(separator: "")
        let space = Array(repeating: " ", count: 7).joined(separator: "")
        let header = """
                                
                        \(line)
                        \(space + self.title + space)
                        \(line)
        
        """
        print(header)
    }
    
    init(title: String) {
        self.title = title
    }
}
