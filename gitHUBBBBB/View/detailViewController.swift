//
//  detailViewController.swift
//  gitHUBBBBB
//
//  Created by Admin on 17/03/23.
//

import UIKit

class detailViewController: UIViewController {

    var updatedate : String = ""
    @IBOutlet weak var profileimage: UIImageView!
    
    @IBOutlet weak var backbutton: UIButton!
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var locationlbl: UILabel!
    
    @IBOutlet weak var usernamelbl: UILabel!
    
    @IBOutlet weak var followerslbl: UILabel!
    
    @IBOutlet weak var lastupdatelbl: UILabel!
    
    @IBOutlet weak var publicreposlbl: UILabel!
    
    @IBOutlet weak var publicgists: UILabel!
   var image = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        profileimage.layer.borderWidth = 1.0
        profileimage.layer.masksToBounds = false
        profileimage.layer.borderColor = UIColor.white.cgColor
        profileimage.layer.cornerRadius = profileimage.frame.size.width/2
        profileimage.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func backbtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
    }
}
