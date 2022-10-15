//
//  VistaIdentificacion.swift
//  GestionAmigos
//
//  Created by Aula11 on 14/10/22.
//

import SwiftUI

struct VistaIdentificacion: View {
    @AppStorage("userName") var userName: String?
    @State var cambiarNombre: Bool = false
    @State var currentUserName = ""
    
    var body: some View {
        VStack {
            Image("logoUAL")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
                .shadow(color: Color.gray, radius: 20)
            HStack {
                Text("Hola, \(userName ?? "desconocido/a/e")")
                    .font(.title)
                    .foregroundColor(.black)
                Button() {
                    withAnimation {
                        cambiarNombre.toggle()
                        if !cambiarNombre {
                            userName = (currentUserName.isEmpty ? nil : currentUserName)
                        }
                    }
                }label: {
                    Image(systemName: (cambiarNombre ? "checkmark" : "pencil.circle"))
                }
            }
            if cambiarNombre {
                TextField("¿Cuál es tu nombre?", text:$currentUserName)
                    .padding()
                    .multilineTextAlignment(.center)
            }
        }
        .onAppear() {
            currentUserName = userName ?? ""
        }
    }
}
