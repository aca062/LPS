//
//  VistaChat.swift
//  GestionAmigos
//
//  Created by Aula11 on 14/10/22.
//

import SwiftUI

struct VistaChat: View {
    @EnvironmentObject var amigoVM: AmigoViewModel
    
    var body: some View {
        List() {
            ForEach(amigoVM.datos) { amigo in
                Section(
                    header: VistaHeader(nombre: amigo.nombre, imagenID: amigo.imagenID),
                    footer: Text("\(amigo.mensajes.count) mensaje\(amigo.mensajes.count == 1 ? "" : "s")")
                ){
                    ForEach(amigo.mensajes, id: \.self) { mensajeStr in
                        HStack {
                            Image(systemName: mensajeStr.contestacion ? "arrow.right.to.line.circle" : "arrow.left.to.line.circle").foregroundColor(mensajeStr.contestacion ? Color.red : Color.green)
                            Text(mensajeStr.texto)
                            Spacer()
                            Text(formatDate(date: mensajeStr.date))
                                .font(.caption2)
                                .fontWeight(.thin)
                                .foregroundColor(Color.gray)
                                .padding([.top, .leading])
                        }
                    }
                }
            }
        }
    }
}

func formatDate(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    dateFormatter.timeStyle = .short
    dateFormatter.locale = Locale(identifier: "es")
    return dateFormatter.string(from: date)
}

struct VistaHeader: View {
    var nombre : String
    var imagenID : String
    var body: some View {
        HStack {
            Image(imagenID).imagenPequena()
            VStack(alignment: .leading){ Text(nombre)
                    .font(.subheadline) .fontWeight(.bold) .foregroundColor(Color.black)
            }
            Spacer()
            Button {
            } label: {Image(systemName: "plus.circle")
            }
            Button {
            } label: {Image(systemName: "minus.circle").foregroundColor(Color.red)
            }.padding(.horizontal, 10)
        }
        .background(Color.white)
        .cornerRadius(20)
    }
}
