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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func notificationPressed(_ sender: Any) {
    }
    @IBAction func profilePicturePressed(_ sender: Any) {
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
