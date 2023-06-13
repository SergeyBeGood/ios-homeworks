//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Sergey Bersenev on 10.06.2023.
//
import UIKit

class ProfileHeaderView: UIView {

    private lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .systemGreen
        image.image = UIImage(named: "Hipster_Cat")
        image.layer.cornerRadius = image.frame.height/2
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 3
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()

    private lazy var showStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show Status", for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        return button
    }()

    private lazy var profileName: UILabel = {
        let label = UILabel()
        label.text = "Hipster Cat"
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.lineBreakMode = .byTruncatingMiddle
        return label
    }()


    private var noteLabel: UILabel = {
        let label = UILabel()
        label.text = "Waiting for something..."
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        return label
    }()

    override init (frame: CGRect){

        super.init(frame: frame)
        addSubview(profileImage)
        addSubview(showStatusButton)
        addSubview(profileName)
        addSubview(noteLabel)

    }


    required init?(coder: NSCoder){
        fatalError("Fatal Error")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        profileImage.frame = CGRect(
            x: 16,
            y: safeAreaInsets.top + 16,
            width: 100,
            height: 100
        )

        showStatusButton.frame = CGRect(
            x: 16,
            y: safeAreaInsets.top + 132,
            width: frame.width - 32,
            height: 50
        )

        profileName.frame = CGRect(
            x: 150,
            y: 120,
            width: 200,
            height:20
        )

        noteLabel.frame = CGRect(
            x: 130,
            y: 170,
            width: 200,
            height: 20
        )
    }

    @objc func tapButton() {
        print ("Check Your Status")
    }
}

