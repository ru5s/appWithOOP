//
//  Model.swift
//  appWithOOP
//
//  Created by Ruslan Ismailov on 26/08/22.
//

import Foundation
import UIKit

class Item {
    var text: String
    var image: UIImage
    init(text: String, image: UIImage){
        self.text = text
        self.image = image
    }
}

protocol ModelProtocol{
    var arrayImages: [Item] {get}
}

class Model: ModelProtocol {
    
    var arrayImages: [Item] = [
        Item(text: "Image #1", image: UIImage(named: "pic 1")!),
        Item(text: "Image #2", image: UIImage(named: "pic 2")!),
        Item(text: "Image #3", image: UIImage(named: "pic 3")!),
        Item(text: "Image #4", image: UIImage(named: "pic 4")!),
        Item(text: "Image #5", image: UIImage(named: "pic 5")!),
        Item(text: "Image #6", image: UIImage(named: "pic 6")!),
        Item(text: "Image #7", image: UIImage(named: "pic 7")!),
        Item(text: "Image #8", image: UIImage(named: "pic 8")!),
    ]
}


