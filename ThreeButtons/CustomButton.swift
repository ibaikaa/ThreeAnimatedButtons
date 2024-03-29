//
//  CustomButton.swift
//  ThreeButtons
//
//  Created by Ian Baikuchukov on 6/2/24.
//

import UIKit

final class CustomButton: UIButton {
    
    let title: String
    
    private lazy var customConfiguration: UIButton.Configuration = {
        var config = UIButton.Configuration.filled()
        
        config.title = title
        config.titleAlignment = .center
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.foregroundColor = UIColor.white
            return outgoing
        }
        
        config.image = UIImage(systemName: "arrow.right.circle.fill")
        config.imagePadding = 8
        config.imagePlacement = .trailing
        config.imageColorTransformer = UIConfigurationColorTransformer { _ in .white }
        
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        
        var background = UIButton.Configuration.plain().background
        background.backgroundColor = .systemBlue
        background.cornerRadius = 12
        config.background = background
                
        return config
    }()
    
    override func tintColorDidChange() {
        switch tintAdjustmentMode {
        case .dimmed:
            configuration?.background.backgroundColorTransformer = UIConfigurationColorTransformer { _ in .systemGray2 }
            configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                var outgoing = incoming
                outgoing.foregroundColor = UIColor.systemGray3
                return outgoing
            }
            configuration?.imageColorTransformer = UIConfigurationColorTransformer { _ in .systemGray3 }
                        
        default:
            self.configuration = customConfiguration
        }
    }
    
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        configuration = customConfiguration
        
        /// fixes bug with `imageView.tintColor` not being changed and forcly being changed to gray color
        imageView?.tintAdjustmentMode = .normal
        
        addAnimationForTap()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addAnimationForTap() {
        addTarget(self, action: #selector(buttonTouched), for: .touchDown)
        
        addTarget(self, action: #selector(buttonResign), for: .touchUpOutside)
        addTarget(self, action: #selector(buttonResign), for: .touchUpInside)
    }
    
    @objc func buttonTouched(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3, delay: 0, options: [.allowUserInteraction, .beginFromCurrentState]) {
            sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }
    }
    
    @objc func buttonResign(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3, delay: 0, options: [.allowUserInteraction, .beginFromCurrentState]) {
            sender.transform = CGAffineTransform.identity
        }
    }
        
}
