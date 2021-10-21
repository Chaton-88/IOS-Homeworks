
import UIKit

class ProfileViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
  
    private let identifierOneCell = "idOneCell"
    private let identifierTwoCell = "idTwoCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        #if DEBUG
        tableView.backgroundColor = .white
        #else
        tableView.backgroundColor = .lightGray
        #endif
        
        tableView.toAutoLayout()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "idOneCell")
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "idTwoCell")
        tableView.register(ProfileTableHeaderView.self, forHeaderFooterViewReuseIdentifier: ProfileTableHeaderView.headerId)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cellOne: PhotosTableViewCell = tableView.dequeueReusableCell(withIdentifier: "idOneCell", for: indexPath) as! PhotosTableViewCell
            cellOne.cell = photos
            return cellOne
        } else {
            let cellTwo: ProfileTableViewCell = tableView.dequeueReusableCell(withIdentifier: "idTwoCell", for: indexPath) as! ProfileTableViewCell
            cellTwo.post = Section.publication.post[indexPath.row]
            return cellTwo
        }
    }
}

// MARK: UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard section == 0 else {
            return nil
        }
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileTableHeaderView.headerId) as? ProfileTableHeaderView
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        guard section == 0 else {
            return 0
        }
        return ProfileTableHeaderView.noIntrinsicMetric
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0  {
            
            let destination = PhotosViewController()
            navigationController?.pushViewController(destination, animated: true)
        }
    }
}

