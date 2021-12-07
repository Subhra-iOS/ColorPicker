//
//  ARCHueColorPickerCell+SolidColorPicker.swift
//  SRColorPicker
//
//  Created by Subhra Roy on 03/02/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import Foundation
import UIKit

extension ARCHueColorPickerCell : ColorPickerViewDelegate{
    
    func colorPickerView(_ colorPickerView: ColorPickerView, didSelectItemAt indexPath: IndexPath){
        self.setColorPickerType(type: .solid , lastSolidIndex: colorPickerView.lastSelectedIndex()!)
        let selectedColor : UIColor = self.solidColorPickerView.colors[indexPath.row]
        
        didChangeColor(selectedColor)
    }
    @objc  func colorPickerView(_ colorPickerView: ColorPickerView, didDeselectItemAt indexPath: IndexPath){
       
    }
    
}

extension  ARCHueColorPickerCell : ColorPickerViewDelegateFlowLayout {
    // MARK: - ColorPickerViewDelegateFlowLayout
    
    func colorPickerView(_ colorPickerView: ColorPickerView, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        return CGSize(width: 29, height: 29)
    }
    
    func colorPickerView(_ colorPickerView: ColorPickerView, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func colorPickerView(_ colorPickerView: ColorPickerView, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func colorPickerView(_ colorPickerView: ColorPickerView, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
}
