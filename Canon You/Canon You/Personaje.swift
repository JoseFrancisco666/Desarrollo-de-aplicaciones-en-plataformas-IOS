import Foundation

struct Personaje: Identifiable {
    let id = UUID()
    let nombre: String
    let categoria: CategoriaPsicologica
    let descripcion: String
    let nombreImagen: String // Nombre del archivo en Assets
}

enum CategoriaPsicologica: String {
    case villanoEstrategico = "Villano Estratégico Dominante"
    case idealistaMoral = "Idealista Moral"
    case rebeldeImpulsivo = "Rebelde Impulsivo"
    case intelectualFrio = "Intelectual Frío"
    case caoticoIntenso = "Caótico Impredecible"
}
