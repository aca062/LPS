//
//  ModeloDatos.swift
//  GestionAmigos
//
//  Created by Aula11 on 7/10/22.
//

import Foundation
final class AmigoViewModel: ObservableObject{
    @Published var datos: [Amigo] = [
        Amigo(nombre: "Andrés García Ibáñez", telefono: "123456789", email: "ibanez@hotamail.com",
              about: "Ibáñez es un gran artista del Valle del Almanzora", imagenID: "ibanez",
              latitud: 37.35452532583348, longitud: -2.296203947656044, favorito: true,
              mensajes: [
                Mensaje(date: Date(), texto: "Hola que tal estamos", contestacion: false),
                Mensaje(date: Date(), texto: "Venga adiós", contestacion: true)
              ]),
        Amigo(nombre: "Saul Goodman", telefono: "852159632", email: "bettercallsaul@shady.com",
              about: "Saul es el mejor abogado del mundo", imagenID: "saul",
              latitud: 36.8389157611977, longitud: -2.40714076462062, favorito: true,
              mensajes: [
                Mensaje(date: Date(), texto: "Hola que tal", contestacion: false),
                Mensaje(date: Date(), texto: "Tirando", contestacion: true)
              ]),
        Amigo(nombre: "Perico de los Palotes", telefono: "159753824", email: "perpal@gmailing.com",
              about: "Perico es colega de todo el mundo", imagenID: "perico",
              latitud: 36.85764033530464, longitud: -2.452192838957072, favorito: false,
              mensajes: [
                  Mensaje(date: Date(), texto: "Holaa!", contestacion: false),
                  Mensaje(date: Date(), texto: "Muy bien!", contestacion: true)
              ]),
    ]
}
