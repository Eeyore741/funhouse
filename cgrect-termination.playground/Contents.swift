import Foundation
import UIKit

private extension CGRect {
    
    /// Least float *magic number* that can help to determine last point in the rect
    private var leastRectTerminationFloat: CGFloat { 1 / 1e15 }
    
    /// `Termination` describes an end-point of given rect. It is an opposite of `Origin`
    var termination: CGPoint {
        CGPoint(x: self.maxX - leastRectTerminationFloat, y: self.maxY - leastRectTerminationFloat)
    }
}

let rect = CGRect(x: 0, y: 0, width: 10, height: 10)

let maxPoint = CGPoint(x: rect.maxX, y: rect.maxY)
let nextDownPoint = CGPoint(x: rect.maxX.nextDown, y: rect.maxY.nextDown)

let containsMaxPoint = rect.contains(maxPoint)
let containsNextDownPoint = rect.contains(nextDownPoint)

let x0 = CGFloat.leastNonzeroMagnitude
let x1 = CGFloat.leastNormalMagnitude
