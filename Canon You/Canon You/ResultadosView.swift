import SwiftUI

struct ResultadosView: View {
    @ObservedObject var viewModel: CanonViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        // Ejecutamos el cálculo de forma segura
        let canon = calcularPersonajeCanon()
        let color = obtenerColor(para: canon.categoria)
        
        ZStack {
            color.opacity(0.15).ignoresSafeArea()
            
            VStack(spacing: 25) {
                Text("Tu Perfil Canon es:")
                    .foregroundColor(.secondary)
                    .padding(.top)
                
                Image(canon.nombreImagen)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 220, height: 220)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(color, lineWidth: 5))
                    .shadow(color: color.opacity(0.4), radius: 10)
                
                Text(canon.nombre)
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundColor(color)
                
                Text(canon.categoria.rawValue)
                    .padding(8)
                    .background(color.opacity(0.2))
                    .cornerRadius(8)
                    .font(.caption)
                    .bold()
                
                Text(canon.descripcion)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                
                Spacer()
                
                Button(action: {
                    // EL TRUCO: Primero cerramos la pantalla y LUEGO reseteamos
                    dismiss()
                    // Usamos un pequeño retraso para que la lista no se vacíe
                    // mientras la pantalla aún es visible
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        viewModel.resetApp()
                    }
                }) {
                    Text("Volver a intentar")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(color)
                        .cornerRadius(12)
                        .padding(.horizontal, 40)
                }
                .padding(.bottom, 30)
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func calcularPersonajeCanon() -> Personaje {
        // SEGURIDAD: Si la lista está vacía, devolvemos el primero de la lista general
        // Esto evita el error "Index out of range"
        if viewModel.seleccionados.isEmpty {
            return viewModel.listaPersonajes[0]
        }
        
        let categorias = viewModel.seleccionados.map { $0.categoria }
        let counts = NSCountedSet(array: categorias)
        let dominante = categorias.max(by: { counts.count(for: $0) < counts.count(for: $1) }) ?? .idealistaMoral
        
        // Buscamos el personaje de forma segura
        return viewModel.seleccionados.first(where: { $0.categoria == dominante }) ?? viewModel.seleccionados[0]
    }
    
    func obtenerColor(para cat: CategoriaPsicologica) -> Color {
        switch cat {
        case .intelectualFrio: return .blue
        case .idealistaMoral: return .green
        case .caoticoIntenso: return .red
        case .rebeldeImpulsivo: return .orange
        case .villanoEstrategico: return .purple
        }
    }
}
