//
//  LocationDetailsView.swift
//  'Za Hunter
//
//  Created by Tom Bredemeier on 2/17/26.
//

import SwiftUI
import MapKit

struct LocationDetailsView: View {
    let mapItem: MKMapItem
    var body: some View {
        let address = mapItem.placemark.subThoroughfare! + " " +
                      mapItem.placemark.thoroughfare! + "\n" +
                      mapItem.placemark.locality! + ", " +
                      mapItem.placemark.administrativeArea! + " " +
                      mapItem.placemark.postalCode!
        VStack {
            Text(mapItem.placemark.name!).font(.title).bold()
            Text(address)
            Text(mapItem.phoneNumber!).padding()
            Button(action: {
                let latitude = mapItem.placemark.coordinate.latitude
                let longitude = mapItem.placemark.coordinate.longitude
                let url = URL(string: "http://maps.apple.com/?q=\(latitude),\(longitude)")!
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url)
                }
            }, label: {
                Text("Get Directions")
            })
            if let url = mapItem.url {
                Link("Visit Website", destination: url).padding()
            }
            Spacer()
        }
    }
}

#Preview {
    LocationDetailsView(mapItem: MKMapItem())
}
