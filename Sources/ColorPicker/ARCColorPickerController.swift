//
//  ARCColorPickerController.swift
//  SRColorPicker
//
//  Created by Subhra Roy on 31/01/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import UIKit

typealias ColorPickerCallBackHandler = (_ color : UIColor? , _ hexCode : String) -> Void

public class ARCColorPickerController: UIViewController {
    
    @IBOutlet weak var roundRectContainerView: SRRoundRectView!
    private let colorPickerCellIdentifier = "colorPickerCellIdentifier"
    @IBOutlet weak private var colorPickerTable: UITableView!
    private var hexCode : String?
    private var defaultHexCode : String?
    
    var colorSelectionHandler : ColorPickerCallBackHandler?
    
    func setInitialHexCodeWith(code : String) {
        self.hexCode = code
        self.defaultHexCode = code
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.roundRectContainerView?.cornerPairsEadges = .top(10.0)

        self.colorPickerTable.isScrollEnabled = true
        self.colorPickerTable.isUserInteractionEnabled = true
        self.colorPickerTable.register(UINib(nibName: "ARCHueColorPickerCell", bundle: Bundle.main), forCellReuseIdentifier: colorPickerCellIdentifier)
    }
    
    /// Apply Color Action
    /// - Parameter sender: UIButton Action
    @IBAction func didTapApplyColor(_ sender: Any) {
        self.dismiss(animated: true) { [weak self] in
            if let hexString : String = self?.hexCode , hexString.count > 0 {
                let selectedColor : UIColor = UIColor(hex: hexString)
                self?.colorSelectionHandler?(selectedColor , hexString)
               }else{
                   self?.colorSelectionHandler?(UIColor.gray, "")
               }
        }
    }
    /// Cancel/Dismiss Color Action
    /// - Parameter sender: UIButton Action
    @IBAction func didTapCancelColorPicker(_ sender: Any) {
            self.dismiss(animated: true) { [weak self] in
                if let hexString : String =  self?.defaultHexCode, hexString.count > 0 {
                   let selectedColor : UIColor = UIColor(hex: hexString)
                   self?.colorSelectionHandler?(selectedColor , hexString)
                  }else{
                      self?.colorSelectionHandler?(UIColor.gray, "")
                  }
           }
    }
    
    override var shouldAutorotate: Bool {
           return true
       }
           
       override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
           return .all
       }
       
       override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
           return .portrait
       }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.colorPickerTable.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: false)
    }
    
    deinit {
           print("ARCColorPickerController  dealloc")
       }
    
}

extension ARCColorPickerController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let colorCell : ARCHueColorPickerCell = tableView.dequeueReusableCell(withIdentifier: colorPickerCellIdentifier, for: indexPath) as! ARCHueColorPickerCell
        colorCell.setInitialColorWith(hexCode: self.hexCode ?? "")
        colorCell.setColorPickerDelegate(delegate: self)
        return colorCell
    }
   
}

extension ARCColorPickerController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?{
        return UIView(frame: CGRect(x: 0.0, y: 0.0, width: tableView.frame.size.width, height: 0.0))
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension ARCColorPickerController : ColorPickerProtocol {
    
    func didChangeInColorWith(hexCode: String) {
        self.hexCode = hexCode
    }
    
}

extension ARCColorPickerController {
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
      /*  super.touchesBegan(touches, with: event)
           if let touch = touches.first , let boxOrBarView = touch.view {
                if boxOrBarView  is  ColorSquarePicker {
                    print("\(boxOrBarView)")
                }else if boxOrBarView is ColorBarPicker{
                     print("\(boxOrBarView)")
                }else{
                     print("\(boxOrBarView)")
                }
           }else{
                print("\(String(describing: touches.first?.view))")
            }*/
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            /*super.touchesMoved(touches, with: event)
            if let touch = touches.first , let boxOrBarView = touch.view {
               if boxOrBarView  is  ColorSquarePicker {
                   print("\(boxOrBarView)")
               }else if boxOrBarView is ColorBarPicker{
                    print("\(boxOrBarView)")
               }else{
                    print("\(boxOrBarView)")
               }
          }else{
                print("\(String(describing: touches.first?.view))")
           }*/
     }
    
}
