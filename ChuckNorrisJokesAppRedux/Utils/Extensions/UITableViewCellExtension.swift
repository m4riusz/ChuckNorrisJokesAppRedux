//
//  UITableViewCellExtension.swift
//  ChuckNorrisJokesAppRedux
//
//  Created by Mariusz Sut on 06/07/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import UIKit

extension UITableViewCell {
    class func reusableIdentifier() -> String {
        return String(describing: self)
    }
}
