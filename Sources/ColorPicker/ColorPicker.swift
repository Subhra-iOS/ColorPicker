
import UIKit

public struct ColorPicker {
    
    private let deviceType: UIUserInterfaceIdiom
    private var navigationDelegate: ColcorPickerNavigationProtocol?
    private let colorHexCode: String
    
    public init(deviceType: UIUserInterfaceIdiom,
         colorHex: String,
         navigation: ColcorPickerNavigationProtocol?) {
        self.deviceType = deviceType
        self.colorHexCode = colorHex
        self.navigationDelegate = navigation
    }
    
    public func openColorPicker(){
        
        var pickerController : ARCColorPickerController?
        switch self.deviceType{
            case .phone:
                pickerController = ARCColorPickerController(nibName: "ARCColorPickerController_iPhone", bundle: Bundle.module)
                pickerController?.modalPresentationStyle = .overCurrentContext
            case .pad:
                pickerController = ARCColorPickerController(nibName: "ARCColorPickerController", bundle: Bundle.module)
                
                if #available(iOS 13.0, *){
                    pickerController?.isModalInPresentation = true
                }
                pickerController?.modalPresentationStyle = .formSheet
            
            @unknown default:
                pickerController = ARCColorPickerController(nibName: "ARCColorPickerController_iPhone", bundle: Bundle.module)
                pickerController?.modalPresentationStyle = .overCurrentContext
                
        }
        
        pickerController?.setInitialHexCodeWith(code: self.colorHexCode )
        
        pickerController?.colorSelectionHandler = {  ( color , hexCode) in
            print("Color Code : \(String(describing: hexCode))")
            self.navigationDelegate?.dismissColorPicker( color , hexCode)
        }
        
        self.navigationDelegate?.presentColorPicker(controller: pickerController)
    }
    
}
