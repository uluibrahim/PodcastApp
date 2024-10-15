//
//  NavigationViewProtocol.swift
//  PodcastApp
//
//  Created by İbrahim Halil ULU on 8.10.2024.
//

import Foundation
import UIKit


protocol NavigationView {
    func present(_ viewController: UIViewController)
    func dismiss()
}

extension NavigationView where Self: UIViewController {
    func present(_ viewController: UIViewController) {
        present(viewController, animated: true, completion: nil)
    }

    func dismiss() {
        dismiss(animated: true)
    }
}
