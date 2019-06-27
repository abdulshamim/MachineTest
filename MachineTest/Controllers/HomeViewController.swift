//
//  HomeViewController.swift
//  MachineTest
//
//  Created by Abdul Shamim on 26/06/19.
//  Copyright © 2019 Abdul Shamim. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var nodataFoundLabel: UILabel!
    
    var userDataManager = UserDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.nodataFoundLabel.text = ""
        self.configuredTable()
        self.registerNib()
        self.activityIndicator.startAnimating()
        self.userDataManager.fetchData() { [weak self] (isSuccess) in
            if isSuccess {
                DispatchQueue.main.async {
                    self?.activityIndicator.stopAnimating()
                    self?.activityIndicator.isHidden = true
                    self?.nodataFoundLabel.text = ""
                    self?.tableView.reloadData()
                }
            } else {
                self?.nodataFoundLabel.text = "No data found"
            }
        }
    }

    
    func registerNib(){
        self.tableView.register( UINib(nibName: "RecommendedCell", bundle: Bundle.main), forCellReuseIdentifier:  "RecommendedCell")
        self.tableView.register( UINib(nibName: "TopDevelopersCell", bundle: Bundle.main), forCellReuseIdentifier:  "TopDevelopersCell")
        self.tableView.register( UINib(nibName: "PreSaleViewCell", bundle: Bundle.main), forCellReuseIdentifier:  "PreSaleViewCell")
        self.tableView.register( UINib(nibName: "PopularProjectsCell", bundle: Bundle.main), forCellReuseIdentifier:  "PopularProjectsCell")
        self.tableView.register( UINib(nibName: "FeaturedLocalitiesCell", bundle: Bundle.main), forCellReuseIdentifier:  "FeaturedLocalitiesCell")
        self.tableView.register( UINib(nibName: "BlogsCell", bundle: Bundle.main), forCellReuseIdentifier:  "BlogsCell")
        
    }
    
    func configuredTable() {
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 100
        self.tableView.separatorStyle = .none
    }
}


extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return SectionType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch SectionType(rawValue: section)  {
        case .recommended?:
            return self.userDataManager.recommended.count > 0 ? 1 : 0
        case .top_developers?:
            return self.userDataManager.top_developers.count > 0 ? 1 : 0
        case .pre_sale?:
            return self.userDataManager.pre_sale.count > 0 ? 1 : 0
        case .popular_projects?:
            return self.userDataManager.popular_projects.count > 0 ? 1 : 0
        case .featured_localities?:
            return self.userDataManager.featured_localities.count > 0 ? 1 : 0
        case .blogs?:
            return self.userDataManager.blogs.count > 0 ? 1 : 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch SectionType(rawValue: indexPath.section) {
        case .recommended?:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendedCell", for: indexPath) as? RecommendedCell else {
                fatalError("cell not found")
            }
            cell.setUp(data: self.userDataManager.recommended)
            return cell
        case .top_developers?:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TopDevelopersCell", for: indexPath) as? TopDevelopersCell else {
                fatalError("cell not found")
            }
            cell.setUp(data: self.userDataManager.top_developers)
            return cell
        case .pre_sale?:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PreSaleViewCell", for: indexPath) as? PreSaleViewCell else {
                fatalError("cell not found")
            }
            cell.setUp(data: self.userDataManager.pre_sale)
            return cell
        case .popular_projects?:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PopularProjectsCell", for: indexPath) as? PopularProjectsCell else {
                fatalError("cell not found")
            }
            cell.setUp(data: self.userDataManager.popular_projects)
            return cell
        case .featured_localities?:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeaturedLocalitiesCell", for: indexPath) as? FeaturedLocalitiesCell else {
                fatalError("cell not found")
            }
            cell.setUp(data: self.userDataManager.featured_localities)
            return cell
        case .blogs?:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BlogsCell", for: indexPath) as? BlogsCell else {
                fatalError("cell not found")
            }
            cell.setUp(data: self.userDataManager.blogs)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch SectionType(rawValue: section) {
        case .recommended?:
            return self.userDataManager.recommended.count > 0 ?  "Recommended" : ""
        case .top_developers?:
             return self.userDataManager.recommended.count > 0 ?  "Top Developers" : ""
        case .pre_sale?:
            return self.userDataManager.recommended.count > 0 ?  "Pre-Sales" : ""
        case .popular_projects?:
            return self.userDataManager.recommended.count > 0 ?  "Popular Projects" : ""
        case .featured_localities?:
            return self.userDataManager.recommended.count > 0 ?  "Featured  Localities" : ""
        case .blogs?:
            return self.userDataManager.recommended.count > 0 ?  "Our blogs and Articles" : ""
        default:
            return ""
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch SectionType(rawValue: indexPath.section) {
        case .recommended?:
            return 250
        case .top_developers? ,.blogs?:
            return 240
        case .pre_sale?:
            return 200
        case .popular_projects?:
            return 135
        case .featured_localities?:
            return 100
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }

}
