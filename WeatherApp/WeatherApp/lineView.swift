//
//  lineView.swift
//  WeatherApp
//
//  Created by Decagon on 26/04/2021.
//

import UIKit

class lineView: UIView {

    var line = UIBezierPath()
    func graph(){
        line.move(to: .init(x: 0, y: bounds.height))
        line.addLine(to: .init(x: bounds.width, y: bounds.height))
        UIColor.white.setStroke()
        line.lineWidth = 2
        line.stroke()
        
    }
    override func draw(_ rect: CGRect) {
        graph()
    }


}
