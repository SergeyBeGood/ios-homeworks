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
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var profileName: UILabel = {
        let label = UILabel()
        label.text = "Hipster Cat"
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.lineBreakMode = .byTruncatingMiddle
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var noteLabel: UILabel = {
        let label = UILabel()
        label.text = "Waiting for something..."
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
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
        addSubviews()
        layouts()

    }

    private func addSubviews(){
        addSubview(profileImage)
        addSubview(showStatusButton)
        addSubview(profileName)
        addSubview(noteLabel)
        addSubview(statusTextField)
    }

    required init?(coder: NSCoder){
        fatalError("Fatal Error")
    }


        private func layouts(){
            
            NSLayoutConstraint.activate([
                profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
                profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                profileImage.heightAnchor.constraint(equalToConstant: 100),
                profileImage.widthAnchor.constraint(equalToConstant: 100),

                profileName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
                profileName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
                profileName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                
                noteLabel.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 30),
                noteLabel.leadingAnchor.constraint(equalTo: profileName.leadingAnchor),
                noteLabel.trailingAnchor.constraint(equalTo: profileName.trailingAnchor),
                noteLabel.heightAnchor.constraint(equalToConstant: 50),

                statusTextField.topAnchor.constraint(equalTo: noteLabel.bottomAnchor, constant: 10),
                statusTextField.leadingAnchor.constraint(equalTo: profileName.leadingAnchor),
                statusTextField.trailingAnchor.constraint(equalTo: profileName.trailingAnchor),
                statusTextField.heightAnchor.constraint(equalToConstant: 50),
                
                showStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 15),
                showStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                showStatusButton.trailingAnchor.constraint(equalTo: statusTextField.trailingAnchor),
                showStatusButton.heightAnchor.constraint(equalToConstant: 50),
                showStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant:  -25),
                    
            ])
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



