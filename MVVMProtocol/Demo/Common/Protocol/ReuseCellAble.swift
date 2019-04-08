//
//  ReuseCellAble.swift
//  MVVMProtocol
//
//  Created by hebi on 2019/4/9.
//  Copyright © 2019 Hobi. All rights reserved.
//

import Foundation
import UIKit

protocol ReuseCellAble {
    
}

extension ReuseCellAble where Self: UIView {
    static var reuseIdentifier : String {
        return NSStringFromClass(Self.self)
    }
}
