//
//  CViewController.swift
//  CoodinatorDemo
//
//  Created by 辜敬閎 on 2022/3/26.
//

import UIKit

protocol CViewControllerTransitionDelegate: AnyObject {
    func superPresentBViewController(from viewController: UIViewController, buttonName: String)
    func rootPresentBViewController(buttonName: String)
}

class CViewController: UIViewController {

    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!

    weak var delegate: CViewControllerTransitionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topButton.setTitle("C Top", for: .normal)
        topButton.addTarget(self, action: #selector(topButtonDidTap), for: .touchUpInside)
        
        bottomButton.setTitle("C Bottom", for: .normal)
        bottomButton.addTarget(self, action: #selector(bottomButtonDidTap), for: .touchUpInside)
    }

    @objc func topButtonDidTap() {
        delegate?.superPresentBViewController(from: self, buttonName: "super to B")
    }
    
    @objc func bottomButtonDidTap() {
        delegate?.rootPresentBViewController(buttonName: "root to B")
    }

}
