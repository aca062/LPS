//
//  VistaMain.swift
//  GestionAmigos
//
//  Created by Aula11 on 14/10/22.
//

import SwiftUI
extension Image {
    func imagenPerfil(colour: Color, grosor: Int) -> some View {
            self
            .resizable().frame(width: 150, height: 150, alignment:.center) .clipShape(Circle()) .overlay(Circle().stroke(Color.white, lineWidth: CGFloat(grosor))) .shadow(color: colour, radius:3)
    }
    
    func imagenPequena() -> some View {
            self
            .resizable()
            .frame(width: 40, height: 40)
            .clipShape(Circle()) .overlay(Circle().stroke(Color.white, lineWidth: 2)) .shadow(color: Color.black, radius: 1)
    }
}

struct VistaMain: View {
    @EnvironmentObject var amigoVM: AmigoViewModel
    @State var selection: Int = 0
    var body: some View {
        TabView(selection: $selection){
            VistaIdentificacion()
                .tabItem {
                    Image(systemName: "signature")
                    Text("Identificación")
                }
                .tag(0)
            VistaListaAmigos().environmentObject(amigoVM)
                .tabItem {
                    Image(systemName: "bell")
                    Text("Lista de amigos")
                }
                .tag(1)
            VistaChat().environmentObject(amigoVM)
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Chat")
                }
                .tag(2)
        }
    }
}
