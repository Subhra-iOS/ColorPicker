//
//  UIColor+Values.swift
//  HueKit
//
//  Created by Subhra Roy on 31/01/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
	
	public var rgbValue: RGB? {
		
		guard let components = cgColor.components else {
			return nil
		}
		
		let numComponents = cgColor.numberOfComponents
		
		let r: CGFloat
		let g: CGFloat
		let b: CGFloat
		
		if numComponents < 3 {
			r = components[0]
			g = components[0]
			b = components[0]
		} else {
			r = components[0]
			g = components[1]
			b = components[2]
		}
		
		return RGB(r: r, g: g, b: b)
	}
	
	public var hsvValue: HSV? {
		
		guard let rgb = rgbValue else {
			return nil
		}
		
		return rgb.toHSV(preserveHS: true)
	}
	
	public func hsvValue(preservingHue hue: CGFloat, preservingSat sat: CGFloat) -> HSV? {

		guard let rgb = rgbValue else {
			return nil
		}
		
		return rgb.toHSV(preserveHS: true, h: hue, s: sat)
	}
    
    func rgbToHue(r:CGFloat,g:CGFloat,b:CGFloat) -> (h:CGFloat, s:CGFloat, b:CGFloat) {
        let minV:CGFloat = CGFloat(min(r, g, b))
        let maxV:CGFloat = CGFloat(max(r, g, b))
        let delta:CGFloat = maxV - minV
        var hue:CGFloat = 0
        if delta != 0 {
        if r == maxV {
           hue = (g - b) / delta
        }
        else if g == maxV {
           hue = 2 + (b - r) / delta
        }
        else {
           hue = 4 + (r - g) / delta
        }
        hue *= 60
        if hue < 0 {
           hue += 360
        }
        }
        let saturation = maxV == 0 ? 0 : (delta / maxV)
        let brightness = maxV
        return (h:hue/360, s:saturation, b:brightness)
    }
	
}

extension UIColor {
    
    public var hexString: String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        return String(format: "#%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
    }
    
     /* convenience public init?(hex: String) {
          var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
          hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

          var rgb: UInt32 = 0

          var r: CGFloat = 0.0
          var g: CGFloat = 0.0
          var b: CGFloat = 0.0
          var a: CGFloat = 1.0

          let length = hexSanitized.count

          guard Scanner(string: hexSanitized).scanHexInt32(&rgb) else { return nil }

          if length == 6 {
              r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
              g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
              b = CGFloat(rgb & 0x0000FF) / 255.0

          } else if length == 8 {
              r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
              g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
              b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
              a = CGFloat(rgb & 0x000000FF) / 255.0

          } else {
              return nil
          }

          self.init(red: r, green: g, blue: b, alpha: a)
      }*/
    
}

extension UIColor {
    
    convenience init(hex: String) {
        self.init(hex: hex, alpha:1)
    }
    
    convenience init(hex: String, alpha: CGFloat) {
        var hexWithoutSymbol = hex
        if hexWithoutSymbol.hasPrefix("#") {
            hexWithoutSymbol = hex.substring(1)
        }
        
        let scanner = Scanner(string: hexWithoutSymbol)
        var hexInt:UInt32 = 0x0
        scanner.scanHexInt32(&hexInt)
        
        var r:UInt32!, g:UInt32!, b:UInt32!
        switch (hexWithoutSymbol.length()) {
            case 3 : // #RGB
                r = ((hexInt >> 4) & 0xf0 | (hexInt >> 8) & 0x0f)
                g = ((hexInt >> 0) & 0xf0 | (hexInt >> 4) & 0x0f)
                b = ((hexInt << 4) & 0xf0 | hexInt & 0x0f)
                break
            case 6 : // #RRGGBB
                r = (hexInt >> 16) & 0xff
                g = (hexInt >> 8) & 0xff
                b = hexInt & 0xff
                break
            default :
                // TODO:ERROR
                break
        }
        
        self.init(
            red: (CGFloat(r)/255),
            green: (CGFloat(g)/255),
            blue: (CGFloat(b)/255),
            alpha:alpha)
    }
    
    
    class func colorFromRGB(_ rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    /// Perticular color for perticular String
    ///
    /// - Parameter seed: Color for string
    /// - Returns: UIColor
    /// - Author: Sayak  S Khatua
    class func randomColorForString(seed: String) -> UIColor {
        
        var total: Int = 0
        for u in seed.unicodeScalars {
            total += Int(UInt32(u))
        }
        
        srand48(total * 200)
        let r = CGFloat(drand48())
        
        srand48(total)
        let g = CGFloat(drand48())
        
        srand48(total / 200)
        let b = CGFloat(drand48())
        
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
}

extension String{
    func substring(_ from: Int) -> String {
        return self.substring(from: self.index(self.startIndex, offsetBy: from))
    }
    
    func length() -> Int {
        let characterCount : Int? = self.count
        if let strLength = characterCount,strLength > 0{
            return  strLength
        }else{
            return Int(0)
        }
    }
    
    func isHexCode() -> Bool{
        return  self.contains(Character("#"))
    }
}
