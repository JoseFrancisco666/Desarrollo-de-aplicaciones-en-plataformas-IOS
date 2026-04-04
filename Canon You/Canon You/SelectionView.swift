import SwiftUI

struct SelectionView: View {
    @StateObject var viewModel = CanonViewModel()
    
    var body: some View {
        VStack {
            Text("Selecciona tus 5 favoritos")
                .font(.headline)
                .padding()
            
            List(viewModel.listaPersonajes) { personaje in
                HStack {
                    VStack(alignment: .leading) {
                        Text(personaje.nombre).font(.headline)
                        Text(personaje.categoria.rawValue).font(.caption).foregroundColor(.gray)
                    }
                    Spacer()
                    if viewModel.seleccionados.contains(where: { $0.id == personaje.id }) {
                        Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture { viewModel.seleccionar(personaje) }
            }
            
            Text("Seleccionados: \(viewModel.seleccionados.count) de 5")
                .padding()

            NavigationLink(destination: ResultadosView(personajesElegidos: viewModel.seleccionados)) {
                Text("Generar Perfil")
                    .bold()
                    .frame(width: 220, height: 50)
                    .background(viewModel.puedeGenerarPerfil ? Color.blue : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(!viewModel.puedeGenerarPerfil)
        }
        .navigationTitle("Fandom")
    }
}
