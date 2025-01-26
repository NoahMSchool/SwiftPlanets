import SpriteKit

class Galaxy : ObservableObject{
    @Published var name : String = "StarWars"
    var planets : [Planet]
    var startPlanet : Planet?
    var endPlanet : Planet?
    @Published var path : BFS?
    var ship : Ship?
    var shape : SKNode
    var planetNames = ["Nyxalith","Threxion","Vraquor","Zyrrholl","Quintirax","Olorhyn","Xanthevir","Brakkithar","Yllithra","Phorvynax","Zephyros","Calystria", "Umbryth","Solaryn","Noctivis","Vyridia","Erythion","Auralis","Drakontha","Lunethra"]
    
    init(){
        self.planets = []
        self.shape = SKNode()
        self.buildRandomGalaxy(planetCount: 20)
        self.startPlanet = randomPlanet()
        self.endPlanet = randomPlanet()
        if let startPlanet = startPlanet, let endPlanet = endPlanet{
            self.path = BFS(start: startPlanet, end: endPlanet)
        }
        self.ship = Ship(galaxy: self, planet: startPlanet!) 
        self.shape.addChild(ship!.getShape())

    }
    /*
    func startGame(){
        if let startPlanet = startPlanet, let endPlanet = endPlanet{
            let path = BFS(start: startPlanet, end: endPlanet)
            print("=======================================================")
            while !path.completed{
                path.nextstep()                                
                path.showState()  
                for p in path.explored{
                    if let planet = p as? Planet{
                        //planet.shape.fillColor = .blue
                        planet.state = .found
                    }                
                }
            }
            
            startPlanet.state = .start
            endPlanet.state = .treasure
        }
        
        self.ship = Ship(galaxy: self, planet: startPlanet!) 
        self.shape.addChild(ship!.getShape())
    }
    */
    
    func nextStep(){
        guard let path = self.path else{return}
        path.nextstep()
        //name = path.explanation
        name = "something"
    }
    
    func getShape()->SKNode{
        shape
    }
    func getPlanets()-> [Planet]{
        self.planets
    }
    func randomPlanet()->Planet?{
        planets.randomElement()
    }
    
    func addPlanet(planet : Planet){
        self.planets.append(planet)
    }
    
    func buildRandomGalaxy(planetCount: Int, spacing : Double = 100, mapSize : Double = 1000){
        self.startPlanet = nil
        self.endPlanet = nil
        var options : [CGPoint] = []
        let offset : Double = 50
        for y in stride(from: 0, to: mapSize, by: spacing){
            for x in stride(from: 0, to: mapSize, by: spacing){
                options.append(CGPoint(x: x+offset, y: y+offset))
            }
        }
        options = options.shuffled()
        planetNames = planetNames.shuffled()
        for i in 0...planetCount{
            var name = "No Name \(i)"
            if !planetNames.isEmpty{
                name = planetNames.removeFirst()
            }
            let planet = Planet(galaxy: self, position: options[i], name: name)
            self.addPlanet(planet : planet)
            self.shape.addChild(planet.getShape())
            
        }        
    }
    func buildTestGalaxy(){
        let noah = Planet(galaxy: self, position: CGPoint(x: 200, y: 400), name: "Noah")
        let jon = Planet(galaxy: self, position: CGPoint(x: 400, y: 600), name: "Jon")
        let rocco = Planet(galaxy: self, position: CGPoint(x: 500, y: 250), name: "Rocco")
        let rambo = Planet(galaxy: self, position: CGPoint(x: 700, y: 350), name: "Rambo")
        
        self.shape.addChild(noah.getShape())
        self.shape.addChild(jon.getShape())
        self.shape.addChild(rocco.getShape())
        self.shape.addChild(rambo.getShape())
        
        self.addPlanet(planet: noah)
        self.addPlanet(planet: jon)
        self.addPlanet(planet: rocco)
        self.addPlanet(planet: rambo)
        
        self.startPlanet = noah
        self.endPlanet = rambo
        
    }
}
