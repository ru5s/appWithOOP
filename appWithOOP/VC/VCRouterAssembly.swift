//
//  VCRouterAssembly.swift
//  appWithOOP
//
//  Created by Ruslan Ismailov on 29/08/22.
//

import Foundation
import UIKit

protocol VCRouterAssemblyProtocol: AnyObject {
    func configureView(view: ViewController)

}

class VCRouterAssembly: VCRouterAssemblyProtocol {
    
    weak var presenter: ProtocolPresenterVC?
    
    func configureView(view: ViewController) {
        
        let presenter = PresenterVC(view)
        view.presenter = presenter
        
       
    }

}
