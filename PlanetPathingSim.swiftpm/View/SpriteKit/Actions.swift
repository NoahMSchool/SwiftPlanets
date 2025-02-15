import SpriteKit

func createPulsingAction(scaleAmount: CGFloat, duration: TimeInterval) -> SKAction {
    let scaleUp = SKAction.scale(to: scaleAmount, duration: duration)
    let scaleDown = SKAction.scale(to: 1.0, duration: duration)
    let sequence = SKAction.sequence([scaleUp, scaleDown])
    return SKAction.repeatForever(sequence)
}

func createPulsingAndFadingAction(scaleAmount: CGFloat, duration: TimeInterval) -> SKAction {
    let scaleUp = SKAction.scale(to: scaleAmount, duration: duration)
    let fadeOut = SKAction.fadeAlpha(to: 0.5, duration: duration)
    
    let scaleDown = SKAction.scale(to: 1.0, duration: duration)
    let fadeIn = SKAction.fadeAlpha(to: 1.0, duration: duration)
    
    let groupUp = SKAction.group([scaleUp, fadeOut])
    let groupDown = SKAction.group([scaleDown, fadeIn])
    
    let sequence = SKAction.sequence([groupUp, groupDown])
    return SKAction.repeatForever(sequence)
}

func moveNode(from : CGPoint, to : CGPoint, duration: TimeInterval) -> SKAction {
    
    let dy = to.y-from.y
    let dx = to.x-from.x
    let direction = -atan2(dx, dy)
    let rotatePlanet = SKAction.rotate(toAngle: direction, duration: 0.25, shortestUnitArc: true)
    let rotateNorth = SKAction.rotate(toAngle: 0, duration: 0.25)
    
    let moveAction = SKAction.move(to: to, duration: 1.0)
    moveAction.timingMode = .easeInEaseOut

    let shrink = SKAction.scale(to: 0.8, duration: duration)    
    let grow = SKAction.scale(to: 1, duration: duration)

    grow.timingMode = .easeInEaseOut
    shrink.timingMode = .easeInEaseOut
    let shrinkGrow = SKAction.sequence([shrink, grow])
    let groupAction = SKAction.sequence([rotatePlanet, SKAction.group([moveAction, shrinkGrow]), rotateNorth])
    
    return groupAction
}
