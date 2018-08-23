//
//  ElementDetailVC.swift
//  Periodic Table
//
//  Created by Milos Jakovljevic on 10/14/17.
//  Copyright © 2017 Milos Jakovljevic. All rights reserved.
//
extension UIColor{
    func HexToColor(hexString: String, alpha:CGFloat? = 1.0) -> UIColor {
        // Convert hex string to an integer
        let hexint = Int(self.intFromHexString(hexStr: hexString))
        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
        let alpha = alpha!
        // Create color object, specifying alpha as well
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }
    
    func intFromHexString(hexStr: String) -> UInt32 {
        var hexInt: UInt32 = 0
        // Create scanner
        let scanner: Scanner = Scanner(string: hexStr)
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        // Scan hex value
        scanner.scanHexInt32(&hexInt)
        return hexInt
    }
}


import UIKit

class ElementDetailVC: UIViewController {
    
    var element: Element!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(element.name)
        name.text = element.name
        symbol.text = element.symbol
        number.text = element.atomicNumber
        mass.text = element.atomicMass
        config.text = element.electronicConfiguration
        color.backgroundColor = UIColor().HexToColor(hexString: element.cpkHexColor)
        color.layer.cornerRadius = 2.0
        block.text = element.groupBlock.capitalized
        bondingtype.text = "Bonding type: \(element.bondingType.capitalized)"
        yeardiscovered.text = "Year discovered: \(element.yearDiscovered)"
        standardstate.text = "Standard state: \(element.standardState.capitalized)"
        boilingpoint.text = "Boiling point: \(element.boilingPoint) K"
        meltingpoint.text = "Melting point: \(element.meltingPoint) K"
        print(element.atomicNumber)
        print(element.cpkHexColor)

        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBOutlet weak var meltingpoint: UILabel!
    @IBOutlet weak var boilingpoint: UILabel!
    @IBOutlet weak var standardstate: UILabel!
    @IBOutlet weak var yeardiscovered: UILabel!
    @IBOutlet weak var bondingtype: UILabel!
    @IBOutlet weak var block: UILabel!
    @IBOutlet weak var color: UIView!
    @IBOutlet weak var config: UILabel!
    @IBOutlet weak var mass: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var number: UILabel!
    
    @IBOutlet weak var symbol: UILabel!
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
}
