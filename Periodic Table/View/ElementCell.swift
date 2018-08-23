//
//  ElementCell.swift
//  Periodic Table
//
//  Created by Milos Jakovljevic on 10/14/17.
//  Copyright © 2017 Milos Jakovljevic. All rights reserved.
//

 

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}


import UIKit

class ElementCell: UICollectionViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var initialsLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var element: Element!
    
    
    func configureCell(element: Element) {
        self.element = element
        let bcolor = UIColor(hex: "edc85f")
        numberLabel.text = String(element.atomicNumber)
        initialsLabel.text = element.symbol
        nameLabel.text = element.name
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.borderWidth = 3
        self.layer.borderColor = bcolor.cgColor
        
        
    }
}
