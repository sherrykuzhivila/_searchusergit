//
//  ViewController.swift
//  gitHUBBBBB
//
//  Created by Admin on 16/03/23.
//

import UIKit

class ViewController: UIViewController {
    var userdata : UserDetailViewModel!
    @IBOutlet weak var searchtextfield: UITextField!
    
   
    @IBOutlet weak var searchbutton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func SearchUser(_ sender: Any) {
        searchresult(username: searchtextfield.text ?? "")
    }
    func searchresult(username : String){
        self.userdata = UserDetailViewModel(username: searchtextfield.text ?? "")
        self.userdata.bindUserDetailViewModelToController = {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "detailViewController") as! detailViewController
                    vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true)
            vc.namelabel.text = "Name : \(self.userdata.UserDetailViewModel.name ?? "")"
            setImage(from: self.userdata.UserDetailViewModel.avatar_url ?? "")
            func setImage(from url: String) {
                guard let imageURL = URL(string: url) else { return }

                // just not to cause a deadlock in UI!
            DispatchQueue.global().async {
                guard let imageData = try? Data(contentsOf: imageURL) else { return }

                let image = UIImage(data: imageData)
                DispatchQueue.main.async {
                    vc.profileimage.image = image
                }
            }
        }
            vc.publicreposlbl.text = "Public_repos :   \(self.userdata.UserDetailViewModel.public_repos ?? 0)"
            vc.publicgists.text = "Public_gists : \(self.userdata.UserDetailViewModel.public_gists ?? 0)"
            vc.followerslbl.text = "Followers :  \(self.userdata.UserDetailViewModel.followers ?? 0)"
            vc.lastupdatelbl.text = String("Date : \(self.userdata.UserDetailViewModel.updated_at!)".prefix(17))
            vc.usernamelbl.text = "User_name : \(self.userdata.UserDetailViewModel.login ?? "")"
            vc.locationlbl.text = "Location : \(self.userdata.UserDetailViewModel.location ?? "not updated")"

        }
        print(self.userdata ?? "")
        self.userdata.bindUserDetailErrorViewModelToController = {
            self.alert(view: self, title: "Alert", message: "username not found")
        }
        
       
    }
    //Alert
    func alert(view: UIViewController, title: String, message: String) {
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           let defaultAction = UIAlertAction(title: "OK", style: .default, handler: { action in
           })
           alert.addAction(defaultAction)
           DispatchQueue.main.async(execute: {
               view.present(alert, animated: true)
           })
       }
    
}


