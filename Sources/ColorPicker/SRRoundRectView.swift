//
//  SRRoundRectView.swift
//  SRColorPicker
//
//  Created by Subhra Roy on 05/02/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import Foundation
import UIKit

public enum CornerPairsEadge {
    case top(CGFloat)
    case bottom(CGFloat)
    case topBottomLeft(CGFloat)
    case topBottomRight(CGFloat)
}

@IBDesignable open class SRRoundRectView : UIView {
        
    open var cornerPairsEadges : CornerPairsEadge =  .top(10.0)
    
    @IBInspectable open var  topRightRoundCorner : CGFloat = 10.0 {
        didSet{
            self.layer.mask = self.roundlayerCorners(corners: [.topRight], radius: self.topRightRoundCorner)
        }
     }
    
    @IBInspectable open var  topLeftRoundCorner : CGFloat = 10.0 {
       didSet{
           self.layer.mask = self.roundlayerCorners(corners: [.topLeft], radius: self.topLeftRoundCorner)
       }
    }
    
    @IBInspectable open var  bottomLeftRoundCorner : CGFloat = 10.0 {
           didSet{
               self.layer.mask = self.roundlayerCorners(corners: [.bottomLeft], radius: self.bottomLeftRoundCorner)
         }
    }
    @IBInspectable open var  bottomRightRoundCorner : CGFloat = 10.0 {
       didSet{
           self.layer.mask = self.roundlayerCorners(corners: [.bottomRight], radius: self.bottomRightRoundCorner)
       }
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        self.layer.mask = nil
        self.roundCorners(corners: [.topLeft, .topRight], radius: 10.0)
            /*switch cornerPairsEadges {
                case .top(let cornerRadius):
                     self.roundCorners(corners: [.topLeft, .topRight], radius: cornerRadius)
                case .bottom(let cornerRadius) :
                     self.roundCorners(corners: [.bottomLeft, .bottomRight], radius: cornerRadius)
                case .topBottomLeft(let cornerRadius) :
                    self.roundCorners(corners: [.bottomLeft, .topLeft], radius: cornerRadius)
                case .topBottomRight(let cornerRadius) :
                    self.roundCorners(corners: [.bottomRight, .topRight], radius: cornerRadius)
            }*/
          
       }
    
    // MARK: - UI Setup
    open override func prepareForInterfaceBuilder() {
        
    }
       
    
}
