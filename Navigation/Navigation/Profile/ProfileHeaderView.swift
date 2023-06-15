//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Sergey Bersenev on 10.06.2023.
//
import UIKit

class ProfileHeaderView: UIView {

    private var statusLabel: String = ""

    private lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .systemGreen
        image.image = UIImage(named: "Hipster_Cat")
        image.layer.cornerRadius = 50
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 3
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
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

    private lazy var statusTextField: UITextField = {
        let textField = UITextField()    //
        textField.backgroundColor = .white //
        textField.layer.borderColor = UIColor.black.cgColor //
        textField.layer.borderWidth = 1.0 //
        textField.layer.cornerRadius = 12 //
        textField.textColor = .black
        textField.textAlignment = .left
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.placeholder = "Enter your status..."
        textField.textAlignment = .center
        textField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    override init (frame: CGRect){

        super.init(frame: frame)
        addSubview(profileImage)
        addSubview(showStatusButton)
        addSubview(profileName)
        addSubview(noteLabel)
        addSubview(statusTextField)

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
            y: safeAreaInsets.top + 155,
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

        statusTextField.frame = CGRect(
            x: 130,
            y: 200,
            width: 250,
            height: 40)
    }


    @objc func tapButton() {
        noteLabel.text = statusLabel
           if noteLabel.text  == "" {
               noteLabel.text = "Enter the status..."
           }
       }

       @objc func statusTextChanged(_ textField: UITextField) {
           if let noteLabel = textField.text {
               statusLabel = noteLabel
           }
       }
}


