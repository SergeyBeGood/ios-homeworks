//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Sergey Bersenev on 28.06.2023.
//

import UIKit

protocol CustomCellDelegate: AnyObject {
    func clickToImage(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath)
}

final class PhotosCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: CustomCellDelegate?
    private var indexPathCell = IndexPath()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapToImage)))
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        addSubviews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
    }
    

    func setIndexPath(_ indexPath: IndexPath) {
        indexPathCell = indexPath
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func setupCell(model: CollectionData) {
        imageView.image = UIImage(named: model.image)
    }
    
    
    private func addSubviews(){
        contentView.addSubview(imageView)
    }
    
    @objc private func tapToImage() {
        delegate?.clickToImage(imageView.image, frameImage: imageView.frame, indexPath: indexPathCell)
    }
}
