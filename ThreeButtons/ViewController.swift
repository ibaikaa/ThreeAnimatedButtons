//
//  ViewController.swift
//  ThreeButtons
//
//  Created by Ian Baikuchukov on 4/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var firstButton = CustomButton(title: "First Button")
    private lazy var secondButton = CustomButton(title: "Second Medium Button")
    private lazy var thirdButton = CustomButton(title: "Third")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupSubviews()
        addActionForThirdButton()
    }
        
    func setupSubviews() {
        view.addSubview(firstButton)
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(secondButton)
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 5),
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(thirdButton)
        thirdButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 5),
            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func addActionForThirdButton() {
        let presentModalControllerAction = UIAction { [weak self] _ in
            let modalController = UIViewController()
            modalController.view.backgroundColor = .white
            
            self?.present(modalController, animated: true)
        }
        
        thirdButton.addAction(presentModalControllerAction, for: .touchUpInside)
    }

}
