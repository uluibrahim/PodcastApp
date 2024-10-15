//
//  HomeViewController.swift
//  PodcastApp
//
//  Created by İbrahim Halil ULU on 8.10.2024.
//  
//

import UIKit

final class HomeViewController: UIViewController, NavigationView {
    
    // MARK: - Properties
    var presenter: ViewToPresenterHomeProtocol!

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view = HomeView(self)
        view.backgroundColor = .white
    }
     
}

extension HomeViewController: PresenterToViewHomeProtocol{
    func showMessage(message: String) {
        let alert  = UIAlertController()
        alert.title = "Alert"
        alert.show(alert, sender: nil)
    }
    
    // TODO: Implement View Output Methods
}
