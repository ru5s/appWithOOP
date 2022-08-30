//
//  SecondViewController.swift
//  appWithOOP
//
//  Created by Ruslan Ismailov on 27/08/22.
//

import UIKit

protocol ProtocolSecondViewController {
    func addImage(index: Int)
    func addText(index: Int)
}


class SecondViewController: UIViewController, ProtocolSecondViewController {
    
    var model = Model()
    
    var presenter: ProtocolPresenterVC!
    weak var delegate: ViewController!
    
    var indexOf: Int = 0
    
    var imageView = UIImageView()
    var backButton = UIButton()
    var label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        imageView = UIImageView(frame: CGRect(x: 0, y: 150, width: 300, height: 300))
        backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
    }
    
    override func viewDidLayoutSubviews() {
        addBackBtn(btn: backButton)
        addImageView(imageView: imageView, backBtn: backButton)
        addLabel(label: label, image: imageView)
        
        addImage(index: indexOf)
        addText(index: indexOf)
    }
    
    func addImage(index: Int) {
        imageView.image = model.arrayImages[index].image
    }
    func addText(index: Int) {
        label.text = model.arrayImages[index].text
    }
    
    func addBackBtn(btn: UIButton){
        btn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(btn)
        btn.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        btn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        btn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        btn.setTitle(" Back", for: .normal)
        btn.setTitleColor(.tintColor, for: .normal)
        btn.tintColor = .tintColor
        btn.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        
        btn.addTarget(self, action: #selector(dismis), for: .touchUpInside)
    }
    
    @objc func dismis(){
        dismiss(animated: true)
    }
    
    func addImageView(imageView: UIImageView, backBtn: UIButton){
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: backBtn.bottomAnchor, constant: 10).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true

        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        imageView.backgroundColor = .systemGray3
        
        imageView.clipsToBounds = true
        
        imageView.contentMode = .scaleAspectFill

    }
    
    func addLabel(label: UILabel, image: UIImageView) {
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        label.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        
        label.textAlignment = .center
        
        label.font = UIFont(name: "helvetica", size: 30)
        label.textColor = .black
        label.text = "Text is"
    }

}





