import SwiftUI

struct ContentView: View {

    // Datos personales
    let nombre = "Pepe"
    let edad = 21

    //   Experiencia
    let experiencia = [
        "Conocimiento en lenguaje de Java",
        "Creación y manejo de base de datos en AWS",
        "App de productos del anime Beyblade X en Android Studio"
    ]

    // Formación académica
    let formacion = [
        "Licenciatura en Ingeniería en Software",
        "Curso de Java",
        "Curso de C#",
        "Curso de Python",
        "Certificado de Figma",
        "Certificado de AWS Amazon Data Engineering"
    ]

    //  Contacto
    let contacto: (email: String, telefono: String) =
        ("Carrillochavezjosefco29@gmail.com", "5543925150")

    // Estados
    @State private var mostrarAlerta = false
    @State private var isEnabled = true
    @State private var valorSlider: Double = 50

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {

            //  FOTO DE PERFIL 
            Image("Yo_guapo")
   
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.blue, lineWidth: 2)
                )
                .shadow(radius: 5)
                .padding(.bottom, 10)

            // Datos personales
            Text("Nombre: \(nombre)")
                .font(.title2)
                .bold()

            Text("Edad: \(edad)")
                .font(.subheadline)
                .foregroundColor(.gray)

            Text("Contacto: \(contacto.email) | \(contacto.telefono)")
                .font(.footnote)
                .foregroundColor(.gray)

            Divider()

            // Experiencia
            Text("Experiencia Profesional")
                .font(.headline)

            ForEach(experiencia, id: \.self) { proyecto in
                Text("• \(proyecto)")
            }

            Divider()

            // Formación
            Text("Formación Académica")
                .font(.headline)

            ForEach(formacion, id: \.self) { estudio in
                Text("• \(estudio)")
            }

            // Botón
            Button("Ver cursos 2025") {
                mostrarAlerta = true
            }
            .buttonStyle(.borderedProminent)
            .padding(.top, 10)

            // Toggle
            Toggle("Perfil", isOn: $isEnabled)
                .padding(.top, 5)

            Text(isEnabled ? "Developer" : "Scrum Master")
                .font(.headline)
                .foregroundColor(isEnabled ? .green : .red)

            // Slider
            Text("Nivel: \(Int(valorSlider))")
                .font(.headline)

            Slider(value: $valorSlider, in: 0...100, step: 1)

            Spacer()
        }
        .padding()

        // Alerta
        .alert("
        
         Cursos en 2025", isPresented: $mostrarAlerta) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("""
            Curso 1: Big Data
            Curso 2: Computer Vision
            Curso 3: Data Science
            """)
        }
    }
}

#Preview {
    ContentView()
}