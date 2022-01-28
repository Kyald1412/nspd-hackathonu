//
//  TransplantationDetailScene.swift
//  Asa
//
//  Created by Jehnsen Hirena Kane on 28/01/22.
//

import UIKit

class TransplantationDetailScene: UIViewController, SceneStoryboardLoadable {
    
    @IBOutlet weak var progressBanner: UIImageView!
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var pageControlOutlet: UIPageControl!
    
    var transplantationDetailViewModel: TransplantationDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXIB()
        setupView()
    }
    
    private func setupView() {
        progressBanner.image = UIImage(named: "bannerRegistrasi.png")
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
    }
    
    private func registerXIB() {
        tableViewOutlet.register(UINib(nibName: TransplantationDetailTableViewCell.cellIdentifier(), bundle: nil), forCellReuseIdentifier: TransplantationDetailTableViewCell.cellIdentifier())
    }
}

extension TransplantationDetailScene: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 4 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TransplantationDetailTableViewCell.cellIdentifier()) as? TransplantationDetailTableViewCell else {
                return UITableViewCell()
            }
            cell.thirdLabel.isHidden = true
            cell.statusImg.isHidden = true
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TransplantationDetailTableViewCell.cellIdentifier()) else {
                return UITableViewCell()
            }
            return cell
        }
    }
    
    internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    internal func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(0)
    }
    
}

extension TransplantationDetailScene: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

//extension TransplantationListScene: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.section == 0 {
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: EmptyStateTableViewCell.cellIdentifier()) else {
//                return UITableViewCell()
//            }
//            return cell
//        } else if indexPath.section == 1 {
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: NewRegistrationTableViewCell.cellIdentifier()) else {
//                return UITableViewCell()
//            }
//            return cell
//        } else if indexPath.section == 2 {
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: CallHelpTableViewCell.cellIdentifier()) else {
//                return UITableViewCell()
//            }
//            return cell
//        } else if indexPath.section == 3 {
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: TermsAndConditionsTableViewCell.cellIdentifier()) else {
//                return UITableViewCell()
//            }
//            return cell
//        } else {
//            return UITableViewCell()
//        }
//    }
//}
