//
//  ViewController.swift
//  PGDrawerExample
//
//  Created by ipagong on 2017. 3. 14..
//  Copyright © 2017년 ipagong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DrawerTransitionDelegate {

    private var leftDrawerTransition:DrawerTransition!
    private var rightDrawerTransition:DrawerTransition!
    
    private let leftMenu  = MenuViewController()
    private let rightMenu = MenuViewController()
    private let button = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        
        self.button.addTarget(self, action: #selector(click), for: .touchUpInside)
        self.view.addSubview(self.button)
        
        self.leftDrawerTransition = DrawerTransition(target: self, drawer: leftMenu)
        self.leftDrawerTransition.setPresentCompletion { print("left present...") }
        self.leftDrawerTransition.setDismissCompletion { print("left dismiss...") }
        self.leftDrawerTransition.edgeType = .left
        
        self.rightDrawerTransition = DrawerTransition(target: self, drawer: rightMenu)
        self.rightDrawerTransition.setPresentCompletion { print("right present...") }
        self.rightDrawerTransition.setDismissCompletion { print("right dismiss...") }
        self.rightDrawerTransition.edgeType = .right
    }

    override func viewWillAppear(_ animated: Bool) {
        let left = UIBarButtonItem(title: "LEFT", style: .done, target: self, action: #selector(leftOpen))
        self.navigationItem.leftBarButtonItem = left
        
        let right = UIBarButtonItem(title: "RIGHT", style: .done, target: self, action: #selector(rightOpen))
        self.navigationItem.rightBarButtonItem = right
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.button.frame = self.view.bounds
    }
    
    func click() { button.backgroundColor = (button.backgroundColor == .red ? .blue : .red) }
    func leftOpen()  { self.leftDrawerTransition.presentDrawerViewController(animated: true) }
    func rightOpen() { self.rightDrawerTransition.presentDrawerViewController(animated: true) }

}

