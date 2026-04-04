import SwiftUI

struct ResultadosView: View {
    let personajesElegidos: [Personaje]
    
    var body: some View {
        let canon = calcularPersonajeCanon()
        let color = obtenerColor(para: canon.categoria)
        
        ZStack {
            color.opacity(0.15).ignoresSafeArea()
            
            VStack(spacing: 25) {
                Text("Tu Perfil Canon es:").foregroundColor(.secondary).padding(.top)
                
                // Usamos Image normal para cargar de Assets
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
                    .padding(8).background(color.opacity(0.2)).cornerRadius(8).font(.caption).bold()
                
                Text(canon.descripcion)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                
                Spacer()
            }
            .padding()
        }
    }
    
    func calcularPersonajeCanon() -> Personaje {
        let categorias = personajesElegidos.map { $0.categoria }
        let counts = NSCountedSet(array: categorias)
        let dominante = categorias.max(by: { counts.count(for: $0) < counts.count(for: $1) }) ?? .idealistaMoral
        return personajesElegidos.first(where: { $0.categoria == dominante }) ?? personajesElegidos[0]
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
