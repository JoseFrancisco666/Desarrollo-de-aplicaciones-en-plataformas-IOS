import SwiftUI

// Aporte: pantalla introductoria para mejorar la experiencia del usuario
// Explica el propósito de la app antes de iniciar el análisis

struct IntroductionView: View {
  @Binding var showIntro: Bool

  var body: some View {
    VStack(spacing: 30) {
      Image(systemName: "person.fill.viewfinder")
        .font(.system(size: 80))
        .foregroundColor(.blue)

      Text("¿Qué es CanonYou?")
        .font(.largeTitle).bold()

      Text("Analizamos tu personalidad proyectiva basándonos en los personajes de ficción que más admiras.")
        .multilineTextAlignment(.center)
        .padding()

      Button("Entendido") {
        showIntro = false
      }.buttonStyle(.borderedProminent)
    }
  }
}
