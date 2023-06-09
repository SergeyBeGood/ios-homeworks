//
//  PostViewController.swift
//  Navigation
//
//  Created by Sergey Bersenev on 05.06.2023.
//

import UIKit

class PostViewController: UIViewController {

    var post: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        title = "2023/06/07 Новый пост"

        let infoButton =
        UIBarButtonItem(title: "Info", style: .done, target: self, action: #selector(showsInfoView))
//        UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(showsInfoView))

        navigationItem.rightBarButtonItem = infoButton
    }

    @objc func showsInfoView() {
        let infoViewController = InfoViewController()
        present(infoViewController, animated: true)
        //navigationController?.pushViewController(infoViewController, animated: true)

    }
    

  //  override func viewDidLayoutSubviews() {
  //      super.viewDidLayoutSubviews()

  //      let postLabel = UILabel(frame: CGRect(x: 50, y: 100, width: 200, height: 30))
  //      postLabel.text = post
  //      view.addSubview(postLabel)
  //  }
}


