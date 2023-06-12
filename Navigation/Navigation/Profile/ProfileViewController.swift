//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Sergey Bersenev on 07.06.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    private var profileHeaderView: ProfileHeaderView?

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        profileHeaderView = ProfileHeaderView ()
        profileHeaderView?.frame = CGRect(x: 0, y: 0, width: super.view.frame.width, height: super.view.frame.height)
        //profileHeaderView?.backgroundColor = .systemBlue
        if let profileHeaderView = profileHeaderView {
            view.addSubview(profileHeaderView)
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.lightGray
        title = "Profile"

    }
}
