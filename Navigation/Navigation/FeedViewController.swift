//
//  FeedViewController.swift
//  Navigation
//
//  Created by Sergey Bersenev on 05.06.2023.
//

import UIKit

var postTittle = Post(tittle: "Название статьи")

class FeedViewController: UIViewController {

    //private var textField: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        title = "Feed"
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

      //  textField = UITextField()
      //  textField?.frame = CGRect(origin: CGPoint(x:30, y:200), size: CGSize(width: 300, height: 30))
      //  textField?.backgroundColor = .systemGray5
      //  view.addSubview(textField!)

        let button = UIButton(type: .system)
        button.frame = CGRect(origin: CGPoint(x: 30, y: 100), size: CGSize(width: 150, height: 30))
        button.setTitle("Ссылка на пост", for: .normal)
        button.backgroundColor = .systemGray6
        view.addSubview(button)
        button.addTarget(self, action: #selector(showDetails), for: .touchUpInside)
    }

    @objc func showDetails() {
        let postViewController = PostViewController()
     //   postViewController.post = textField?.text
        //present(postViewController, animated: true)
        navigationController?.pushViewController(postViewController, animated: true)
    }
}
