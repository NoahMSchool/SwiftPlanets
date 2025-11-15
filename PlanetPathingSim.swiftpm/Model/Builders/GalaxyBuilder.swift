import Foundation

class GalaxyBuilder{
    static let planetNames = [
        "Auralis", "Astrion", "Arkena", "Azorith",
        "Borealis", "Brathos", "Bythoria", "Benzar",
        "Calystria", "Celthos", "Crython", "Cygnara",
        "Drakontha", "Dythor", "Damaris", "Draxion",
        "Erythion", "Eldara", "Exion", "Echiron",
        "Faryth", "Fendara", "Fyrax", "Folvus",
        "Glythos", "Ghoran", "Garnith", "Gelyra",
        "Heliara", "Hyphos", "Havoth", "Hextara",
        "Icarion", "Iskora", "Ixarith", "Illthos",
        "Jovareth", "Jenthos", "Jyxor", "Jundara",
        "Kythera", "Krythos", "Kaldris", "Korvath",
        "Lunethra", "Lazeth", "Lyvion", "Lythara",
        "Maelvion", "Mordaris", "Mythos", "Mazora",
        "Nyxara", "Nythion", "Nolvus", "Nexara",
        "Oberion", "Odythos", "Onthara", "Orivon",
        "Pyrrhion", "Phalora", "Pexis", "Prolyth",
        "Quorath", "Qytheris", "Qyldor", "Quivara",
        "Rhyzora", "Raldith", "Ryphos", "Remthar",
        "Solaryn", "Sylvaris", "Sythron", "Selkora",
        "Tyranthos", "Tylvion", "Threxos", "Tandara",
        "Umbryth", "Ulvora", "Uxaris", "Unthara",
        "Vyridia", "Vaelith", "Vyssara", "Vorthex",
        "Wytheris", "Waldora", "Wrythion", "Wexara",
        "Xelthar", "Xyphos", "Xandros", "Xovira",
        "Yzendra", "Ythorin", "Ylthos", "Yndara",
        "Zephyros", "Zyphara", "Zenthos", "Zolaris"
    ]
    
    // Takes in a grid and a planetCount and generates a list of planets
    class func createPlanets(planetCount: Int, spacing : Double = 100, mapSize : Double = 1000)->[Planet]{
        return []
    }
  
    //Takes list of planets and max distance and returns a array of tuples of weighted paths
        class func calculatePlanetPaths(planets : [Planet], maxDistance : CGFloat)->[(start : Planet, end : Planet, distance : Double)]{
            return []
        }
}

