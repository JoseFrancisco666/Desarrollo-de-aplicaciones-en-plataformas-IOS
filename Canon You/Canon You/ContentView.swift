import SwiftUI

struct ContentView: View {
    // 1. Creamos una variable de estado para controlar si se muestra la intro
    @State private var mostrarIntro = true
    
    var body: some View {
        ZStack {
            // La vista principal (WelcomeView) siempre está de fondo
            WelcomeView()
            
            // 2. Si mostrarIntro es true, ponemos la IntroductionView encima
            if mostrarIntro {
                IntroductionView(showIntro: $mostrarIntro)
                    .transition(.move(edge: .bottom)) // Animación opcional
                    .background(Color(UIColor.systemBackground)) // Para que no sea transparente
            }
        }
        .animation(.spring(), value: mostrarIntro) // Hace que desaparezca suavemente
    }
}

