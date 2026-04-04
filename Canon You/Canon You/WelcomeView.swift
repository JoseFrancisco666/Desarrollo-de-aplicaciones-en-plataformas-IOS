import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Canon You")
                    .font(.system(size: 40, weight: .bold))
                
                Text("\"Lo que amas en la ficción dice algo sobre ti.\"")
                    .font(.subheadline)
                    .italic()
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                // Este link ahora te lleva a la pantalla de selección real
                NavigationLink(destination: SelectionView()) {
                    Text("Comenzar Análisis")
                        .fontWeight(.semibold)
                        .frame(width: 220, height: 55)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
        }
    }
}
