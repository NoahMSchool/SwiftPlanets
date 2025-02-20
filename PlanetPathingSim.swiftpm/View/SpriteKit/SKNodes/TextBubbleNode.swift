import SpriteKit

class TextBubbleNode : SKNode{
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
        self.border = SKShapeNode()
        
        super.init()
        
        recalculateBorderSize()
        
        labelText.zPosition = 3
        
        addChild(labelText)        
    }
    func changeLabelText(newText : String){
        self.labelText.text = newText
        recalculateBorderSize()
    }
    
    func recalculateBorderSize(){
        self.border.removeFromParent()
        guard labelText.text != "" else{return}
        let textSize = labelText.frame.size
        let newBorderWidth = textSize.width+padding
        let newBorderHeight = textSize.height+padding
        let rectangle : CGRect = CGRect(x: -newBorderWidth/2, y: -newBorderHeight/2, width: newBorderWidth, height: newBorderHeight)
        self.border = SKShapeNode(rect: rectangle, cornerRadius: 10)
        self.border.fillColor = .black
        self.border.strokeColor = .darkGray
        self.border.lineWidth = 1
        self.border.zPosition = 2

        addChild(border)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
