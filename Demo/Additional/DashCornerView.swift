//
//  DashCornerView.swift
//  Demo
//
//  Created by wOOx Technology on 16/11/22.
//

import UIKit
class DashedCircleView: UIView {
    private var shapeLayer: CAShapeLayer = {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.lineCap = .round
        return shapeLayer
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updatePath()
    }
}

private extension DashedCircleView {
    func configure() {
        layer.addSublayer(shapeLayer)
    }

    func updatePath() {
        let rect = bounds.insetBy(dx: shapeLayer.lineWidth / 2, dy: shapeLayer.lineWidth / 2)
        let radius = min(rect.width, rect.height) / 2
        let center = CGPoint(x: rect.midX, y: rect.midY)

        let path = UIBezierPath()
        let count = 4
        var relativeDashLength: CGFloat = 1.0
        if count != 1 {
            relativeDashLength = 0.9
        }
          //(2 * .pi * radius)/CGFloat(count)   // a value between 0 and 1
        let increment: CGFloat = .pi * 2 / CGFloat(count)

        for i in 0 ..< count {
            let startAngle = increment * CGFloat(i)
            let endAngle = startAngle + relativeDashLength * increment
            path.move(to: CGPoint(x: center.x + radius * cos(startAngle),
                                  y: center.y + radius * sin(startAngle)))
            path.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        }
        shapeLayer.path = path.cgPath
    }
}
