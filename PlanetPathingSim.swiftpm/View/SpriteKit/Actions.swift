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

func moveNode(to position: CGPoint, duration: TimeInterval) -> SKAction {
    
    let moveAction = SKAction.move(to: position, duration: 1.0)
    moveAction.timingMode = .easeInEaseOut // Smooth start and stop
    
    let grow = SKAction.scale(to: 1.4, duration: duration)
    let shrink = SKAction.scale(to: 1, duration: duration)
    grow.timingMode = .easeInEaseOut
    shrink.timingMode = .easeInEaseOut
    let pulseAction = SKAction.sequence([grow, shrink])
    
    // Repeat pulsing while moving
    let repeatPulse = SKAction.repeat(pulseAction, count: 1)
    
    // Run both move and pulse actions together
    let groupAction = SKAction.group([moveAction, repeatPulse])
    
    return groupAction
}
