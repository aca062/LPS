//
//  VistaDetalle.swift
//  GestionAmigos
//
//  Created by Aula11 on 30/9/22.
//

import SwiftUI

struct VistaDetalle: View {
    @EnvironmentObject private var amigoVM: AmigoViewModel
    @State var color: Color = Color.black
    var amigoCurrent: Amigo
    
    var body: some View {
        GeometryReader { tamano in
            VStack {
                VistaMapa(latitud: amigoCurrent.latitud,
                          longitud: amigoCurrent.longitud).frame(height: tamano.size.height / 2.5)
                VistaImagen(colour: $color, foto: amigoCurrent.imagenID).offset(y: -110).padding(.bottom, -150).zIndex(1)
                ScrollView {
                    VistaDatos(colour: $color, amigoCurrent: amigoCurrent).offset(y: 60).padding(.bottom, 110)
                }
            }.navigationTitle(amigoCurrent.nombre)
             .navigationBarTitleDisplayMode(.inline)
             .background(color.brightness(0.65))
        }
    }
}

/*struct VistaDetalle_Previews: PreviewProvider {
     static var previews: some View {
        VistaDetalle()
     }
 }*/
