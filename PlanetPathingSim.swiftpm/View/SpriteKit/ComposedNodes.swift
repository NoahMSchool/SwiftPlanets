import SpriteKit

class PlanetNode : SKNode{
    let planet : SKShapeNode
    let border : SKShapeNode
    let planetColors : [UIColor] = [.green, .orange, .red, .blue, .magenta, .cyan]
    
    init(planetName : String) {
        self.planet = SKShapeNode(circleOfRadius: 10)
        self.border = SKShapeNode(circleOfRadius: 25)
        
        
        planet.fillColor = planetColors.randomElement()!
        planet.strokeColor = .clear
        
        //TODO make universal line width control
        border.strokeColor = .darkGray
        border.lineWidth = 2
        border.fillColor = .black
        super.init()

        addChild(border)        
        addChild(planet)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    func changeBorder(color : UIColor){
        border.strokeColor = color
    }
}
