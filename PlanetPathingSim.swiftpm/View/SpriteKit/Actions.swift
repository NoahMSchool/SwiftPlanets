import SpriteKit

func createPulsingAction(scaleAmount: CGFloat, duration: TimeInterval) -> SKAction {
    let scaleUp = SKAction.scale(to: scaleAmount, duration: duration)
    let scaleDown = SKAction.scale(to: 1.0, duration: duration)
    let sequence = SKAction.sequence([scaleUp, scaleDown])
    return SKAction.repeatForever(sequence)
}

func moveNode(from : CGPoint, to : CGPoint, duration: TimeInterval) -> SKAction {
    
    let dy = to.y-from.y
    let dx = to.x-from.x
    let direction = -atan2(dx, dy)
    let rotatePlanet = SKAction.rotate(toAngle: direction, duration: 0.25, shortestUnitArc: true)
    
    let moveAction = SKAction.move(to: to, duration: duration)
    moveAction.timingMode = .easeInEaseOut

    let shrink = SKAction.scale(to: 0.8, duration: duration)    
    let grow = SKAction.scale(to: 1, duration: duration)

    grow.timingMode = .easeInEaseOut
    shrink.timingMode = .easeInEaseOut
    let shrinkGrow = SKAction.sequence([shrink, grow])
    let groupAction = SKAction.sequence([rotatePlanet, SKAction.group([moveAction, shrinkGrow])])
    
    return groupAction
}
func moveMultipleNodes(planetOrder: [Planet], duration: TimeInterval) -> SKAction{
    let rotateNorth = SKAction.rotate(toAngle: 0, duration: 0.25)
    var groupMove : [SKAction] = []
    if planetOrder.count>1{
//        let singleDuration = duration/TimeInterval(planetOrder.count)
        let singleDuration = 0.5
        for i in 0...planetOrder.count-2{
            groupMove.append(moveNode(from: planetOrder[i].position, to: planetOrder[i+1].position, duration: singleDuration))
        }
    }
    groupMove.append(rotateNorth)
    let finalMove = SKAction.sequence(groupMove)
    return finalMove
}

func ringPulseAction(scaleBy : CGFloat) -> SKAction{
    let grow = SKAction.scale(by: scaleBy, duration: 1)
    let fade = SKAction.fadeOut(withDuration: 1.5)
    let groupAction = SKAction.group([grow, fade])
    return groupAction
}
