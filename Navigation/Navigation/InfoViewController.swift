//
//  InfoViewController.swift
//  Navigation
//
//  Created by Sergey Bersenev on 05.06.2023.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = UIColor.systemTeal
    title = "InfoView"

    let alertButton = UIButton(type: .system)
    alertButton.frame = CGRect(origin: CGPoint(x: 30, y: 100), size: CGSize(width: 300, height: 30))
    alertButton.setTitle("Сообщить об ошибке", for: .normal)
    alertButton.backgroundColor = .systemGray6
        view.addSubview(alertButton)
    alertButton.addTarget(self, action: #selector(errorShowDetails), for: .touchUpInside)

    }

    @objc func errorShowDetails() {
        let alert = UIAlertController (title: "Errors", message:  "Do You have any errors?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: {action in print("Errors are not found")}))
        alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: {action in print("Resolve Massage will be come soon! Thanks")}))

        self.present(alert, animated: true)
    }

}
