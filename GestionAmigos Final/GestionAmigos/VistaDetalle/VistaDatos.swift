//
//  VistaDatos.swift
//  GestionAmigos
//
//  Created by Aula11 on 30/9/22.
//

import SwiftUI

struct VistaDatos: View {
    @EnvironmentObject private var amigoVM: AmigoViewModel
    @Binding var colour: Color
    @State var textoOpinion : String = ""
    @State var indexAmigo : Int = -1
    @State var favorito : Bool = false
    var amigoCurrent: Amigo
    
    var body: some View {
        VStack {
            HStack {
                Text(amigoCurrent.nombre).font(.title).foregroundColor(.black).fontWeight(.bold)
                Button {
                    favorito.toggle()
                } label: {
                    Image(systemName: favorito ? "star.fill" : "star") .foregroundColor(favorito ? .yellow : .gray)
                }
            }
            Label(amigoCurrent.telefono, systemImage:"phone").font(.body)
            Link(destination: URL(string: "mailto:" + amigoCurrent.email)!, label: {
                Image(systemName: "envelope").foregroundColor(.black) .frame(width: 20, height: 20, alignment: .center)
                Text(amigoCurrent.email) })
            Divider()
            Label("Mi opinión...", systemImage: "pencil")
            
            TextEditor(text: $textoOpinion)
                .font(.footnote)
                .multilineTextAlignment(.center)
                .frame(width: 350, height: 300)
                .overlay(Rectangle().stroke(Color.gray, lineWidth: 2))
                .disableAutocorrection(true)
                .onChange(of: textoOpinion)  {
                    textoOpinion = String($0.prefix(150))
                }
            ProgressView(value: Double(textoOpinion.count), total: Double(150)) {
                Text("Número de caracteres: \(textoOpinion.count) /150").foregroundColor(textoOpinion.count >= 100 ? Color.red : Color.black)
            }.padding()
            Spacer()
        }.onDisappear() {
            amigoVM.datos[indexAmigo].about = textoOpinion
            amigoVM.datos[indexAmigo].favorito = favorito
        }.onAppear() {
            UITextView.appearance().backgroundColor = .clear
            favorito = amigoCurrent.favorito
            textoOpinion = amigoCurrent.about
            indexAmigo = amigoVM.datos.firstIndex(where: {$0.id == amigoCurrent.id})!
        }.zIndex(-1)
    }
}
