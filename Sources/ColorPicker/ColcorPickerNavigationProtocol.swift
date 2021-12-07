//
//  File.swift
//  
//
//  Created by Subhra Roy on 07/12/21.
//

import Foundation
import UIKit

public protocol ColcorPickerNavigationProtocol{
    typealias ViewController = ARCColorPickerController
    func presentColorPicker(controller: ViewController?)
    func dismissColorPicker(_ color : UIColor? , _ hexCode : String)
}
