import SpriteKit

extension CGPoint{
    static func findDistance(c1 : CGPoint, c2 : CGPoint)-> Double{
        sqrt(pow(c2.x-c1.x,2)+pow(c2.y-c1.y, 2))
    }
    
    static func lerpPoints(c1 : CGPoint, c2 : CGPoint, amount : Double)-> CGPoint{
        CGPoint(x: (c2.x-c1.x)*amount+c1.x, y: (c2.y-c1.y)*amount+c1.y)
    }
}

func checkIntersections(p1: CGPoint, q1: CGPoint, p2: CGPoint, q2: CGPoint) -> Bool {
    //using orientation algorithm to check if lines intersect
    func orientation(_ a: CGPoint, _ b: CGPoint, _ c: CGPoint) -> Int {
        let val = (b.y - a.y) * (c.x - b.x) - (b.x - a.x) * (c.y - b.y)
        return (val > 0) ? 1 : -1 // Clockwise or Counterclockwise
    }
    if p1 == q1 || p1 == q2 || p2 == q1 || p2 == q2{
        return false
    }
    let o1 = orientation(p1, q1, p2)
    let o2 = orientation(p1, q1, q2)
    let o3 = orientation(p2, q2, p1)
    let o4 = orientation(p2, q2, q1)
    
    return (o1 != o2) && (o3 != o4) // True if straddling
}
