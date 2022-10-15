//
//  VistaImagen.swift
//  GestionAmigos
//
//  Created by Aula11 on 30/9/22.
//

import SwiftUI

struct VistaImagen: View {
    @Binding var colour: Color
    @State var grosor = 2
    var foto: String
    
    var body: some View {
        Image(foto).imagenPerfil(colour: colour, grosor: grosor)
            .onTapGesture {
                colour = Color(UIColor.random)
                grosor = Int.random(in: 1...12)
            }
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}
