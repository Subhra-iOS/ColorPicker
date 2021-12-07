//
// ColorPickerViewDelegate.swift
//  Created by Subhra Roy on 31/01/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//


import Foundation

@objc public protocol ColorPickerViewDelegate: class {
    
    func colorPickerView(_ colorPickerView: ColorPickerView, didSelectItemAt indexPath: IndexPath)
    
    @objc optional func colorPickerView(_ colorPickerView: ColorPickerView, didDeselectItemAt indexPath: IndexPath)
    
}
