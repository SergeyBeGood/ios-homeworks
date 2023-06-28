//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Sergey Bersenev on 28.06.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private let arrow: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image =  UIImage(systemName: "arrow.right")
        return imageView
    }()
    
    private let layerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let headerDT: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.text = "Фото"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let image1: UIImageView = {
        var imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let image2: UIImageView = {
        var imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let image3: UIImageView = {
        var imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "3")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let image4: UIImageView = {
        var imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "4")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        ыуегзСontraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
 
    }
    
    private func addSubviews(){
        contentView.addSubview(layerView)
        contentView.addSubview(image1)
        contentView.addSubview(image2)
        contentView.addSubview(image3)
        contentView.addSubview(image4)
        contentView.addSubview(headerDT)
        contentView.addSubview(arrow)
    }
    
    private func ыуегзСontraints() {
        let imageSize = (UIScreen.main.bounds.width - 50) / 4
        
        NSLayoutConstraint.activate([
            
            headerDT.topAnchor.constraint(equalTo: layerView.topAnchor ,constant: 12),
            headerDT.leadingAnchor.constraint(equalTo: layerView.leadingAnchor,constant: 12),
            
            
            layerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            layerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            layerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor ),
            layerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            
            image1.widthAnchor.constraint(equalToConstant: imageSize),
            image1.heightAnchor.constraint(equalToConstant: imageSize),
            image1.topAnchor.constraint(equalTo: headerDT.bottomAnchor,constant: 12),
            image1.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 10),
            
            image2.widthAnchor.constraint(equalToConstant: imageSize),
            image2.heightAnchor.constraint(equalToConstant: imageSize),
            image2.topAnchor.constraint(equalTo: headerDT.bottomAnchor,constant: 12),
            image2.leadingAnchor.constraint(equalTo: image1.trailingAnchor,constant: 10),
            
            image3.widthAnchor.constraint(equalToConstant: imageSize),
            image3.heightAnchor.constraint(equalToConstant: imageSize),
            image3.topAnchor.constraint(equalTo: headerDT.bottomAnchor,constant: 12),
            image3.leadingAnchor.constraint(equalTo: image2.trailingAnchor,constant: 10),
            
            image4.widthAnchor.constraint(equalToConstant: imageSize),
            image4.heightAnchor.constraint(equalToConstant: imageSize),
            image4.topAnchor.constraint(equalTo: headerDT.bottomAnchor,constant: 12),
            image4.leadingAnchor.constraint(equalTo: image3.trailingAnchor,constant: 10),
            image4.bottomAnchor.constraint(equalTo: layerView.bottomAnchor, constant: -12),
            
            arrow.widthAnchor.constraint(equalToConstant: 20),
            arrow.trailingAnchor.constraint(equalTo: layerView.trailingAnchor, constant: -15),
            arrow.centerYAnchor.constraint(equalTo: headerDT.centerYAnchor),
        
        ])
    }
}
