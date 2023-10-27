//
//  ViewController.swift
//  KinzooTask
//
//  Created by Victor Sebastian on 2023-10-27.
//

import UIKit
import SDWebImage

final class CharactersViewController: UIViewController {
    
    private var collectionview: UICollectionView!
    private var characters: [CartoonCharacter]?
    private let presenter = CharacterPresenter()
    
    private var flowLayout: UICollectionViewFlowLayout {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: (view.frame.size.width/3)-4, height: (view.frame.size.height/5)-4)
        return layout
    }
    
    private var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.color = .white
        spinner.isHidden = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightCoral
        
        //Views
        setupNavigation()
        createSubviews()
        createConstrains()
        
        //Presenter
        presenter.setViewDelegate(delegate: self)
        
        //API
        fetchCharactersAPI()
    }
    
    private func createSubviews() {
        // collectionview
        collectionview = UICollectionView(frame: self.view.frame, collectionViewLayout: flowLayout)
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(CharacterCardCell.self, forCellWithReuseIdentifier: CharacterCardCell.cellID)
        collectionview.showsVerticalScrollIndicator = false
        collectionview.backgroundColor = UIColor.lightCoral
        self.view.addSubview(collectionview)
        
        //spinner
        self.view.addSubview(spinner)
    }
    
    private func createConstrains() {
        //spinner
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func setupNavigation() {
        title = "Characters"
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont.signika(.semiBold, size: 22)]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont.signika(.semiBold, size: 35)]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }
    
    deinit {
        debugPrint("CharactersViewController Deinit")
    }
}

extension CharactersViewController: UICollectionViewDelegate, UICollectionViewDataSource, CharacterPresenterDelegate {

    private func fetchCharactersAPI() {
        startLoading()
        presenter.getCharacters()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: CharacterCardCell.cellID, for: indexPath) as! CharacterCardCell
        cell.setupData(with: characters?[indexPath.row])
        return cell
    }
    
    func presentCharacters(with result: Result<[CartoonCharacter], Error>) {
        switch result {
        case .success(let result):
            self.characters = result
        case .failure(let error):
            debugPrint(error.localizedDescription)
        }
        finishLoading()
    }
    
    private func startLoading() {
        collectionview.isHidden = true
        spinner.isHidden = false
        spinner.startAnimating()
    }
    
    private func finishLoading() {
        DispatchQueue.main.async { [weak self] in
            self?.collectionview.reloadData()
            self?.collectionview.isHidden = false
            self?.spinner.isHidden = true
            self?.spinner.stopAnimating()
        }
    }
}

