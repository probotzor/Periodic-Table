//
//  Element.swift
//  Periodic Table
//
//  Created by Milos Jakovljevic on 10/14/17.
//  Copyright © 2017 Milos Jakovljevic. All rights reserved.
//

import Foundation

class Element {
    private var _atomicNumber: String!
    private var _symbol: String!
    private var _name: String!
    private var _atomicMass: String!
    private var _cpkHexColor: String!
    private var _electronicConfiguration: String!
    private var _electronegativity: String!
    private var _atomicRadius: String!
    private var _ionRadius: String!
    private var _vanDelWaalsRadius: String!
    private var _ionizationEnergy: String!
    private var _electronAffinity: String!
    private var _oxidationStates: String!
    private var _standardState: String!
    private var _bondingType: String!
    private var _meltingPoint: String!
    private var _boilingPoint: String!
    private var _density: String!
    private var _groupBlock: String!
    private var _yearDiscovered: String!
    
    
    
    var atomicNumber: String {
        return _atomicNumber
    }
    
    var symbol: String {
        return _symbol
    }
    
    var name: String {
        return _name
    }
    var atomicMass: String {
        return _atomicMass
    }
    var cpkHexColor: String {
        return _cpkHexColor
    }
    var electronicConfiguration: String {
        return _electronicConfiguration
    }
    var electronegativity: String {
        return _electronegativity
    }
    var atomicRadius: String {
        return _atomicRadius
    }
    var ionRadius: String {
        return _ionRadius
    }
    var vanDelWaalsRadius: String {
        return _vanDelWaalsRadius
    }
    var ionizationEnergy: String {
        return _ionizationEnergy
    }
    var electronAffinity: String {
        return _electronAffinity
    }
    var oxidationStates: String {
        return _oxidationStates
    }
    var standardState: String {
        return _standardState
    }
    var bondingType: String {
        return _bondingType
    }
    var meltingPoint: String {
        return _meltingPoint
    }
    var boilingPoint: String {
        return _boilingPoint
    }
    var density: String {
        return _density
    }
    var groupBlock: String {
        return _groupBlock
    }
    var yearDiscovered: String {
        return _yearDiscovered
    }
    
    
    
    
    init(atomicNumber: String, symbol: String, name: String, atomicMass: String, cpkHexColor: String, electronicConfiguration: String, electronegativity: String, atomicRadius: String, ionRadius: String, vanDelWaalsRadius: String, ionizationEnergy: String, electronAffinity: String, oxidationStates: String, standardState: String, bondingType: String, meltingPoint: String, boilingPoint: String, density: String, groupBlock: String, yearDiscovered: String) {
        
        self._atomicNumber = atomicNumber
        self._symbol = symbol
        self._name = name
        self._atomicMass = atomicMass
        self._cpkHexColor = cpkHexColor
        self._electronicConfiguration = electronicConfiguration
        self._electronegativity = electronegativity
        self._atomicRadius = atomicRadius
        self._ionRadius = ionRadius
        self._vanDelWaalsRadius = vanDelWaalsRadius
        self._ionizationEnergy = ionizationEnergy
        self._electronAffinity = electronAffinity
        self._oxidationStates = oxidationStates
        self._standardState = standardState
        self._bondingType = bondingType
        self._meltingPoint = meltingPoint
        self._boilingPoint = boilingPoint
        self._density = density
        self._groupBlock = groupBlock
        self._yearDiscovered = yearDiscovered
        
        
        
        
    }
}

