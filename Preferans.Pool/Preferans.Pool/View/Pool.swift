//
//  Pool.swift
//  Preferans.Pool
//
//  Created by Anton Rubenchik on 01/06/2019.
//  Copyright © 2019 Anton Rubenchik. All rights reserved.
//

import UIKit

@IBDesignable
class Pool: UIView {
    override func draw(_ rect: CGRect) {
        createPoints(rect)
        drawCentre(rect)
        switch currentPlayers {
        case .two  :  drawPoolForThree(rect)
        case .three:  drawPoolForThree(rect)
        case .four :  drawPoolForThree(rect)
        }
    }
    
    func createPoints(_ rect: CGRect) {
        Coordinats.shared.body.width = rect.width   // mb delete
        Coordinats.shared.body.height = rect.height // mb delete
        // Not points
        Coordinats.shared.startPosX = Int(rect.width/2)%stepGrid // for border
        Coordinats.shared.radius = CGFloat(Double(rect.width)*(radiusCentre))
        let delta = Double(rect.width)*(radiusCentre)*cos(Double.pi/4)
        // Points
        Coordinats.shared.centre.x   = rect.midX
        Coordinats.shared.centre.y   = rect.midY

        Coordinats.shared.circle.pointSE.x = rect.midX + CGFloat(delta)
        Coordinats.shared.circle.pointSE.y = rect.midY + CGFloat(delta)
        Coordinats.shared.circle.pointWS.x = rect.midX - CGFloat(delta)
        Coordinats.shared.circle.pointWS.y = rect.midY + CGFloat(delta)
        
        Coordinats.shared.mountain.pointWS.x = (rect.midX + CGFloat(Coordinats.shared.startPosX))/2
        Coordinats.shared.mountain.pointWS.y = rect.height - Coordinats.shared.mountain.pointWS.x
        Coordinats.shared.mountain.pointSE.x = rect.midX + (rect.midX - CGFloat(Coordinats.shared.startPosX))/2
        Coordinats.shared.mountain.pointSE.y = Coordinats.shared.mountain.pointWS.y
        
        Coordinats.shared.poolZone.pointWS.x = (Coordinats.shared.mountain.pointWS.x + CGFloat(Coordinats.shared.startPosX))/2
        Coordinats.shared.poolZone.pointWS.y = rect.height - Coordinats.shared.poolZone.pointWS.x
        Coordinats.shared.poolZone.pointSE.x = Coordinats.shared.mountain.pointSE.x + Coordinats.shared.poolZone.pointWS.x - CGFloat(Coordinats.shared.startPosX)

        Coordinats.shared.poolZone.pointSE.y = Coordinats.shared.poolZone.pointWS.y
        
    }
    
    func drawCentre(_ rect : CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setStrokeColor(colorLines.cgColor)
        context.setLineWidth(widthLines)
        context.addArc(center: CGPoint(x: Coordinats.shared.centre.x, y: Coordinats.shared.centre.y),
                       radius: Coordinats.shared.radius,
                       startAngle: 0, endAngle: 2 * CGFloat(Double.pi), clockwise: true)
        context.strokePath()
    }
    
