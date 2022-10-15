//
//  VistaMapa.swift
//  GestionAmigos
//
//  Created by Aula11 on 30/9/22.
//

import SwiftUI

import MapKit
struct VistaMapa: View {
    @State private var region = MKCoordinateRegion()
    var latitud: Double
    var longitud: Double
    
    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true).onAppear() {
            region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: latitud, longitude: longitud),
                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        }
    }
}

/*struct VistaMapa_Previews: PreviewProvider {
    static var previews: some View {
        VistaMapa()
    }
}*/
