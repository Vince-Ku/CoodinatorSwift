//
//  BViewController.swift
//  CoodinatorDemo
//
//  Created by 辜敬閎 on 2022/3/22.
//

import UIKit

class BViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    var buttonName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        button.setTitle(buttonName, for: .normal)
    }
}
