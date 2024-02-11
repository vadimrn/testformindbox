//
//  ShapeTests.swift
//  ShapeTests
//
//  Created by Vadim Nuretdinov on 10.02.2024.
//

import Foundation

protocol Shape {
    func area() -> Double
}

struct Circle: Shape {
    var radius: Double
    
    func area() -> Double {
        return .pi * pow(radius, 2)
    }
}

struct Triangle: Shape {
    var a, b, c: Double // Стороны треугольника
    
    func area() -> Double {
        let s = (a + b + c) / 2
        return sqrt(s * (s - a) * (s - b) * (s - c))
    }
    
    func isRightAngled() -> Bool {
        let sides = [a, b, c].sorted()
        return abs(sides[2] * sides[2] - (sides[0] * sides[0] + sides[1] * sides[1])) < 0.000001
    }
}

class ShapeCalculator {
    static func calculateArea(of shape: Shape) -> Double {
        return shape.area()
    }
    
    static func checkIfTriangleIsRightAngled(_ triangle: Triangle) -> Bool {
        return triangle.isRightAngled()
    }
    
    static func main() {
        let circle = Circle(radius: 5)
        let triangle = Triangle(a: 3, b: 4, c: 5)
        
        print("Площадь круга: \(calculateArea(of: circle))")
        print("Площадь треугольника: \(calculateArea(of: triangle))")
        
        if checkIfTriangleIsRightAngled(triangle) {
            print("Треугoльник прямоугольный.")
        }
    }
}

ShapeCalculator.main()

