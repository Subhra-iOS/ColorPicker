//
//  ARCHueColorPickerDataModel.swift
//  SRColorPicker
//
//  Created by Subhra Roy on 31/01/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import Foundation
import  UIKit

class ARCHueColorPickerDataModel : NSObject {
    
    public var  hueColor : CGFloat = 0.0
    public var pickerColor : UIColor = UIColor.gray
    
    deinit {
        print("ARCHueColorPickerDataModel  dealloc")
    }
    
}
