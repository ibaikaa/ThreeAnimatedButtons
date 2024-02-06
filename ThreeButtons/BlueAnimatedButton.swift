//
//  BlueAnimatedButton.swift
//  ThreeButtons
//
//  Created by Ian Baikuchukov on 4/2/24.
//

import UIKit

struct Foo {
    
}

final class BlueAnimatedButton: UIButton {
    
    let title: String
    
    init(title: String) {
        self.title = title
        
        super.init(frame: .zero)
        print(configuration == nil)
        configuration?.imagePlacement = .trailing
        configuration?.title = "Some title"
        configuration?.contentInsets = .init(top: 10, leading: 14, bottom: 10, trailing: 10)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupButtonUI()
    }
    
    private func setupButtonUI() {
//        setTitle(title, for: .normal)
//        setTitleColor(.white, for: .normal)
        
//        imageView?.tintColor = .white
        
//        backgroundColor = .systemBlue
//        layer.cornerRadius = 12
    }
    
}
