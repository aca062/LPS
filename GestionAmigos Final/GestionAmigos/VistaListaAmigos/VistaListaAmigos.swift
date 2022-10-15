//
//  ListaAmigos.swift
//  GestionAmigos
//
//  Created by Aula11 on 7/10/22.
//

import SwiftUI

struct VistaListaAmigos: View {
    @EnvironmentObject var amigoVM: AmigoViewModel
    @State var soloFavoritos = false
    @State var query : String = ""
    @State var enEdicion : Bool = false
    @State var nombre : String = ""
    @State var telefono : String = ""
    @State var email : String = ""
    @State var imagenID : String = "person"
    @State var mostrarAddAmigo : Bool = false
    @State var cancelAddAmigo : Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                BusquedaView(text: $query).padding()
                List() {
                    Toggle("Filtrar por favoritos", isOn: $soloFavoritos)
                    ForEach(amigoVM.datos) { amigo in
                        if (!soloFavoritos || amigo.favorito) && (query.isEmpty || amigo.nombre.lowercased().folding(options: .diacriticInsensitive, locale:Locale.current).contains(query.lowercased().folding(options: .diacriticInsensitive, locale:Locale.current))) {
                            NavigationLink(destination: VistaDetalle(amigoCurrent: amigo)) {
                                    VistaFila(amigo: amigo)
                            }
                        }
                    }.onDelete { indexSet in
                        amigoVM.datos.remove(atOffsets: indexSet)
                    }.onMove { origen, destino in
                        amigoVM.datos.move(fromOffsets: origen, toOffset: destino)
                    }
                }.navigationTitle("Amigos")
                    .navigationBarItems(
                        leading:
                            Button() {
                                enEdicion.toggle()
                            }
                        label: {
                            Text(enEdicion ? "Cancelar" : "Editar")
                                .font(.title3)
                                .foregroundColor(Color.blue)
                        },
                        trailing:
                            Button() {
                                mostrarAddAmigo.toggle()
                                nombre = ""
                                telefono = ""
                                email = ""
                                imagenID = "person"
                            }
                            label: {
                            Image(systemName: "plus.circle")
                                .font(.title3)
                                .foregroundColor(Color.red)
                            }
                            .sheet(isPresented: $mostrarAddAmigo,
                                   onDismiss: {
                                       if !cancelAddAmigo {
                                           amigoVM.datos.append(Amigo(nombre: nombre.isEmpty ? "nuevoAmigo" : nombre, telefono: telefono.isEmpty ? "000000000" : telefono, email: email.isEmpty ? "email@email.com" : email, imagenID: imagenID))
                                       }
                                   }, content: {
                                       VistaAddAmigo(nombre: $nombre, telefono: $telefono, email: $email, imagenID: $imagenID, cancelar: $cancelAddAmigo)
                                   }
                            )
                    )
                    .environment(\.editMode, .constant(enEdicion ? EditMode.active : EditMode.inactive))
            }
        }
    }
}

struct BusquedaView: View {
    @Binding var text: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(text.isEmpty
                                 ? Color(UIColor.gray).opacity(0.4)
                                 : Color(UIColor.gray).opacity(0.9))
            TextField("Buscar...", text:$text)
            Button() {
                text = ""
            }label: {
                Image(systemName: "x.circle")
            }.opacity(text.isEmpty ? 0.1 : 8.0)
                .foregroundColor(Color.red)
        }
        .padding()
        .background(Color(UIColor.gray).opacity(0.1).clipShape(RoundedRectangle(cornerRadius: 20)))
    }
}

struct VistaFila: View {
    @EnvironmentObject private var amigoVM: AmigoViewModel
    var amigo : Amigo
    var body: some View {
        HStack{
            Image(amigo.imagenID).imagenPequena()
            VStack(alignment: .leading){ Text(amigo.nombre)
                    .font(.subheadline) .fontWeight(.bold) .foregroundColor(Color.black)
                Text(amigo.telefono) .font(.caption2) .fontWeight(.medium)
            }
            Spacer()
            Image(systemName: amigo.favorito ? "star.fill" : "star")
            .foregroundColor(amigo.favorito ? .yellow : .gray)
            
        }
        .background(Color.white)
    }
}

struct VistaAddAmigo: View {
    @Environment(\.presentationMode) var modoPresentacion
    @Binding var nombre : String
    @Binding var telefono : String
    @Binding var email : String
    @Binding var imagenID : String
    @Binding var cancelar : Bool
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Fotografía")) {
                    HStack {
                        Spacer()
                        Image(imagenID)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150, alignment: .center)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .shadow(color: .gray, radius: 9)
                        Spacer()
                    }
                }
                Section(header: Text("Datos")) {
                    TextField("Nombre del amigo", text: $nombre)
                    TextField("Teléfono del amigo", text: $telefono)
                    TextField("E-mail del amigo", text: $email).autocapitalization(.none)
                }
            }
            
            HStack {
                Button() {
                    cancelar = true
                    modoPresentacion.wrappedValue.dismiss()
                }label: {
                    Text("Cancelar")
                        .fontWeight(.bold)
                        .frame(width: 150, height: 50)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(88)
                }
                Button() {
                    cancelar = false
                    modoPresentacion.wrappedValue.dismiss()
                }label: {
                    Text("Guardar")
                        .fontWeight(.bold)
                        .frame(width: 150, height: 50)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(88)
                }
            }
        }
    }
}
