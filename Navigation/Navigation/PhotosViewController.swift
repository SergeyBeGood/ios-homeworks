//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Sergey Bersenev on 28.06.2023.
//

import UIKit

class PhotosViewController: UIViewController {
 
    private let dataBaseImages = CollectionData.generatetCV()

    private var initialImagePozition: CGRect = .zero
    private let whiteWrap: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = .white
        view.alpha = 0
        return view
    }()
    
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 40, y: 210, width: 40, height: 40))
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.tintColor = .black
        button.alpha = 0
        button.addTarget(self, action: #selector(crossButtonAction), for: .touchUpInside)
        return button
    }()
    private let animatingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.register(
            PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = false
        
        addSubviews()
        contraints()
        
        title = "Галерея"
    }
    
    private func addSubviews(){
        view.addSubview(collectionView)

    }
    @objc private func crossButtonAction() {
        animateImageToInitial(rect: initialImagePozition)
    }
    
    private func animateImageToInitial(rect: CGRect) {
        UIView.animate(withDuration: 0.6) {
            self.whiteWrap.alpha = 0
            self.animatingImageView.frame = rect
            self.animatingImageView.layer.cornerRadius = 0
        } completion: { _ in
            self.animatingImageView.removeFromSuperview()
            self.closeButton.alpha = 0
            self.whiteWrap.removeFromSuperview()
        }
    }
    
    private func contraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func animateToBigImage(_ image: UIImage?, imageFrame: CGRect) {
        view.addSubview(whiteWrap)
        view.addSubview(closeButton)
        view.addSubview(animatingImageView)
        animatingImageView.image = image
        animatingImageView.alpha = 1.0
        animatingImageView.frame = CGRect(x: imageFrame.origin.x,
                                          y: imageFrame.origin.y,
                                          width: imageFrame.width,
                                          height: imageFrame.height)
        
        UIView.animate(withDuration: 0.6) {
            self.whiteWrap.alpha = 0.5
            self.animatingImageView.frame.size = CGSize(width: UIScreen.main.bounds.width,
                                                        height: UIScreen.main.bounds.width)
            self.animatingImageView.center = self.view.center
            self.animatingImageView.layer.cornerRadius = UIScreen.main.bounds.width / 2
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.closeButton.alpha = 1
            }
        }
    }
    
        
    
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        CollectionData.generatetCV().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        
        cell.setIndexPath(indexPath)
        cell.delegate = self
        cell.setupCell(model: dataBaseImages[indexPath.row])

        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    private var inset: CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - inset * 4) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
}


extension PhotosViewController: CustomCellDelegate {
    func clickToImage(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath) {
      
        let rectItem = collectionView.layoutAttributesForItem(at: indexPath)
        
        let rectInSuperView = collectionView.convert(rectItem?.frame ?? .zero, to: collectionView.superview)
        
        initialImagePozition = CGRect(x: frameImage.origin.x + rectInSuperView.origin.x,
                                  y: frameImage.origin.y + rectInSuperView.origin.y,
                                  width: frameImage.width,
                                  height: frameImage.height)
        
        animateToBigImage(image, imageFrame: initialImagePozition)
    }
}
