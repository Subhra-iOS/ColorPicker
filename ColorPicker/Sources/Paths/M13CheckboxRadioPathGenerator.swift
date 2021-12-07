//
//  M13CheckboxRadioPathGenerator.swift
//  M13Checkbox
//
//  Created by Subhra Roy on 31/01/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import UIKit

internal class M13CheckboxRadioPathGenerator: M13CheckboxPathGenerator {
    
    //----------------------------
    // MARK: - Mark Generation
    //----------------------------
    
    override func pathForMark() -> UIBezierPath? {
        let transform = CGAffineTransform(scaleX: 0.665, y: 0.665)
        let translate = CGAffineTransform(translationX: size * 0.1675, y: size * 0.1675)
        let path = pathForBox()
        path?.apply(transform)
        path?.apply(translate)
        return path
    }
    
    override func pathForLongMark() -> UIBezierPath? {
        return pathForBox()
    }

    override func pathForMixedMark() -> UIBezierPath? {
        return pathForMark()
    }
    
    override func pathForLongMixedMark() -> UIBezierPath? {
        return pathForBox()
    }

    override func pathForUnselectedMark() -> UIBezierPath? {
        return nil
    }
    
    override func pathForLongUnselectedMark() -> UIBezierPath? {
        return nil
    }
}

