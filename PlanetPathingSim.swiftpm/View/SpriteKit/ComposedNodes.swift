import SpriteKit

class PlanetNode : SKNode{
    var planet : SKNode
    let border : SKShapeNode
    let planetNameLabel : TextBubble
    let planetUILabel : TextBubble
    let planetColors: [UIColor] =  [
        UIColor(red: 0.5, green: 0.75, blue: 0.9, alpha: 1.0),
        UIColor(red: 0.4, green: 0.6, blue: 0.8, alpha: 1.0),
        UIColor(red: 0.6, green: 0.8, blue: 0.5, alpha: 1.0),
        UIColor(red: 0.85, green: 0.75, blue: 0.4, alpha: 1.0),
        UIColor(red: 0.7, green: 0.5, blue: 0.9, alpha: 1.0),
        UIColor(red: 0.6, green: 0.7, blue: 0.85, alpha: 1.0),
        UIColor(red: 0.85, green: 0.55, blue: 0.6, alpha: 1.0),
        UIColor(red: 0.55, green: 0.55, blue: 0.65, alpha: 1.0),
        UIColor(red: 0.7, green: 0.85, blue: 0.75, alpha: 1.0),
        UIColor(red: 0.75, green: 0.65, blue: 0.9, alpha: 1.0),
        UIColor(red: 0.5, green: 0.8, blue: 0.7, alpha: 1.0),
        UIColor(red: 0.8, green: 0.6, blue: 0.9, alpha: 1.0)
    ]
    
    init(planetName : String, borderRadius : CGFloat) {
        //self.planet = SKShapeNode(circleOfRadius: CGFloat(Int.random(in: planetSizeMin...planetSizeMax)))
        self.border = SKShapeNode(circleOfRadius: borderRadius)
        self.planetNameLabel = TextBubble(textString: planetName)
        self.planetUILabel = TextBubble(textString: "UILabel")
        self.planet = SKNode()
        planetNameLabel.position = CGPoint(x: 0, y: 35)
        planetUILabel.position = CGPoint(x: 0, y: -35)
        //        planet.fillColor = planetColors.randomElement()!
        //planet.strokeColor = .clear
        
        //TODO make universal line width control
        border.lineWidth = 2
        border.fillColor = .black
        super.init()
        
        self.planet = generatePlanet(baseColor: planetColors.randomElement()!, accentColor: planetColors.randomElement()!, size: CGFloat(Int.random(in: 3...10)))
        addChild(border)        
        addChild(planet)
        addChild(planetUILabel)
        addChild(planetNameLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeBorder(color : UIColor){
        border.strokeColor = color
    }
    func setPlanetNameLabel(color : UIColor){
        self.planetNameLabel.border.strokeColor = color
    }
    func generatePlanet(baseColor: UIColor, accentColor: UIColor, size: CGFloat) -> SKNode {
        let planetNode = SKNode()
        let planetBody = SKShapeNode(circleOfRadius: size)
        planetBody.fillColor = baseColor
        planetBody.strokeColor = accentColor
        planetBody.glowWidth = 1.0
        planetNode.addChild(planetBody)
        
        
        return planetNode
    }
}


class TextBubble : SKNode{
    var labelText : SKLabelNode
    var border : SKShapeNode
    let minWidth : CGFloat = 5
    let maxWidth : CGFloat = 50
    let minHeight : CGFloat = 5
    let maxHeight : CGFloat = 50
    let padding : CGFloat = 5
    
    init(textString: String) {
        self.labelText = SKLabelNode(text: textString)        
        
        labelText.fontSize = 8
        labelText.fontName = "ChalkDuster"
        labelText.verticalAlignmentMode = .center
        labelText.horizontalAlignmentMode = .center
        
        let textSize = labelText.frame.size
        
        var borderHeight = max(minHeight, min(textSize.height + padding, maxHeight))
        var borderWidth = max(minWidth, min(textSize.width + padding, maxWidth))
        
        self.border = SKShapeNode(rect : CGRect(x: -borderWidth / 2, y: -borderHeight / 2, width: borderWidth, height: borderHeight), cornerRadius: 10)
        
        border.fillColor = .black
        border.strokeColor = .darkGray
        border.lineWidth = 1
        
        super.init()
        border.zPosition = 2
        labelText.zPosition = 3
        
        addChild(border)
        addChild(labelText)        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class StarryBackround : SKNode{
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
        for i in 0...starCount{
            let position = CGPoint(x: Int.random(in: -size...size), y: Int.random(in: -size...size))
            
            let star = SKShapeNode(circleOfRadius: 0.5)
            star.glowWidth = 0.5
            star.position = position
            stars.addChild(star)
        }
        let centre = SKShapeNode(circleOfRadius: 10)
        return stars
    }
}
