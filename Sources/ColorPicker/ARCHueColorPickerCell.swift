//
//  ARCHueColorPickerCell.swift
//  SRColorPicker
//
//  Created by Subhra Roy on 31/01/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import UIKit
import Foundation

enum ColorPickerType {
    case hueBox
    case hueBar
    case solid
}

protocol ColorPickerProtocol : NSObjectProtocol {
    func didChangeInColorWith(hexCode : String) -> Void
}

class ARCHueColorPickerCell: UITableViewCell {

    @IBOutlet weak private var squarePickerView: ColorSquarePicker!
    @IBOutlet weak private var barPickerView: ColorBarPicker!
    @IBOutlet weak private var colorIndicatorView: ColorIndicatorView!
    
    weak private var colorPickerDelegate : ColorPickerProtocol?
    @IBOutlet weak private var hexCodeTextField: UITextField!
    private var  colorPickerControlType : ColorPickerType = .hueBar
    @IBOutlet weak  var solidColorPickerView: ColorPickerView!
    private var lastIndex : Int = 0
    
    let colorArray : [UIColor] = [UIColor(hex: "#57a6ff") , UIColor(hex: "#0dd185") , UIColor(hex: "#77d352") , UIColor(hex: "#ffba5c") , UIColor(hex: "#b8977e") , UIColor(hex: "#ff9052"), UIColor(hex: "#f95f62") , UIColor(hex: "#f77fb3") , UIColor(hex: "#976dd0") , UIColor(hex: "#343f4a") , UIColor(hex: "#5a6978") , UIColor(hex: "#969faa") , UIColor(hex: "#c6cbd0") , UIColor(hex: "#ffffff")  ] 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.hexCodeTextField.isUserInteractionEnabled = false
        self.initiateSolidColorView()
    }
    
   private  func initiateSolidColorView(){
           self.solidColorPickerView.delegate = self
          self.solidColorPickerView.layoutDelegate = self
          self.solidColorPickerView.style = .circle
          self.solidColorPickerView.selectionStyle = .check
          self.solidColorPickerView.isSelectedColorTappable = false
         self.solidColorPickerView.colors = colorArray
       
       }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setColorPickerType(type : ColorPickerType , lastSolidIndex : Int) {
        self.colorPickerControlType = type
        self.lastIndex = lastSolidIndex
    }
    
    private func getHueValue(color : UIColor) -> CGFloat{
        
        guard let rgbValue = color.rgbValue else { return 0.0 }
        let hueValue =  color.rgbToHue(r: rgbValue.r, g: rgbValue.g, b: rgbValue.b)
        return  hueValue.h
    }
    
    func setInitialColorWith(hexCode : String) -> Void {
        
        if  hexCode.isHexCode() {
            let color : UIColor = UIColor(hex: hexCode)
            let hueValue = self.getHueValue(color: color)
            self.squarePickerView.hue = hueValue
           
            self.barPickerView.hue = hueValue
            self.colorIndicatorView.color = color
           self.hexCodeTextField.text = color.hexString
        }
        
    }
    
    func setColorPickerDelegate(delegate : ColorPickerProtocol?){
        self.colorPickerDelegate = delegate
    }
    
    @IBAction func colorBarPickerValueChanged(_ sender: ColorBarPicker) {
        self.colorPickerControlType  = .hueBar
        self.squarePickerView.hue = sender.hue
        didChangeColor(self.squarePickerView.color)

    }
    
    @IBAction func colorSquarePickerValueChanged(_ sender: ColorSquarePicker) {
        self.colorPickerControlType  = .hueBox
        self.barPickerView.hue = sender.hue
        didChangeColor(sender.color)
        
    }
    
   internal  func didChangeColor(_ color: UIColor) {
        switch self.colorPickerControlType {
           case .hueBox ,  .hueBar:
              if let _ = self.solidColorPickerView.pickerCollectionView() {
                self.solidColorPickerView.resetSelectedSolidColorSelection(index: self.lastIndex)
              }
           case .solid: break
              
        }
    
         self.colorIndicatorView.circularBorder = .disable
         self.colorIndicatorView.color = color
         self.hexCodeTextField.text = color.hexString
        self.colorPickerDelegate?.didChangeInColorWith(hexCode: color.hexString)
    }
    
    deinit {
        print("ARCHueColorPickerCell  dealloc")
    }
    
}

