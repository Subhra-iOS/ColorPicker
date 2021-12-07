//
//  M13CheckboxController.swift
//  M13Checkbox
//
//  Created by Subhra Roy on 31/01/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import UIKit

internal class M13CheckboxController {
    
    //----------------------------
    // MARK: - Properties
    //----------------------------
    
    /// The path presets for the manager.
    var pathGenerator: M13CheckboxPathGenerator = M13CheckboxCheckPathGenerator()
    
    /// The animation presets for the manager.
    var animationGenerator: M13CheckboxAnimationGenerator = M13CheckboxAnimationGenerator()
    
    /// The current state of the checkbox.
    var state: M13Checkbox.CheckState = CheckBoxDefaultValues.checkState
    
    /// The current tint color.
    /// - Note: Subclasses should override didSet to update the layers when this value changes.
    var tintColor: UIColor = UIColor.black
    
    /// The secondary tint color.
    /// - Note: Subclasses should override didSet to update the layers when this value changes.
    var secondaryTintColor: UIColor? = UIColor.lightGray
    
    /// The secondary color of the mark.
    /// - Note: Subclasses should override didSet to update the layers when this value changes.
    var secondaryCheckmarkTintColor: UIColor? = UIColor.white
    
    /// Whether or not to hide the box.
    /// - Note: Subclasses should override didSet to update the layers when this value changes.
    var hideBox: Bool = false
    
    /// Whether or not to allow morphong between states.
    var enableMorphing: Bool = true
    
    // The type of mark to display.
    var markType: M13Checkbox.MarkType {
        get {
            return _markType
        }
        set {
            setMarkType(type: newValue, animated: false)
        }
    }
    
    private var _markType: M13Checkbox.MarkType = CheckBoxDefaultValues.markType
    
    func setMarkType(type: M13Checkbox.MarkType, animated: Bool) {
        guard type != _markType else {
            return
        }
        _setMarkType(type: type, animated: animated)
        _markType = type
    }
    
    private func _setMarkType(type: M13Checkbox.MarkType, animated: Bool) {
        var newPathGenerator: M13CheckboxPathGenerator
        switch type {
        case .checkmark:
            newPathGenerator = M13CheckboxCheckPathGenerator()
        case .radio:
            newPathGenerator = M13CheckboxRadioPathGenerator()
        case .addRemove:
            newPathGenerator = M13CheckboxAddRemovePathGenerator()
        case .disclosure:
            newPathGenerator = M13CheckboxDisclosurePathGenerator()
        }
        
        newPathGenerator.boxLineWidth = pathGenerator.boxLineWidth
        newPathGenerator.boxType = pathGenerator.boxType
        newPathGenerator.checkmarkLineWidth = pathGenerator.checkmarkLineWidth
        newPathGenerator.cornerRadius = pathGenerator.cornerRadius
        newPathGenerator.size = pathGenerator.size
        
        // Animate the change.
        if pathGenerator.pathForMark(state) != nil && animated {
            let previousState = state
            animate(state, toState: nil, completion: { [weak self] in
                self?.pathGenerator = newPathGenerator
                self?.resetLayersForState(previousState)
                if self?.pathGenerator.pathForMark(previousState) != nil {
                    self?.animate(nil, toState: previousState)
                }
            })
        } else if newPathGenerator.pathForMark(state) != nil && animated {
            let previousState = state
            pathGenerator = newPathGenerator
            resetLayersForState(nil)
            animate(nil, toState: previousState)
        } else {
            pathGenerator = newPathGenerator
            resetLayersForState(state)
        }
    }
    
    //----------------------------
    // MARK: - Layers
    //----------------------------
    
    /// The layers to display in the checkbox. The top layer is the last layer in the array.
    var layersToDisplay: [CALayer] {
        return []
    }
    
    //----------------------------
    // MARK: - Animations
    //----------------------------
    
    /**
     Animates the layers between the two states.
     - parameter fromState: The previous state of the checkbox.
     - parameter toState: The new state of the checkbox.
     */
    func animate(_ fromState: M13Checkbox.CheckState?, toState: M13Checkbox.CheckState?, completion: (() -> Void)? = nil) {
        if let toState = toState {
            state = toState
        }
    }
    
    //----------------------------
    // MARK: - Layout
    //----------------------------
    
    /// Layout the layers.
    func layoutLayers() {
        
    }
    
    //----------------------------
    // MARK: - Display
    //----------------------------
    
    /**
     Reset the layers to be in the given state.
     - parameter state: The new state of the checkbox.
     */
    func resetLayersForState(_ state: M13Checkbox.CheckState?) {
        if let state = state {
            self.state = state
        }
        layoutLayers()
    }
    
}
