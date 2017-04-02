//
//  ColoredButton.swift
//  Assignment1
//
//  Created by admin on 02.04.17.
//  Copyright © 2017 admin. All rights reserved.
//

import Foundation
import UIKit

extension UIButton: Colored {   
    func colored() -> UIColor {
        print("color \(self.backgroundColor)")
        return self.backgroundColor ?? UIColor.clear
    }
}