    func drawPoolForThree(_ rect : CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setStrokeColor(colorLines.cgColor)
        context.setLineWidth(widthLines)
        
        
        //Borders lines.
        // down right "\"
        context.move(to: CGPoint(
            x: Coordinats.shared.circle.pointSE.x,
            y: Coordinats.shared.circle.pointSE.y))
        context.addLine(to: CGPoint(x: rect.maxX-borderArea,y: rect.maxY-borderArea))
        
        // down left                  "/"
        context.move(to: CGPoint(
            x: Coordinats.shared.circle.pointWS.x,
            y: Coordinats.shared.circle.pointWS.y))
        context.addLine(to: CGPoint(x: borderArea,y: rect.maxY - borderArea))

        // up centre                  "|"
        context.move(to: CGPoint(x: rect.midX,
                                 y: rect.midY - Coordinats.shared.radius))
        context.addLine(to: CGPoint(x: rect.midX,y: 0))
        
        //Mounts lines. Pool -> Mount.
        //Left.  "|"
        context.move(to: CGPoint(x: Coordinats.shared.mountain.pointWS.x,
                                 y: Coordinats.shared.mountain.pointWS.y))
        context.addLine(to: CGPoint(x: Coordinats.shared.mountain.pointWS.x,
                                    y: 0))
        
        //Right.  "|"
        context.move(to: CGPoint(x: Coordinats.shared.mountain.pointSE.x,
                                 y: Coordinats.shared.mountain.pointSE.y))
        context.addLine(to: CGPoint(x: Coordinats.shared.mountain.pointSE.x,
                                    y: 0))
        
        //Under "-"
        context.move(to: CGPoint(x: Coordinats.shared.mountain.pointWS.x,
                                 y: Coordinats.shared.mountain.pointWS.y))
        context.addLine(to: CGPoint(x: Coordinats.shared.mountain.pointSE.x,
                                    y: Coordinats.shared.mountain.pointSE.y))
        
        //Pool Zone
        // Left.  "|"
        context.move(to: CGPoint(x: Coordinats.shared.poolZone.pointWS.x,
                                 y: Coordinats.shared.poolZone.pointWS.y))
        context.addLine(to: CGPoint(x: Coordinats.shared.poolZone.pointWS.x,
                                    y: 0))
        //Right.  "|"
        context.move(to: CGPoint(x: Coordinats.shared.poolZone.pointSE.x,
                                 y: Coordinats.shared.poolZone.pointSE.y))
        context.addLine(to: CGPoint(x: Coordinats.shared.poolZone.pointSE.x,
                                    y: 0))
        //Under "-"
        context.move(to: CGPoint(x: Coordinats.shared.poolZone.pointWS.x,
                                 y: Coordinats.shared.poolZone.pointWS.y))
        context.addLine(to: CGPoint(x: Coordinats.shared.poolZone.pointSE.x,
                                    y: Coordinats.shared.poolZone.pointSE.y))
        //Wist Zone
        // West
        context.move(to: CGPoint(x: borderArea,
                                 y: Coordinats.shared.centre.y))
        context.addLine(to: CGPoint(x: Coordinats.shared.poolZone.pointWS.x,
                                    y: Coordinats.shared.centre.y))
        // South
        context.move(to: CGPoint(x: Coordinats.shared.centre.x,
                                 y: Coordinats.shared.poolZone.pointWS.y))
        context.addLine(to: CGPoint(x: Coordinats.shared.centre.x,
                                    y: Coordinats.shared.body.height-borderArea))
        // East
        
        context.move(to: CGPoint(x: Coordinats.shared.poolZone.pointSE.x,
                                 y: Coordinats.shared.centre.y))
        context.addLine(to: CGPoint(x: Coordinats.shared.body.width-borderArea,
                                    y: Coordinats.shared.centre.y))
        
        //Pool lines. Pool -> Mount. Left.  "|"
//        context.move(to: CGPoint(x: (rect.midX + CGFloat(startPosX))/2, y: rect.height - (rect.midX + CGFloat(startPosX))/2))
//        context.addLine(to: CGPoint(x: (rect.midX + CGFloat(startPosX))/2,y: 0))
        
//        //Pool lines. Pool -> Mount. Right.  "|"
//        context.move(to: CGPoint(x: rect.midX + (rect.midX - CGFloat(startPosX))/2, y: rect.height - (rect.midX + CGFloat(startPosX))/2))
//        context.addLine(to: CGPoint(x: rect.midX + (rect.midX - CGFloat(startPosX))/2,y: 0))
//
//        //Pool lines. Pool -> Mount. Right.  "-"
//
//        context.move(to: CGPoint(x: (rect.midX + CGFloat(startPosX))/2, y: rect.height - (rect.midX + CGFloat(startPosX))/2))
//        context.addLine(to: CGPoint(x: rect.midX + (rect.midX - CGFloat(startPosX))/2,y: rect.height - (rect.midX + CGFloat(startPosX))/2))
        
        
        context.strokePath()
    }
}

/*
 let delta = Double(rect.width)*(radiusCentre)*cos(Double.pi/4)
 //        context.move(to: CGPoint(
 //                       x: CGFloat(rect.midX + CGFloat(delta)),
 //                       y: CGFloat(rect.midX + CGFloat(delta))))
 //        context.addLine(to: CGPoint(x: rect.maxX,y: rect.maxY))
 
 context.move(to: CGPoint(
 x: Coordinats.shared.circle.pointSE.x,
 y: Coordinats.shared.circle.pointSE.y))
 context.addLine(to: CGPoint(x: rect.maxX,y: rect.maxY))
 
 
 // down left                  "/"
 context.move(to: CGPoint(
 x: CGFloat(rect.midX - CGFloat(delta)),
 y: CGFloat(rect.midX + CGFloat(delta))))
 context.addLine(to: CGPoint(x: 0,y: rect.maxY))
 // up centre                  "|"
 context.move(to: CGPoint(x: rect.midX, y: CGFloat(rect.midY - CGFloat(Double(rect.width)*(radiusCentre)))))
 context.addLine(to: CGPoint(x: rect.midX,y: 0))
 
 //Mounts lines. Pool -> Mount. Left.  "|"
 let startPosX = Int(rect.width/2)%stepGrid
 context.move(to: CGPoint(x: (rect.midX + CGFloat(startPosX))/2, y: rect.height - (rect.midX + CGFloat(startPosX))/2))
 context.addLine(to: CGPoint(x: (rect.midX + CGFloat(startPosX))/2,y: 0))
 
 //Mounts lines. Pool -> Mount. Right.  "|"
 context.move(to: CGPoint(x: rect.midX + (rect.midX - CGFloat(startPosX))/2, y: rect.height - (rect.midX + CGFloat(startPosX))/2))
 context.addLine(to: CGPoint(x: rect.midX + (rect.midX - CGFloat(startPosX))/2,y: 0))
 
 //Mounts lines. Pool -> Mount. Right.  "-"
 
 context.move(to: CGPoint(x: (rect.midX + CGFloat(startPosX))/2, y: rect.height - (rect.midX + CGFloat(startPosX))/2))
 context.addLine(to: CGPoint(x: rect.midX + (rect.midX - CGFloat(startPosX))/2,y: rect.height - (rect.midX + CGFloat(startPosX))/2))
 
 //Pool lines. Pool -> Mount. Left.  "|"
 context.move(to: CGPoint(x: (rect.midX + CGFloat(startPosX))/2, y: rect.height - (rect.midX + CGFloat(startPosX))/2))
 context.addLine(to: CGPoint(x: (rect.midX + CGFloat(startPosX))/2,y: 0))
 */
