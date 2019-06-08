//
//  Background.swift
//  Preferans.Pool
//
//  Created by Anton Rubenchik on 02/06/2019.
//  Copyright © 2019 Anton Rubenchik. All rights reserved.
//

import UIKit

@IBDesignable
class Background: UIView {
    
    override func draw(_ rect: CGRect) {
        // пересчет шага
        fillBackGround(rect,backGroundColor)
        drawGrid(rect)
    }

    func drawGrid(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setStrokeColor(colorGrid.cgColor)
        context.setLineWidth(widthGrid)
        let countLines = Int(Int(rect.height)/stepGrid)
        let startPosY = Int(rect.height/2)%stepGrid
        let startPosX = Int(rect.width/2)%stepGrid
        for i in 0...countLines {
            context.move(to: CGPoint(x: 0, y: (startPosY+i*stepGrid)))
            context.addLine(to: CGPoint(x: rect.width,y: CGFloat(startPosY+i*stepGrid)))

            if (startPosX+i*stepGrid) < Int(rect.width) {
                context.move(to: CGPoint(x: startPosX+i*stepGrid, y: 0))
                context.addLine(to: CGPoint(x: CGFloat(startPosX+i*stepGrid),y: rect.height))
            }
        }
        context.strokePath()
        
    }
    
    func fillBackGround(_ rect: CGRect,_ color: UIColor) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(UIColor.clear.cgColor)
        context.addRect(rect)
        context.setFillColor(color.cgColor)
        context.fillPath()
        context.strokePath()
    }
    
    
    // only for test
    func drawGoal(_ rect: CGRect,_ color: CGColor) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setStrokeColor(color)
        context.setLineWidth(1.0)
        context.move(to: CGPoint(x: rect.midX - 20, y: rect.midY))
        context.addLine(to: CGPoint(x: rect.midX + 20,y: rect.midY))
        
        context.move(to: CGPoint(x: rect.midX, y: rect.midY - 20))
        context.addLine(to: CGPoint(x: rect.midX,y: rect.midY + 20))
        context.strokePath()
        
    }
}





// test draw rect and fill
func fillBackGround2(rect: CGRect, color: UIColor) {
    //        guard let context = UIGraphicsGetCurrentContext() else { return }
    //        context.setFillColor(UIColor.clear.cgColor)
    //        context.beginPath()
    //        context.move(to: CGPoint(x: 100, y: 100))
    //        context.addLine(to: CGPoint(x: 100,y: 200))
    //        context.addLine(to: CGPoint(x: 200,y: 200))
    //        context.addLine(to: CGPoint(x: 200,y: 100))
    //        context.closePath()
    //        context.setFillColor(color.cgColor)
    //        context.fillPath()
    //        context.strokePath()
}
