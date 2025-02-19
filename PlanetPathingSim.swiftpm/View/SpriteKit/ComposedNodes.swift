import SpriteKit




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


