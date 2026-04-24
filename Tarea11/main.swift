import Foundation

// --- 1. ENUMS ---
enum NivelCurso: String {
    case basico = "Básico", intermedio = "Intermedio", avanzado = "Avanzado"
}

enum EstadoAcademico: String {
    case reprobado = "Reprobado", aprobado = "Aprobado", excelente = "Excelente"
}

// --- 2. STRUCT (Estudiante con validaciones) ---
struct Estudiante {
    let id: Int
    let nombre: String
    let edad: Int
    let correo: String
    
    init?(id: Int, nombre: String, edad: Int, correo: String) {
        // Uso de guard para validar reglas de negocio
        guard !nombre.isEmpty, edad >= 16, correo.contains("@") else {
            return nil
        }
        self.id = id
        self.nombre = nombre
        self.edad = edad
        self.correo = correo
    }
}

// --- 3. CLASS 1 (Inscripción y gestión de notas) ---
class Inscripcion {
    let estudiante: Estudiante
    let cursoNombre: String
    var calificaciones: [Double] = []
    
    // PROPIEDAD COMPUTADA: Promedio
    var promedio: Double {
        guard !calificaciones.isEmpty else { return 0.0 }
        return calificaciones.reduce(0, +) / Double(calificaciones.count)
    }
    
    // PROPIEDAD COMPUTADA: Estado basado en el promedio
    var estado: EstadoAcademico {
        if promedio < 6 { return .reprobado }
        if promedio < 9 { return .aprobado }
        return .excelente
    }
    
    init(estudiante: Estudiante, curso: String) {
        self.estudiante = estudiante
        self.cursoNombre = curso
    }
}

// --- 4. CLASS 2 (Sistema Principal - CampusControl) ---
class CampusControl {
    var alumnos: [Int: Estudiante] = [:]
    var registros: [Inscripcion] = []

    func registrarAlumno(id: Int, nombre: String, edad: Int, correo: String) {
        if let nuevo = Estudiante(id: id, nombre: nombre, edad: edad, correo: correo) {
            alumnos[id] = nuevo
            print("Alumno \(nombre) registrado en el sistema.")
        } else {
            print(" Error en datos de \(nombre).")
        }
    }

    func inscribirEnCurso(id: Int, curso: String, cupo: Int) {
        guard let alumno = alumnos[id] else { return }
        
        // Validación: Evitar duplicados
        let yaExiste = registros.contains { $0.estudiante.id == id && $0.cursoNombre == curso }
        guard !yaExiste else {
            print(" \(alumno.nombre) ya está inscrito en \(curso).")
            return
        }
        
        // Validación: Cupo máximo
        let totalInscritos = registros.filter { $0.cursoNombre == curso }.count
        guard totalInscritos < cupo else {
            print(" No hay cupo en \(curso).")
            return
        }
        
        registros.append(Inscripcion(estudiante: alumno, curso: curso))
        print(" \(alumno.nombre) se ha inscrito a \(curso).")
    }

    func cargarNota(id: Int, curso: String, valor: Double) {
        guard let registro = registros.first(where: { $0.estudiante.id == id && $0.cursoNombre == curso }) else { return }
        
        // Uso de guard para validación de rango 0-10
        guard valor >= 0 && valor <= 10 else {
            print(" La nota \(valor) no es válida.")
            return
        }
        
        registro.calificaciones.append(valor)
        print(" Nota \(valor) cargada a \(registro.estudiante.nombre).")
    }

    func generarReporte() {
        print("\n==============================")
        print("   CAMPUS CONTROL - REPORTE   ")
        print("==============================")
        
        for r in registros {
            print("Estudiante: \(r.estudiante.nombre)")
            print("Materia:    \(r.cursoNombre)")
            print("Notas:      \(r.calificaciones)")
            print("Promedio:   \(String(format: "%.1f", r.promedio))")
            print("Situación:  \(r.estado.rawValue)")
            print("------------------------------")
        }
    }
}

// --- EJECUCIÓN CON DATOS NUEVOS ---

let campus = CampusControl()

// Registramos nuevos nombres
campus.registrarAlumno(id: 10, nombre: "Francisco Carrillo", edad: 21, correo: "paco@campus.com")
campus.registrarAlumno(id: 20, nombre: "Elena Méndez", edad: 19, correo: "elena@campus.com")

// Inscripciones
campus.inscribirEnCurso(id: 10, curso: "Desarrollo iOS", cupo: 5)
campus.inscribirEnCurso(id: 20, curso: "Base de Datos", cupo: 5)

// Cargamos diferentes promedios
// Francisco: Promedio Excelente (9.5)
campus.cargarNota(id: 10, curso: "Desarrollo iOS", valor: 10.0)
campus.cargarNota(id: 10, curso: "Desarrollo iOS", valor: 9.0)

// Elena: Promedio Aprobado (7.8)
campus.cargarNota(id: 20, curso: "Base de Datos", valor: 7.5)
campus.cargarNota(id: 20, curso: "Base de Datos", valor: 8.2)

// Mostrar resultados
campus.generarReporte()
