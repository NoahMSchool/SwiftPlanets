import SpriteKit

class StarryBackgroundNode : SKNode{
    var stars : SKNode
    init(size : Int, starCount : Int){
        self.stars = SKNode()
        super.init()
        self.stars = getStarryBackground(size : size, starCount : starCount)
        addChild(self.stars)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func getStarryBackground(size : Int, starCount : Int)->SKNode{
        let stars = SKNode()
        for _ in 0...starCount{
            let position = CGPoint(x: Int.random(in: -size...size), y: Int.random(in: -size...size))
            
            let star = SKShapeNode(circleOfRadius: 0.5)
            star.glowWidth = 0.5
            star.position = position
            stars.addChild(star)
        }
        return stars
    }
}
