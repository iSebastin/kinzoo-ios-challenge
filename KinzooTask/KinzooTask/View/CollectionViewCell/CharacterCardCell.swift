//
//  CharacterCardCell.swift
//  KinzooTask
//
//  Created by Victor Sebastian on 2023-10-27.
//

import UIKit
import SDWebImage

final class CharacterCardCell: UICollectionViewCell {
    
    private var bgView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    private var profileImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        return img
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.font = .signika(.regular, size: 16)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    static var cellID: String =  {
        return "CharacterCardCellID"
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
        createConstrains()
    }
    
    private func createSubviews() {
        addSubview(bgView)
        bgView.addSubview(profileImageView)
        bgView.addSubview(nameLabel)
    }
    
    private func createConstrains() {
        //bgView
        bgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        bgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        bgView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        bgView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        
        //profileImageView
        profileImageView.topAnchor.constraint(equalTo: bgView.topAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalTo: bgView.widthAnchor).isActive = true
        profileImageView.heightAnchor.constraint(equalTo: bgView.heightAnchor, multiplier: 0.7).isActive = true
        
        //nameLabel
        nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 5).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo:profileImageView.leadingAnchor, constant: 5).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: -5).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
    }
    
    func setupData(with model: CartoonCharacter?) {
        //profileImageView
        if let imageURL = model?.image {
            profileImageView.sd_setImage(with: URL(string: imageURL)!, placeholderImage: UIImage(named: "placeholder"))
        }
        
        //nameLabel
        nameLabel.text = model?.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

