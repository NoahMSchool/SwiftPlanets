import SpriteKit

extension CGPoint{
    static func findDistance(c1 : CGPoint, c2 : CGPoint)-> Double{
        sqrt(pow(c2.x-c1.x,2)+pow(c2.y-c1.y, 2))
    }
    
    static func lerpPoints(c1 : CGPoint, c2 : CGPoint, amount : Double)-> CGPoint{
        CGPoint(x: (c2.x-c1.x)*amount+c1.x, y: (c2.y-c1.y)*amount+c1.y)
    }
}
