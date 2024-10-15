//
//  BaseView.swift
//  PodcastApp
//
//  Created by İbrahim Halil ULU on 8.10.2024.
//

import UIKit

class BaseView<T: UIViewController>: UIView {
    var controller: T

    init(_ controller: T) {
        self.controller = controller
        super.init(frame: .zero)
        //backgroundColor = Theme.defaultTheme.themeColor.backgroundColor
        setupView()
    }

    func setupView() { }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
