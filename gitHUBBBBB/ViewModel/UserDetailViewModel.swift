//
//  UserDetailViewModel.swift
//  gitHUBBBBB
//
//  Created by Admin on 17/03/23.
//

import Foundation

class UserDetailViewModel : NSObject {
    
    
    private(set) var UserDetailViewModel : Userdetails! {
        didSet {
            self.bindUserDetailViewModelToController()
        }
    }
    private(set) var error : String! {
        didSet {
            self.bindUserDetailErrorViewModelToController()
        }
    }
    
    var bindUserDetailViewModelToController : (() -> ()) = {}
    var bindUserDetailErrorViewModelToController : (() -> ()) = {}
     init(username : String?){
        super.init()
        self.userdetails(username: username ?? "")
        
    }
    
    func userdetails(username :String) {
        let getinfo: NetworkRouter = .userdetails(username: username)
        networkLayer.request(getinfo, type: Userdetails.self) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .sucess(let  model):
                print(model)
                self.UserDetailViewModel = model
            case .failure(let errorString):
                self.error = errorString
            }
        }
        
    }
    
}
