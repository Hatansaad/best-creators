//
//.swift
//  تساؤل
//
//  Created by HESSA on 2/20/18.
//  Copyright © 2018 Tsaul developers. All rights reserved.
//

 import UIKit

extension UIView {
    @IBInspectable var CornerRadius : CGFloat{
        get {return self.layer.cornerRadius}
        set{self.layer.cornerRadius = newValue }
    }}
