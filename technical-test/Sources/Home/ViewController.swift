//
//  ViewController.swift
//  technical-test
//
//  Created by SWOOD on 04/11/2019.
//  Copyright © 2022 SWOOD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var interactor: HomeInteractor?
    var datas: [Response.Game] = [] {
        didSet {
            var cells: [HomeViewModel] = []
            datas.forEach { cells.append(HomeViewModel($0)) }
            datasCells = cells
            tableView.reloadData()
        }
    }

    var datasCells: [HomeViewModel] = []
    // MARK: - Life Cycle
    override func loadView() {
    super.loadView()
        self.interactor = HomeInteractor(presenter: HomePresenter(controller: self))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.interactor?.fetchDatas()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsVC = segue.destination as! DetailsViewController
        detailsVC.game = datasCells[tableView.indexPathForSelectedRow!.row].game
    }
}

// MARK: UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasCells.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell
        cell?.setup(datasCells[indexPath.row].game.name, imageSURL: datasCells[indexPath.row].game.background_image)
        return cell!
    }
    
}
