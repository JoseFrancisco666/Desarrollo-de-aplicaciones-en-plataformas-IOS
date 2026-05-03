import SwiftUI
import Combine

class CanonViewModel: ObservableObject {
    @Published var listaPersonajes: [Personaje] = [
        Personaje(nombre: "Batman", categoria: .intelectualFrio, descripcion: "Eres una mente analítica que prefiere la preparación.", nombreImagen: "batman"),
        Personaje(nombre: "Naruto", categoria: .idealistaMoral, descripcion: "Tu voluntad es inquebrantable y siempre buscas el bien común.", nombreImagen: "naruto"),
        Personaje(nombre: "Joker", categoria: .caoticoIntenso, descripcion: "Ves el mundo de forma diferente y no te asusta el desorden.", nombreImagen: "joker"),
        Personaje(nombre: "L Lawliet", categoria: .intelectualFrio, descripcion: "Tu intelecto es tu mayor arma.", nombreImagen: "l_lawliet"),
        Personaje(nombre: "Eren Yeager", categoria: .rebeldeImpulsivo, descripcion: "Luchas por tu libertad por encima de cualquier regla.", nombreImagen: "eren"),
        Personaje(nombre: "Spider-Man", categoria: .idealistaMoral, descripcion: "Entiendes que un gran poder conlleva una gran responsabilidad.", nombreImagen: "spiderman"),
        Personaje(nombre: "Walter White", categoria: .villanoEstrategico, descripcion: "Harías lo que sea por asegurar tu legado.", nombreImagen: "walter"),
        Personaje(nombre: "Iron Man", categoria: .intelectualFrio, descripcion: "Genio, millonario, playboy, filántropo.", nombreImagen: "ironman"),
        Personaje(nombre: "Luffy", categoria: .rebeldeImpulsivo, descripcion: "Sigues tus sueños con una libertad absoluta.", nombreImagen: "luffy"),
        Personaje(nombre: "Thanos", categoria: .villanoEstrategico, descripcion: "Tus convicciones son extremas pero lógicas para ti.", nombreImagen: "thanos"),
        Personaje(nombre: "Goku", categoria: .idealistaMoral, descripcion: "Siempre buscas superar tus límites.", nombreImagen: "goku"),
        Personaje(nombre: "Harley Quinn", categoria: .caoticoIntenso, descripcion: "Abrazas el caos con una sonrisa.", nombreImagen: "harley"),
        Personaje(nombre: "Sherlock Holmes", categoria: .intelectualFrio, descripcion: "Observas lo que otros solo ven.", nombreImagen: "sherlock"),
        Personaje(nombre: "Rick Sanchez", categoria: .caoticoIntenso, descripcion: "Nada importa realmente, así que diviértete.", nombreImagen: "rick"),
        Personaje(nombre: "Katniss Everdeen", categoria: .rebeldeImpulsivo, descripcion: "Eres el símbolo de la resistencia.", nombreImagen: "katniss"),
        Personaje(nombre: "Darth Vader", categoria: .villanoEstrategico, descripcion: "Tu presencia impone orden a través del miedo.", nombreImagen: "vader"),
        Personaje(nombre: "Wonder Woman", categoria: .idealistaMoral, descripcion: "Luchas por la paz y la justicia.", nombreImagen: "wonderwoman"),
        Personaje(nombre: "Light Yagami", categoria: .villanoEstrategico, descripcion: "Crees que el fin justifica los medios.", nombreImagen: "light"),
        Personaje(nombre: "Deadpool", categoria: .caoticoIntenso, descripcion: "La cuarta pared no puede detenerte.", nombreImagen: "deadpool"),
        Personaje(nombre: "Levi Ackerman", categoria: .intelectualFrio, descripcion: "Eficiencia pura en el campo de batalla.", nombreImagen: "levi")
    ]
    
    @Published var seleccionados: [Personaje] = []
    
    func seleccionar(_ personaje: Personaje) {
        if seleccionados.contains(where: { $0.id == personaje.id }) {
            seleccionados.removeAll(where: { $0.id == personaje.id })
        } else if seleccionados.count < 5 {
            seleccionados.append(personaje)
        }
    }
    
    var puedeGenerarPerfil: Bool { seleccionados.count == 5 }

    // ESTA ES LA FUNCIÓN NUEVA PARA LIMPIAR TODO
    func resetApp() {
        seleccionados = []
    }
}
