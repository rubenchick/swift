//
//  Coordinates.swift
//  Preferans.Pool
//
//  Created by Anton Rubenchik on 03/06/2019.
//  Copyright © 2019 Anton Rubenchik. All rights reserved.
//

import Foundation
import UIKit

class Coordinats {
    static let shared = Coordinats()
    private init() {}
    
    var centre    = Points()
    var body      = Size()
    var circle    = PointsOnLevel()
    var mountain  = PointsOnLevel()
    var poolZone  = PointsOnLevel()
    var startPosX = Int()
    var radius    = CGFloat()
    
    
}

struct Points {
    var x = CGFloat()
    var y = CGFloat()
}

struct Size {
    var width  = CGFloat()
    var height = CGFloat()
}

class PointsOnLevel {
    var pointWS = Points()
    var pointSE = Points()
    var pointEN = Points()
    var pointNW = Points()
}

class Mountain: PointsOnLevel {
    
}
enum TypeOfPlayers {
    case west
    case east
    case south
    case north
}
