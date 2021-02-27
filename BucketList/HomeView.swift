//
//  HomeView.swift
//  BucketList
//
//  Created by Scott Obara on 27/2/21.
//

import MapKit
import SwiftUI

struct HomeView: View {
    @Binding var centerCoordinate: CLLocationCoordinate2D
    @Binding var locations: [CodableMKPointAnnotation]
    @Binding var selectedPlace: MKPointAnnotation?
    @Binding var showingPlaceDetails: Bool
    @Binding var showingEditScreen: Bool
    
    var body: some View {
        MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, annotations: locations)
            .edgesIgnoringSafeArea(.all)
        Circle()
            .fill(Color.blue)
            .opacity(0.3)
            .frame(width: 32, height: 32)
        
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    let newLocation = CodableMKPointAnnotation()
                    newLocation.title = "Example location"
                    newLocation.coordinate = self.centerCoordinate
                    self.locations.append(newLocation)
                    self.selectedPlace = newLocation
                    self.showingEditScreen = true
                }) {
                    Image(systemName: "plus")
                        .padding()
                        .background(Color.black.opacity(0.75))
                        .foregroundColor(.white)
                        .font(.title)
                        .clipShape(Circle())
                        .padding(.trailing)
                }
                
            }
        }
    }
}

//extension CodableMKPointAnnotation {
//    static var exampleB: CodableMKPointAnnotation {
//        let annotation = CodableMKPointAnnotation()
//        annotation.title = "London"
//        annotation.subtitle = "Home to the 2012 Summer Olympics."
//        annotation.coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: -0.13)
//        return annotation
//    }
//}
//
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(centerCoordinate: .constant(MKPointAnnotation.example.coordinate), locations: [CodableMKPointAnnotation.exampleB],  selectedPlace: .constant(MKPointAnnotation.example), showingPlaceDetails: .constant(false), showingEditScreen: .constant(false))
//    }
//}
