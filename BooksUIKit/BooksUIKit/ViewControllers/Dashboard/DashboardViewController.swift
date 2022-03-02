//
//  DashboardViewController.swift
//  BooksUIKit
//
//  Created by Gaurang on 28/02/22.
//

import UIKit

class DashboardViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    private let viewModel = DashboardViewModel()
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = StringConsts.dashboard
        tableView.registerNibCell(type: .book)
        observeViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.startSynching()
    }
    
    // MARK: - Other methods
    private func observeViewModel() {
        viewModel.event = { [weak self] event in
            guard let self = self else {
                return
            }
            switch event {
            case .loading:
                break
            case .updateDataModel:
                break
            case .error(let message):
                self.showEmptyMessage(message)
            }
            self.tableView.reloadData()
        }
    }

}

// MARK: - TableView Delegate
extension DashboardViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BookTableViewCell = tableView.dequeueReusableCell(withType: .book, for: indexPath)
        cell.config(viewModel.books[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) as? BookTableViewCell else {
            return
        }
        tableView.beginUpdates()
        cell.toggleDescription(true)
        tableView.endUpdates()
    }
    
}
