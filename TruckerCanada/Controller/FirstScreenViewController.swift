//
//  ViewController.swift
//  TruckerCanada
//
//  Created by Nikolai Eremenko on 15.09.2023.
//

import UIKit


class FirstScreenViewController: UIViewController {
    
    var tableView = UITableView()
    var safeArea: UILayoutGuide!
    let nextButton = UIButton()
    var characters = ["Link", "Zelda", "Ganondorf", "Midna"]
    var categoryDetail: CategoryDetail!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        safeArea = view.layoutMarginsGuide
        setupTableView()
        title = "First Screen"
        navigationController?.navigationBar.prefersLargeTitles = true
//        getData()
        categoryDetail = CategoryDetail()
        categoryDetail.getData()
        
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
    }
    
//    func getData() {
//        let urlString = "https://truckercanada.com/categories.json"
//        
//        print("Info: Accessing the \(urlString)")
//        
//        // Create URL
//        guard let url = URL(string: urlString) else {
//            print("ERROR: Could not create URL from \(urlString)")
//            return
//        }
//        
//        // Create URLSession
//        let session = URLSession.shared
//        
//        // Get data whith dataTask method
//        let task = session.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("ERROR: \(error.localizedDescription)")
//            }
//            
//            // note: there are some additional things that could go wrong when using URLSession, but we shouldn't experience them, so we'll ignore testing these for now...
//            
//            // deal with data
//            do {
//                let json = try JSONSerialization.jsonObject(with: data!, options: [])
//                print("\(json)")
//            } catch {
//                print("JSON ERROR: \(error.localizedDescription)")
//            }
//        }
//        
//        task.resume()
//    }
    
}

extension FirstScreenViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return characters.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = characters[indexPath.row]
    return cell
  }
}
