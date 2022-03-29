//
//  ViewController.swift
//  CoodinatorDemo
//
//  Created by 辜敬閎 on 2022/3/21.
//

import UIKit

protocol MainViewControllerTransitionDelegate: AnyObject {
    func presentAViewController(from viewController: UIViewController, buttonName: String)
    func pushBViewController(buttonName: String)
}

class MainViewController: UIViewController {

    @IBOutlet weak var AButton: UIButton!
    @IBOutlet weak var BButton: UIButton!
    @IBOutlet weak var CButton: UIButton!
    @IBOutlet weak var DButton: UIButton!
    @IBOutlet weak var EButton: UIButton!
    @IBOutlet weak var FButton: UIButton!
    @IBOutlet weak var GButton: UIButton!
    @IBOutlet weak var HButton: UIButton!
    
    weak var delegate: MainViewControllerTransitionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AButton.addTarget(self, action: #selector(AButtonDidTap), for: .touchUpInside)
        BButton.addTarget(self, action: #selector(BButtonDidTap), for: .touchUpInside)
        CButton.addTarget(self, action: #selector(CButtonDidTap), for: .touchUpInside)
        DButton.addTarget(self, action: #selector(DButtonDidTap), for: .touchUpInside)
        EButton.addTarget(self, action: #selector(EButtonDidTap), for: .touchUpInside)
        FButton.addTarget(self, action: #selector(FButtonDidTap), for: .touchUpInside)
        GButton.addTarget(self, action: #selector(GButtonDidTap), for: .touchUpInside)
        HButton.addTarget(self, action: #selector(HButtonDidTap), for: .touchUpInside)
    }
    
    @objc func AButtonDidTap() {
        delegate?.presentAViewController(from: self, buttonName: "A")
    }
    
    @objc func BButtonDidTap() {
        delegate?.pushBViewController(buttonName: "B")
    }
    
    @objc func CButtonDidTap() {
        print("CC")
    }
    
    @objc func DButtonDidTap() {
        print("DD")
    }
    
    @objc func EButtonDidTap() {
        print("EE")
    }
    
    @objc func FButtonDidTap() {
        print("FF")
    }
    
    @objc func GButtonDidTap() {
        print("GG")
    }
    
    @objc func HButtonDidTap() {
        print("HH")
    }
    
}

