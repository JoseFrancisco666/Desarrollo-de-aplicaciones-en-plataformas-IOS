import Foundation

//  Estados de Mensaje
enum MessageStatus: String {
    case enviado = "Enviado"
    case recibido = "Recibido"
    case leido = "Leido"
}

let status: MessageStatus = .enviado
print("Status: \(status)")

switch status {
case .enviado:
    print("Mensaje enviado")
case .recibido:
    print("Mensaje recibido")
case .leido:
    print("Mensaje leido")
}

print("------------")
print(status.rawValue)

//  Puntos Cardinales
enum PuntosCardinales: Int {
    case norte = 1
    case sur
    case este
    case oeste
}

let puntoCardinal: PuntosCardinales = .sur
print("Punto Cardinal: \(puntoCardinal.rawValue)")

//  Días de la semana
enum Dias: Int {
    case lunes = 1
    case martes
    case miercoles
    case domingo
}

func dias(from number: Int) -> Dias? {
    return Dias(rawValue: number)
}

if let dia = dias(from: 3) {
    print("El dia numero 3 es el \(dia)")
} else {
    print("Numero de dia invalido")
}

print("-----------")

//  Semáforo
enum Semaforo {
    case red, yellow, green
}

func action(for semaforo: Semaforo) -> String {
    switch semaforo {
    case .red:
        return "alto"
    case .yellow:
        return "precaucion"
    case .green:
        return "avanzar"
    }
}

print(action(for: .red))
print(action(for: .yellow))
print(action(for: .green))

print("________")

//  Estado de Carga
enum LoadState {
    case idle
    case loading
    case success(items: [String])
    case failure(message: String)
}

func render(state: LoadState) {
    switch state {
    case .idle:
        print("Listo para buscar")
    case .loading:
        print("Cargando...")
    case .success(let items):
        print("Resultados: \(items)")
    case .failure(let message):
    
        print("Error: \(message)")
    }
}

// LLAMADAS
render(state: .idle)
render(state: .loading)
render(state: .success(items: ["item 1", "item 2", "item 3"]))
render(state: .failure(message: "No se pudo cargar"))

print("_______")
print("---------------")

enum Login {
    case success(user: String)
    case error(message: String)
}

func inicio(login: Login) -> String {
    switch login {
    case .success(let user):
        return "Bienvenido \(user)"
        
    case .error(let message):
        return "Error: \(message)"
    }
}