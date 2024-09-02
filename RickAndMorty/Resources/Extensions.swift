//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Tal talspektor on 01/09/2024.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
