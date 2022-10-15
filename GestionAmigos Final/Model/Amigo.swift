//
//  Amigo.swift
//  GestionAmigos
//
//  Created by Aula11 on 7/10/22.
//

import Foundation
import SwiftUI

struct Amigo: Identifiable {
    var id = UUID().uuidString
    var nombre: String
    var telefono: String = ""
    var email: String = ""
    var about: String = ""
    var imagenID: String
    var latitud: Double = 0.0
    var longitud: Double = 0.0
    var favorito: Bool = false
    var mensajes: [Mensaje] = []
}
