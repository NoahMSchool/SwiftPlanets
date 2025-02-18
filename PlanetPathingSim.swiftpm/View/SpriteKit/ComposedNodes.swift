import SpriteKit

class PlanetNode : SKNode{
    let border : SKShapeNode
    let planetLabel : TextBubble
    let planetColors : [UIColor] = [.green, .orange, .red, .blue, .magenta, .cyan]
    
    let planetColors: [UIColor] =  [
        UIColor(red: 0.5, green: 0.75, blue: 0.9, alpha: 1.0),  // Vibrant Sky Blue
        UIColor(red: 0.4, green: 0.6, blue: 0.8, alpha: 1.0),   // Deep Cerulean
    init(planetName : String, borderRadius : CGFloat) {
        self.planet = SKShapeNode(circleOfRadius: 10)
        self.border = SKShapeNode(circleOfRadius: borderRadius)
        self.planetLabel = TextBubble(textString: planetName)
        
        planetLabel.position = CGPoint(x: 0, y: 30)
        
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
        border.lineWidth = 2
        
        super.init()
        
        addChild(border)
        addChild(labelText)        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    

