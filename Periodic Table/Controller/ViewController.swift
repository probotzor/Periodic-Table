//
//  ViewController.swift
//  Periodic Table
//
//  Created by Milos Jakovljevic on 10/14/17.
//  Copyright © 2017 Milos Jakovljevic. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    @IBOutlet weak var collection: UICollectionView!
    
    @IBOutlet weak var searchbar: UISearchBar!
    
    
    
    
    
    var element = [Element]()
    var filteredElement = [Element]()
    var inSearchMode = false
    
    var atomicNumber = ""
    var symbol = ""
    var name = ""
    var atomicMass = ""
    var cpkHexColor = ""
    var electronicConfiguration = ""
    var electronegativity = ""
    var atomicRadius = ""
    var ionRadius = ""
    var vanDelWaalsRadius = ""
    var ionizationEnergy = ""
    var electronAffinity = ""
    var oxidationStates = ""
    var standardState = ""
    var bondingType = ""
    var meltingPoint = ""
    var boilingPoint = ""
    var density = ""
    var groupBlock = ""
    var yearDiscovered = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        searchbar.delegate = self
        searchbar.returnKeyType = UIReturnKeyType.done
        collection.showsVerticalScrollIndicator = false
        
        
        
        
        
        
        parseElementCSV()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func parseElementCSV() {
        let path = Bundle.main.path(forResource: "data", ofType: "csv")!
        
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            
            
            for row in rows {
                
                if  row["atomicNumber"] != nil {
                    atomicNumber = row["atomicNumber"]!
                }
                if  row["symbol"] != nil {
                    symbol = row["symbol"]!
                }
                
                if  row["name"] != nil {
                    name = row["name"]!
                }
                if  row["atomicMass"] != nil {
                    atomicMass = row["atomicMass"]!
                }
                if  row["cpkHexColor"] != nil {
                    cpkHexColor = row["cpkHexColor"]!
                }
                if  row["electronicConfiguration"] != nil {
                    electronicConfiguration = row["electronicConfiguration"]!
                }
                if  row["electronegativity"] != nil {
                    electronegativity = row["electronegativity"]!
                }
                if  row["atomicRadius"] != nil {
                    atomicRadius = row["atomicRadius"]!
                }
                if  row["ionRadius"] != nil {
                    ionRadius = row["ionRadius"]!
                }
                if  row["vanDelWaalsRadius"] != nil {
                    vanDelWaalsRadius = row["vanDelWaalsRadius"]!
                }
                if  row["ionizationEnergy"] != nil {
                    ionizationEnergy = row["ionizationEnergy"]!
                }
                if  row["electronAffinity"] != nil {
                    electronAffinity = row["electronAffinity"]!
                }
                if  row["oxidationStates"] != nil {
                    oxidationStates = row["oxidationStates"]!
                }
                if  row["standardState"] != nil {
                    standardState = row["standardState"]!
                }
                if  row["bondingType"] != nil {
                    bondingType = row["bondingType"]!
                }
                if  row["meltingPoint"] != nil {
                    meltingPoint = row["meltingPoint"]!
                }
                if  row["boilingPoint"] != nil {
                    boilingPoint = row["boilingPoint"]!
                }
                if  row["density"] != nil {
                    density = row["density"]!
                }
                if  row["groupBlock"] != nil {
                    groupBlock = row["groupBlock"]!
                }
                if  row["yearDiscovered"] != nil {
                    yearDiscovered = row["yearDiscovered"]!
                }
             
                
                
                let el = Element(atomicNumber: atomicNumber, symbol: symbol, name: name, atomicMass: atomicMass, cpkHexColor: cpkHexColor, electronicConfiguration: electronicConfiguration, electronegativity: electronegativity, atomicRadius: atomicRadius, ionRadius: ionRadius, vanDelWaalsRadius: vanDelWaalsRadius, ionizationEnergy: ionizationEnergy, electronAffinity: electronAffinity, oxidationStates: oxidationStates, standardState: standardState, bondingType: bondingType, meltingPoint: meltingPoint, boilingPoint: boilingPoint, density: density, groupBlock: groupBlock, yearDiscovered: yearDiscovered)
                element.append(el)
            }
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ElementCell", for: indexPath) as? ElementCell {
            
            let el: Element!
            
            if inSearchMode {
                el = filteredElement[indexPath.row]
            } else {
                el = element[indexPath.row]
            }
            
            
            
            cell.configureCell(element: el)
            return cell
            
        } else {
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let el: Element!
        
        if inSearchMode {
            el = filteredElement[indexPath.row]
        } else {
            el = element[indexPath.row]
        }
        
        
        performSegue(withIdentifier: "ElementDetailVC", sender: el)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if inSearchMode {
            return filteredElement.count
        }
        
        return element.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 85, height: 85)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchbar.text == nil || searchbar.text == "" {
            inSearchMode = false
            self.view.endEditing(true)
            collection.reloadData()
        } else {
            inSearchMode = true
            let lower = searchbar.text!.lowercased()
            filteredElement = element.filter({$0.name.lowercased().range(of: lower) != nil})
            collection.reloadData()
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ElementDetailVC" {
            if let detailsVC = segue.destination as? ElementDetailVC {
                if let el = sender as? Element {
                    detailsVC.element = el
                }
            }
        }
    }

   


}

