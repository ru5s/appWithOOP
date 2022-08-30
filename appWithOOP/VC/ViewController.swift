//
//  ViewController.swift
//  appWithOOP
//
//  Created by Ruslan Ismailov on 26/08/22.
//

import UIKit

protocol ProtocolViewController {
    
}

class ViewController: UIViewController {
    
    var tableView: UITableView!
    
    var secondView = SecondViewController()
    
    let model: ModelProtocol = Model()
    
    var presenter: ProtocolPresenterVC!

    let assambly: VCRouterAssemblyProtocol = VCRouterAssembly()
    
    var indexCellForPresenter: Int = 3
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        assambly.configureView(view: self)
        
        secondView = SecondViewController()
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 500))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        
        addTableView(myView: tableView)
        
        tableView.separatorColor = .white
        
        tableView.reloadData()
        
    }
    
    func addTableView(myView: UITableView){
        myView.translatesAutoresizingMaskIntoConstraints = false

        myView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        myView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        myView.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
    }
    
    
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.arrayImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let cellButton = UIButton()
        let imageView = UIImageView()
        let textLabel = UILabel()
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.addSubview(cellButton)
        cellButton.tag = indexPath.row
        
        addTextLabelToCell(textLabel: textLabel, cell: cell, indexPath: indexPath)
        addImageToCell(imageView: imageView, cell: cell, indexPath: indexPath)
        addButtonToCell(cellButton: cellButton, cell: cell, indexPath: indexPath)
        
        return cell
    }
    
    func addTextLabelToCell(textLabel: UILabel, cell: UITableViewCell, indexPath: IndexPath){
        cell.textLabel?.text = model.arrayImages[indexPath.row].text
        cell.textLabel?.translatesAutoresizingMaskIntoConstraints = false
        cell.textLabel?.leftAnchor.constraint(equalTo: cell.imageView!.rightAnchor, constant: 20).isActive = true
        cell.textLabel?.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
        cell.textLabel?.textColor = .black
        cell.textLabel?.font = UIFont(name: "helvetica", size: 30)
    }
    
    func addImageToCell(imageView: UIImageView, cell: UITableViewCell, indexPath: IndexPath){
        cell.imageView?.image = model.arrayImages[indexPath.row].image
        cell.imageView?.translatesAutoresizingMaskIntoConstraints = false
        cell.imageView?.heightAnchor.constraint(equalToConstant: 80).isActive = true
        cell.imageView?.widthAnchor.constraint(equalToConstant: 80).isActive = true
        cell.imageView?.topAnchor.constraint(equalTo: cell.topAnchor, constant: 10).isActive = true
        cell.imageView?.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 20).isActive = true
    }
    
    func addButtonToCell(cellButton: UIButton, cell: UITableViewCell, indexPath: IndexPath) {
        cellButton.translatesAutoresizingMaskIntoConstraints = false
        cellButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        cellButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        cellButton.rightAnchor.constraint(equalTo: cell.rightAnchor, constant: -20).isActive = true
        cellButton.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
        cellButton.layer.opacity = 0.6
        cellButton.backgroundColor = .tintColor
        cellButton.layer.cornerRadius = 5
       
        cellButton.setTitle("Open", for: .normal)
        cellButton.addTarget(self, action: #selector(touchedBtnCell(sender:)), for: .touchUpInside)
        
    }
    
    @objc func touchedBtnCell(sender: UIButton){
        let indexCell = sender.tag
        indexCellForPresenter = sender.tag
        
//        secondView.imageView.image = model.arrayImages[indexCell].image
//        secondView.label.text = model.arrayImages[indexCell].text
        
        presenter?.addImage(index: indexCell)
        presenter?.addText(index: indexCell)
        presenter.openPhotoPage()


//        secondView.modalTransitionStyle = .crossDissolve
//        secondView.modalPresentationStyle = .fullScreen
        
//        present(secondView, animated: true)
        
    }
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        tableView.deselectRow(at: indexPath, animated: false)
//        secondView.imageView.image = model.arrayImages[indexPath.row].image
//        secondView.label.text = model.arrayImages[indexPath.row].text
//        tableView.reloadData()
//        present(secondView, animated: true)
//    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title: String!
        title = "Choose photo"
        return title
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    
}

extension ViewController: ProtocolViewController{
    
}
