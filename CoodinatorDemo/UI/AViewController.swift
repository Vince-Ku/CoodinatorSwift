//
//  AViewController.swift
//  CoodinatorDemo
//
//  Created by 辜敬閎 on 2022/3/22.
//

import UIKit

protocol AViewControllerTransitionDelegate: AnyObject {
    func presentCViewController(from viewController: UIViewController)
}

class AViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    var defaultButtonName: String?
    
    weak var delegate: AViewControllerTransitionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }
    
    func setupUI() {
        button.setTitle(defaultButtonName, for: .normal)
    }
    
    @objc func buttonDidTap() {
        delegate?.presentCViewController(from: self)
    }
}
