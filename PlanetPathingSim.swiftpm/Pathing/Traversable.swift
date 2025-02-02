import Foundation

protocol Traversable: Identifiable {
    // This property requirement comes from Identifiable.
    var id: UUID { get }
    
    func getNeighbours()->[(neighbour : any Traversable, weight : Double)]
    func isEqual(to other: any Traversable) -> Bool
    
}
