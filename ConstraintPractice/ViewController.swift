//
//  ViewController.swift
//  ConstraintPractice
//
//  Created by Carlos Cordeiro on 03/03/2020.
//  Copyright © 2020 Carlos Cordeiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topMenuConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var redButton: UIButton!
    
    @IBOutlet weak var orangeButton: UIButton!
    
    @IBOutlet weak var purpleButton: UIButton!
    
    @IBOutlet weak var toggleButton: UIButton!
    
    @IBOutlet weak var menuView: UIView!
    
    var isMenuOpen: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarHeight = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        
        topMenuConstraint.constant = -menuView.frame.size.height + CGFloat(40) + statusBarHeight
        
        menuView.layer.shadowOpacity = 0.4
        
        menuView.layer.shadowColor = UIColor.black.cgColor
        
        menuView.layer.shadowOffset = CGSize.zero
        
        menuView.layer.shadowRadius = CGFloat(15.0)
        

    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        redButton.layer.cornerRadius = redButton.frame.size.width / 2
        
        orangeButton.layer.cornerRadius = orangeButton.frame.size.width / 2
        
        purpleButton.layer.cornerRadius = purpleButton.frame.size.width / 2
    }


    @IBAction func redButtonDidTouch(_ sender: Any) {
        
        view.backgroundColor = UIColor.red
    }
    
    
    @IBAction func orangeButtonDidTouch(_ sender: Any) {
        
        view.backgroundColor = UIColor.orange

        
    }
    
    @IBAction func purpleButtonDidTouch(_ sender: Any) {
        
        view.backgroundColor = UIColor.purple

        
    }
    
    func closeMenu() {
        
        let statusBarHeight = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        
        UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseOut, animations: {
            self.topMenuConstraint.constant = -self.menuView.frame.size.height + CGFloat(40) + statusBarHeight
            self.view.layoutIfNeeded()
             
        }, completion: nil)
        
        
    }
    
    
    func openMenu() {
        
        UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseOut, animations: {
            
            self.topMenuConstraint.constant = CGFloat(0.0)
                   self.view.layoutIfNeeded()
                    
               }, completion: nil)
               
        
        
        
    }
    
    
    @IBAction func toggleButtonDidTouch(_ sender: UIButton) {
        
        if isMenuOpen {
            
            sender.setTitle("Open", for: .normal)
            
            isMenuOpen = false
            
            closeMenu()
            
        } else {
            
            sender.setTitle("Close", for: .normal)
            
            isMenuOpen = true
            
            openMenu()
        }
    }
    
    
    
}

