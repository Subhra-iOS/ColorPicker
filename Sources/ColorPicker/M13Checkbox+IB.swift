//
//  M13Checkbox+IB.swift
//  M13Checkbox
//
//  Created by Subhra Roy on 31/01/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import UIKit

public extension M13Checkbox {
    
    /// A proxy to set the box type compatible with interface builder.
    @IBInspectable  var _IBStateChangeAnimation: String {
        get {
            return stateChangeAnimation.rawValue
        }
        set {
            if let type = Animation(rawValue: newValue) {
                stateChangeAnimation = type
            } else {
                stateChangeAnimation = CheckBoxDefaultValues.animation
            }
        }
    }
    
    /// A proxy to set the mark type compatible with interface builder.
    @IBInspectable  var _IBMarkType: String {
        get {
            return markType.rawValue
        }
        set {
            if let type = MarkType(rawValue: newValue) {
                markType = type
            } else {
                markType = CheckBoxDefaultValues.markType
            }
        }
    }
    
    /// A proxy to set the box type compatible with interface builder.
    @IBInspectable  var _IBBoxType: String {
        get {
            return boxType.rawValue
        }
        set {
            if let type = BoxType(rawValue: newValue) {
                boxType = type
            } else {
                boxType = CheckBoxDefaultValues.boxType
            }
        }
    }
    
    /// A proxy to set the check state compatible with interface builder.
    @IBInspectable  var _IBCheckState: String {
        get {
            return checkState.rawValue
        }
        set {
            if let temp = CheckState(rawValue: newValue) {
                checkState = temp
            } else {
                checkState = CheckBoxDefaultValues.checkState
            }
        }
    }
    
}
