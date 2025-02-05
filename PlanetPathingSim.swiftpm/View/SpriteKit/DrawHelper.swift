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
    
    let arrowhead = SKShapeNode(path: arrowPath)
    arrowhead.fillColor = color
    arrowhead.strokeColor = color
    
    // 4. Position & rotate the arrowhead
    arrowhead.position = CGPoint(x: (start.x + end.x)/2, y: (start.y + end.y)/2)
    arrowhead.zRotation = angle // Rotate to match the line direction
    
    arrowNode.addChild(arrowhead)
    
    return arrowNode
}    
