import SpriteKit

extension CGPoint{
    static func findDistance(c1 : CGPoint, c2 : CGPoint)-> Double{
        sqrt(pow(c2.x-c1.x,2)+pow(c2.y-c1.y, 2))
    }
    
    static func lerpPoints(c1 : CGPoint, c2 : CGPoint, amount : Double)-> CGPoint{
        CGPoint(x: (c2.x-c1.x)*amount+c1.x, y: (c2.y-c1.y)*amount+c1.y)
    }
}

//func noahCheckIntersection(l1 : (p1 : CGPoint, p2 : CGPoint), l2 : (p1 : CGPoint, p2 : CGPoint)){
//    l1Equation = (grad : l1.p2.y-l1.p1.y/l1.p2.x-l1.p1.x, )
//}

func checkIntersections(p1: CGPoint, q1: CGPoint, p2: CGPoint, q2: CGPoint) -> Bool {
    func orientation(_ a: CGPoint, _ b: CGPoint, _ c: CGPoint) -> Int {
        let val = (b.y - a.y) * (c.x - b.x) - (b.x - a.x) * (c.y - b.y)
        return (val > 0) ? 1 : -1 // Clockwise or Counterclockwise
    }
    
    let o1 = orientation(p1, q1, p2)
    let o2 = orientation(p1, q1, q2)
    let o3 = orientation(p2, q2, p1)
    let o4 = orientation(p2, q2, q1)
    
    return (o1 != o2) && (o3 != o4) // True if straddling
}
