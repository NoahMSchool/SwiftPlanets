import SpriteKit

class PlanetNode : SKNode{
    let planet : SKShapeNode
    let border : SKShapeNode
    let planetLabel : TextBubble
    let planetColors : [UIColor] = [.green, .orange, .red, .blue, .magenta, .cyan]
    
    init(planetName : String) {
        self.planet = SKShapeNode(circleOfRadius: 10)
        self.border = SKShapeNode(circleOfRadius: 25)
        self.planetLabel = TextBubble(textString: planetName)
        
        planetLabel.position = CGPoint(x: 0, y: 40)
        
        planet.fillColor = planetColors.randomElement()!
        planet.strokeColor = .clear
        
        //TODO make universal line width control
        border.strokeColor = .darkGray
        border.lineWidth = 2
        border.fillColor = .black
        super.init()

        addChild(border)        
        addChild(planet)
        addChild(planetLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    func changeBorder(color : UIColor){
        border.strokeColor = color
    }
}


class TextBubble : SKNode{
    var labelText : SKLabelNode
    var border : SKShapeNode
    let minWidth : CGFloat = 10
    let maxWidth : CGFloat = 100
    let minHeight : CGFloat = 10
    let maxHeight : CGFloat = 100
    let padding : CGFloat = 10
    
    init(textString: String) {
        self.labelText = SKLabelNode(text: textString)        
        
        labelText.fontSize = 10
        labelText.fontName = "ChalkDuster"
        labelText.verticalAlignmentMode = .center
        labelText.horizontalAlignmentMode = .center
        
        let textSize = labelText.frame.size
        
        var borderHeight = max(minHeight, min(textSize.height + padding, maxHeight))
        var borderWidth = max(minWidth, min(textSize.width + padding, maxWidth))
        
        self.border = SKShapeNode(rect : CGRect(x: -borderWidth / 2, y: -borderHeight / 2, width: borderWidth, height: borderHeight), cornerRadius: 10)
        
        border.fillColor = .black
        border.strokeColor = .darkGray
        border.lineWidth = 2
        
        super.init()
        
        addChild(border)
        addChild(labelText)        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    

