//
//  UpcomingViewController.swift
//  NetflixClone
//
//  Created by Suheon Song on 2023/02/14.
//

import UIKit

final class UpcomingViewController: UIViewController {
    
    private var titles: [Title] = []
    
    private let upcomingTable: UITableView = {
        let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Upcoming"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        view.addSubview(upcomingTable)
        upcomingTable.delegate = self
        upcomingTable.dataSource = self
        fetchUpcoming()
        //        applyConstraint()
    }
    
//    private func applyConstraint() {

//        let tableViewConstraints = [
//            upcomingTable.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
//            upcomingTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
//            upcomingTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
//            upcomingTable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
//        ]
//        NSLayoutConstraint.activate(tableViewConstraints)
//    }
    
    override func viewDidLayoutSubviews() {
        upcomingTable.frame = view.bounds
    }
    
    private func fetchUpcoming() {
        APICaller.shared.getUpcomingMovies {[weak self] result in
            switch result {
            case .success(let titles):
                self?.titles = titles
                DispatchQueue.main.async {
                    self?.upcomingTable.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension UpcomingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else {
            return UITableViewCell()
        }
        let title = titles[indexPath.row]
        let titleName = title.original_title ?? title.original_name ?? "Unkown"
        let posterURL = title.poster_path ?? ""
        let titleViewModel = TitleViewModel(titleName: titleName, posterURL: posterURL)
        cell.configure(with: titleViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
}
