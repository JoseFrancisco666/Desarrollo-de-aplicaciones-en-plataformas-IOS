import SwiftUI

struct ContentView: View {
    // Cambio de la horientacion
    @State private var esHorizontal: Bool = false

    var body: some View {
        ZStack {
            // CAMBIO DE COLOR
            (esHorizontal ? Color.blue : Color.pink)
                .edgesIgnoringSafeArea(.all)
                .animation(.easeInOut, value: esHorizontal)
            
            ScrollView {
                VStack(spacing: 20) {
                    if esHorizontal {
                        Text(" MODO HORIZONTAL ACTIVADO")
                            .font(.caption)
                            .bold()
                            .padding(8)
                            .background(.white.opacity(0.3))
                            .cornerRadius(5)
                    }

                    LibroRow(imagen: "Libro 1", titulo: "Clean Architecture", autor: "Robert C. Martin", anio: "2017")
                    LibroRow(imagen: "Libro 2", titulo: "Software Engineering", autor: "Ian Sommerville", anio: "2015")
                    LibroRow(imagen: "Libro 3", titulo: "Introduction to Algorithms", autor: "T. Cormen", anio: "2009")
                    LibroRow(imagen: "Libro 4", titulo: "UML User Guide", autor: "Grady Booch", anio: "2005")
                    LibroRow(imagen: "Libro 5", titulo: "Design Patterns", autor: "Erich Gamma", anio: "1994")
                    LibroRow(imagen: "Libro 6", titulo: "Clean Code", autor: "Robert C. Martin", anio: "2008")
                    LibroRow(imagen: "Libro 7", titulo: "Cracking the Coding Interview", autor: "Gayle Laakmann", anio: "2015")
                    LibroRow(imagen: "Libro 8", titulo: "Refactoring", autor: "Martin Fowler", anio: "1999")
                    LibroRow(imagen: "Libro 9", titulo: "Don't Make Me Think", autor: "Steve Krug", anio: "2000")
                    LibroRow(imagen: "Libro 10", titulo: "The Pragmatic Programmer", autor: "Andrew Hunt", anio: "1999")
                }
                .padding()
            }
        }
        // Este bloque detecta el giro
        .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
            let orientacion = UIDevice.current.orientation
            if orientacion.isLandscape {
                esHorizontal = true
            } else if orientacion.isPortrait {
                esHorizontal = false
            }
        }
    }
}

struct LibroRow: View {
    let imagen: String
    let titulo: String
    let autor: String
    let anio: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Image(imagen)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 130)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(titulo)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text("Autor: \(autor)").bold()
                Text("Año de publicación: \(anio)").italic()
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}
