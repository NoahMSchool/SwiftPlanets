import SpriteKit

func drawLine(from start: CGPoint, to end: CGPoint, lineWidth: CGFloat, color: UIColor) -> SKNode{
    let path = CGMutablePath()
    path.move(to: start)
    path.addLine(to: end)
    let line = SKShapeNode(path: path)
    line.zPosition = 0
    line.strokeColor = color
    return line    
}

func drawArrow(from start: CGPoint, to end: CGPoint, lineWidth: CGFloat, arrowSize: CGFloat, color: UIColor) -> SKNode {
    let arrowNode = SKNode() // Container for the line and arrowhead
    
    // 1. Draw the line
    let line = drawLine(from: start, to: end, lineWidth: lineWidth, color: color)    

    arrowNode.addChild(line)
    
    // 2. Calculate the angle of the line
    let dx = end.x - start.x
    let dy = end.y - start.y
    let angle = atan2(dy, dx) // Rotation in radians
    
    // 3. Create an arrowhead (triangle)
    let arrowPath = CGMutablePath()
    arrowPath.move(to: CGPoint(x: 0, y: 0))
    arrowPath.addLine(to: CGPoint(x: -arrowSize, y: arrowSize / 2))
    arrowPath.addLine(to: CGPoint(x: -arrowSize, y: -arrowSize / 2))
    arrowPath.closeSubpath()
    
    let arrowheadFirst = SKShapeNode(path: arrowPath)
    let arrowheadSecond = SKShapeNode(path: arrowPath)

    arrowheadFirst.fillColor = color
    arrowheadFirst.strokeColor = color
    
    arrowheadSecond.fillColor = color
    arrowheadSecond.strokeColor = color
    
    // 4. Position & rotate the arrowhead
    arrowheadFirst.position = CGPoint(x: (end.x-start.x)/3+start.x, y: ((end.y-start.y)/3+start.y))
    arrowheadSecond.position = CGPoint(x: (end.x-start.x)*2/3+start.x, y: ((end.y-start.y)*2/3+start.y))
    
    arrowheadFirst.zRotation = angle // Rotate to match the line direction
    arrowheadSecond.zRotation = angle // Rotate to match the line direction
    
    arrowNode.addChild(arrowheadFirst)
    arrowNode.addChild(arrowheadSecond)
    
    return arrowNode
}    

func drawlines(lines : [(start : CGPoint, end : CGPoint, weight : Double?)], lineWidth: CGFloat, color: UIColor)-> SKNode{
    let linesNodes : SKNode = SKNode()
    var count = 0
    for line in lines{
        count += 1
        let skLine = drawLine(from : line.start, to : line.end, lineWidth: lineWidth, color: color)
        linesNodes.addChild(skLine)
        if let weight = line.weight{
            let weightLabel = TextBubble(textString: String(Int(weight)))
            weightLabel.position = CGPoint(x: (line.start.x + line.end.x)/2, y: (line.start.y + line.end.y)/2)
            skLine.addChild(weightLabel)
        }
    }
    return linesNodes
}

