//
//  TransplantationListScene.swift
//  Asa
//
//  Created by Jehnsen Hirena Kane on 25/01/22.
//

import UIKit

class TransplantationListScene: UIViewController, SceneStoryboardLoadable {

    @IBOutlet weak var notificationOutlet: UIButton!
    @IBOutlet weak var profilePictureOutlet: UIButton!
    @IBOutlet weak var tableViewOutlet: UITableView!
    var transplantationListViewModel: TransplantationListViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        registerXIB()
    }
    
    @IBAction func notificationPressed(_ sender: Any) {
        tableViewOutlet.reloadData()
    }
    @IBAction func profilePicturePressed(_ sender: Any) {
    }
    
    
    func setupView() {
        profilePictureOutlet.setTitle("", for: .normal)
        notificationOutlet.setTitle("", for: .normal)
        
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
    }
    
    
    func registerXIB() {
        tableViewOutlet.register(UINib(nibName: TransplantationListTableViewCell.cellIdentifier(), bundle: nil), forCellReuseIdentifier: TransplantationListTableViewCell.cellIdentifier())
        tableViewOutlet.register(UINib(nibName: EmptyStateTableViewCell.cellIdentifier(), bundle: nil), forCellReuseIdentifier: EmptyStateTableViewCell.cellIdentifier())
        tableViewOutlet.register(UINib(nibName: NewRegistrationTableViewCell.cellIdentifier(), bundle: nil), forCellReuseIdentifier: NewRegistrationTableViewCell.cellIdentifier())
        tableViewOutlet.register(UINib(nibName: CallHelpTableViewCell.cellIdentifier(), bundle: nil), forCellReuseIdentifier: CallHelpTableViewCell.cellIdentifier())
        tableViewOutlet.register(UINib(nibName: TermsAndConditionsTableViewCell.cellIdentifier(), bundle: nil), forCellReuseIdentifier: TermsAndConditionsTableViewCell.cellIdentifier())
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TransplantationListScene: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return CGFloat(50)
//    }
//
    internal func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(0)
    }
//

    internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: EmptyStateTableViewCell.cellIdentifier()) else {
                return UITableViewCell()
            }
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NewRegistrationTableViewCell.cellIdentifier()) else {
                return UITableViewCell()
            }
            return cell
        } else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CallHelpTableViewCell.cellIdentifier()) else {
                return UITableViewCell()
            }
            return cell
        } else if indexPath.section == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TermsAndConditionsTableViewCell.cellIdentifier()) else {
                return UITableViewCell()
            }
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    
}
