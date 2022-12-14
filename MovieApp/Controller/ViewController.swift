//
//  ViewController.swift
//  MovieApp
//
//  Created by mert Kanak on 14.12.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    var myMovies: [Movie]? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    let tableView = UITableView()

    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        configureTableView()
        
        let movieManager = MovieManager()
        movieManager.fetchMovies { (movies) in
            DispatchQueue.main.async { [self] in
                navigationItem.title = movies.title
            }
            self.myMovies = movies.movies
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    // MARK: - Helpers
    
    func configureTableView() {
        tableView.backgroundColor = .lightGray
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MovieCell")
        
    }

    // MARK: - UITableViewDelegate & DataSource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myMovies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        cell.backgroundColor = .lightGray
        
        guard let movie = myMovies?[indexPath.row] else {return UITableViewCell()}
        cell.textLabel?.text = "\(movie.title) - \(movie.releaseYear)"
        return cell
    }
}

