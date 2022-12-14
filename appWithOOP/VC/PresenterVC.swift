//
//  PresenterVC.swift
//  appWithOOP
//
//  Created by Ruslan Ismailov on 29/08/22.
//

import Foundation
import UIKit

protocol ProtocolPresenterVC: class{
    init(_ viewController: ViewController)
    
    func addImage(index: Int)
    func addText(index: Int)
    func openPhotoPage()
}

class PresenterVC: ProtocolPresenterVC {
    
    let navigationController = UINavigationController()
    
    weak var viewController: ViewController!
    
    required init(_ viewController: ViewController) {
        self.viewController = viewController
    }
    
    var secondVC = SecondViewController()
    let model = Model()
    
    func addImage(index: Int){
        secondVC.indexOf = index
        secondVC.delegate = viewController
        secondVC.imageView.image = model.arrayImages[index].image
    }
    
    func addText(index: Int){
        secondVC.label.text = model.arrayImages[index].text
    }
    
    func openPhotoPage(){
        secondVC.modalTransitionStyle = .crossDissolve
        secondVC.modalPresentationStyle = .fullScreen
        
        viewController?.present(secondVC, animated: true)
    }
}


