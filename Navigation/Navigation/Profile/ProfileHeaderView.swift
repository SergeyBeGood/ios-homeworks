//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Sergey Bersenev on 10.06.2023.
//
import UIKit

class ProfileHeaderView: UIView {

    let showStatusButton: UIButton
    let profileImage: UIImageView
    let profileName: UILabel
    let noteLabel: UILabel
    

    override init (frame: CGRect){
        profileImage = UIImageView()
        profileImage.backgroundColor = .systemGreen
        showStatusButton = UIButton()
        showStatusButton.backgroundColor = .systemBlue
        profileName = UILabel()
        noteLabel = UILabel()


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
        profileImage.image = UIImage(named: "Hipster_Cat")
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.layer.borderWidth = 3
        profileImage.clipsToBounds = true
        profileImage.contentMode = .scaleAspectFill


        showStatusButton.frame = CGRect(
            x: 16,
            y: safeAreaInsets.top + 132,
            width: frame.width - 32,
            height: 50
        )
        showStatusButton.setTitle("Show Status", for: .normal)
        showStatusButton.layer.cornerRadius = 4
        showStatusButton.layer.shadowRadius = 4
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOpacity = 0.7
        showStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        showStatusButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)

        profileName.frame = CGRect(
            x: 150,
            y: 120,
            width: 200,
            height:20
        )
        profileName.text = "Hipster Cat"
        profileName.adjustsFontSizeToFitWidth = true
        profileName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        profileName.textColor = .black
        profileName.lineBreakMode = .byTruncatingMiddle

        noteLabel.frame = CGRect(
            x: 130,
            y: 170,
            width: 200,
            height: 20
        )
        noteLabel.text = "Waiting for something..."
        profileName.adjustsFontSizeToFitWidth = true
        noteLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        noteLabel.textColor = .gray


    }

    @objc func tapButton() {
        print ("Check Your Status")
    }
}

