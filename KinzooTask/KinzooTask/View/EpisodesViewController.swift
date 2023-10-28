//
//  EpisodesViewController.swift
//  KinzooTask
//
//  Created by Victor Sebastian on 2023-10-28.
//

import UIKit

final class EpisodesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var episodes: [String]
    
    private var episodesTableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    init(episodes: [String]) {
        self.episodes = episodes
        super.init(nibName: nil, bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        createSubviews()
        createConstrains()
    }
    
    private func createSubviews() {
        episodesTableView.delegate = self
        episodesTableView.dataSource = self
        episodesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        view.addSubview(episodesTableView)
    }
    
    private func createConstrains() {
        //episodesTableView
        episodesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        episodesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        episodesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        episodesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupNavigation() {
        title = "Episodes"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .lightCoral
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.signika(.semiBold, size: 22)]
        appearance.buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.signika(.semiBold, size: 20)]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = .white
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel?.text = getEpisodeTitle(episode: episodes[indexPath.row])
        cell.textLabel?.font = UIFont.signika(.regular, size: 18)
        return cell
    }
    
    private func getEpisodeTitle(episode: String) -> String {
        if let number = episode.components(separatedBy: "/").last {
            return "Episode \(number)"
        }
        return ""
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
