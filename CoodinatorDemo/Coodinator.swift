//
//  Coodinator.swift
//  CoodinatorDemo
//
//  Created by 辜敬閎 on 2022/3/22.
//

import UIKit

class Coodinator {
    let rootViewController: UINavigationController
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    func start() {
        if let firstVC = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "MainViewController") as? MainViewController {
            firstVC.delegate = self
            rootViewController.pushViewController(firstVC, animated: false)
        }
    }
}

extension Coodinator: MainViewControllerTransitionDelegate {
    func presentAViewController(from viewController: UIViewController, buttonName: String) {
        if let vc = UIStoryboard(name: "Storyboard", bundle: .main).instantiateViewController(withIdentifier: "AViewController") as? AViewController {
            vc.delegate = self
            vc.defaultButtonName = buttonName
            viewController.present(vc, animated: true)
        }
    }
    
    func pushBViewController(buttonName: String) {
        if let vc = UIStoryboard(name: "Storyboard", bundle: .main).instantiateViewController(withIdentifier: "BViewController") as? BViewController {
            vc.buttonName = buttonName
            rootViewController.pushViewController(vc, animated: true)
        }
    }
}

extension Coodinator: AViewControllerTransitionDelegate {
    func presentCViewController(from viewController: UIViewController) {
        if let vc = UIStoryboard(name: "Storyboard", bundle: .main).instantiateViewController(withIdentifier: "CViewController") as? CViewController {
            vc.delegate = self
            viewController.present(vc, animated: true)
        }
    }
}

extension Coodinator: CViewControllerTransitionDelegate {
    func superPresentBViewController(from viewController: UIViewController, buttonName: String) {

        let presentingVC = viewController.presentingViewController
        
        presentingVC?.dismiss(animated: true) { [weak presentingVC] in
            if let vc = UIStoryboard(name: "Storyboard", bundle: .main).instantiateViewController(withIdentifier: "BViewController") as? BViewController {
                vc.buttonName = buttonName
                presentingVC?.present(vc, animated: true)
            }
        }
    }
    
    func rootPresentBViewController(buttonName: String) {

        rootViewController.dismiss(animated: true) { [weak self] in
            if let vc = UIStoryboard(name: "Storyboard", bundle: .main).instantiateViewController(withIdentifier: "BViewController") as? BViewController {
                vc.buttonName = buttonName
                self?.rootViewController.present(vc, animated: true)
            }
        }
    }
}
