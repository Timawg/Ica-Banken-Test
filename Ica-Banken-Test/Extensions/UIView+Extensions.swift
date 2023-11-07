//
//  UIView+Extensions.swift
//  Ica-Banken-Test
//
//  Created by Tim Gunnarsson on 2023-11-06.
//

import Foundation
import UIKit
import SwiftUI


extension UIView {
    
    func addSwiftUI<Content: View>(view: Content) {
        let hostingController = UIHostingController(rootView: view)
        
        guard let view = hostingController.view else {
            fatalError()
        }

        view.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(view)
        
        NSLayoutConstraint.activate(
            [
                view.leadingAnchor.constraint(equalTo: leadingAnchor),
                view.topAnchor.constraint(equalTo: topAnchor),
                view.trailingAnchor.constraint(equalTo: trailingAnchor),
                view.bottomAnchor.constraint(equalTo: bottomAnchor),
            ]
        )
    }
}
