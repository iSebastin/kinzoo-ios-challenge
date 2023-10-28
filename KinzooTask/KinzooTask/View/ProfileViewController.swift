//
//  ProfileViewController.swift
//  KinzooTask
//
//  Created by Victor Sebastian on 2023-10-27.
//

import UIKit

final class ProfileVC: UIViewController {
    private var character: CartoonCharacter?
    
    private var bgView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
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
        label.lineBreakMode = .byWordWrapping
        label.font = .signika(.regular, size: 30)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private var typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .signika(.medium, size: 15)
        label.textColor = .black
        return label
    }()
    
    private var speciesSubview: ProfileContentSubview = {
        let view = ProfileContentSubview()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var statusSubview: ProfileContentSubview = {
        let view = ProfileContentSubview()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var genderSubview: ProfileContentSubview = {
        let view = ProfileContentSubview()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var originSubview: ProfileContentSubview = {
        let view = ProfileContentSubview()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var episodesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .signika(.semiBold, size: 20)
        button.layer.cornerRadius = 10.0
        button.backgroundColor = UIColor.lightCoral
        return button
    }()
    
    init(character: CartoonCharacter? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.character = character
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .lightCoral
        setupNavigation()
        createSubviews()
        createConstrains()
        setupData()
    }
    
    func createSubviews() {
        view.addSubview(profileImageView)
        view.addSubview(bgView)
        bgView.addSubview(nameLabel)
        bgView.addSubview(typeLabel)
        bgView.addSubview(statusSubview)
        bgView.addSubview(speciesSubview)
        bgView.addSubview(genderSubview)
        bgView.addSubview(originSubview)
        bgView.addSubview(episodesButton)
    }
    
    func createConstrains() {
        
        //profileImageView
        profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        profileImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: view.frame.size.height/2).isActive = true
        
        //bgView
        bgView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: -10).isActive = true
        bgView.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor).isActive = true
        bgView.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor).isActive = true
        bgView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20).isActive = true
        
        //nameLabel
        nameLabel.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 20).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 20).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -20).isActive = true
        
        //typeLabel
        typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        typeLabel.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor).isActive = true
        
        //statusSubview
        statusSubview.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 20).isActive = true
        statusSubview.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 30).isActive = true
        statusSubview.widthAnchor.constraint(equalToConstant: self.view.frame.size.width/2 - 35).isActive = true
        statusSubview.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        
        //genderSubview
        genderSubview.topAnchor.constraint(equalTo: statusSubview.topAnchor).isActive = true
        genderSubview.leadingAnchor.constraint(equalTo: statusSubview.trailingAnchor, constant: 20).isActive = true
        genderSubview.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -20).isActive = true
        genderSubview.heightAnchor.constraint(equalTo: statusSubview.heightAnchor).isActive = true
        
        //speciesSubview
        speciesSubview.topAnchor.constraint(equalTo: statusSubview.bottomAnchor, constant: 10).isActive = true
        speciesSubview.leadingAnchor.constraint(equalTo: statusSubview.leadingAnchor).isActive = true
        speciesSubview.trailingAnchor.constraint(equalTo: statusSubview.trailingAnchor).isActive = true
        speciesSubview.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        
        //originSubview
        originSubview.topAnchor.constraint(equalTo: speciesSubview.topAnchor).isActive = true
        originSubview.leadingAnchor.constraint(equalTo: genderSubview.leadingAnchor).isActive = true
        originSubview.trailingAnchor.constraint(equalTo: genderSubview.trailingAnchor).isActive = true
        originSubview.heightAnchor.constraint(equalTo: speciesSubview.heightAnchor).isActive = true
        
        //episodesButton
        episodesButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        episodesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        episodesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        episodesButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupData() {
        
        //profileImageView
        if let imageURL = character?.image {
            profileImageView.sd_setImage(with: URL(string: imageURL)!, placeholderImage: UIImage(named: "placeholder"))
        }
        
        //nameLabel
        nameLabel.text = character?.name
        
        //typeLabel
        typeLabel.text = character?.type
        
        //statusSubview
        statusSubview.setupData(title: "Status", subTitle: character?.status.rawValue ?? "N/A")
        
        //genderSubview
        genderSubview.setupData(title: "Gender", subTitle: character?.gender.rawValue ?? "N/A")
        
        //speciesSubview
        speciesSubview.setupData(title: "Species", subTitle: character?.species.rawValue ?? "N/A")
        
        //speciesSubview
        originSubview.setupData(title: "Origin", subTitle: character?.origin.name ?? "N/A")
        
        //episodesButton
        if let count = character?.episode.count {
            let episodeStr = count > 1 ? "Episodes" : "Episode"
            episodesButton.setTitle("See \(count) \(episodeStr)", for: .normal)
        } else {
            episodesButton.setTitle("No Episodes Available", for: .normal)
        }
        episodesButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        
    }
    
    func setupNavigation() {
        title = "Profile"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .lightCoral
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.signika(.semiBold, size: 22)]
        appearance.buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.signika(.semiBold, size: 20)]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = .white
    }
    
    @objc func buttonAction(sender: UIButton!) {
        if let episodes = character?.episode {
            let detailVC = EpisodesViewController(episodes: episodes)
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
