//
//  ContentView.swift
//  SwiftUIBottomSheet
//
//  Created by Simon Ng on 22/8/2022.
//

import SwiftUI

struct ContentView: View {
	@State private var selectedRestaurant: Restaurant?
	@State private var selectedDent: PresentationDetent = .medium
	
    var body: some View {
        NavigationStack {
            List {
                ForEach(restaurants) { restaurant in
                    BasicImageRow(restaurant: restaurant)
						.onTapGesture {
							self.selectedRestaurant  = restaurant
						}
                }
            }
			.listStyle(.plain)
			.navigationTitle("Restaurants")
        }
		.sheet(item: $selectedRestaurant) { restaurant in
			RestaurantDetailView(restaurant: restaurant)
				.presentationDetents([.medium, .large, .height(200), .fraction(0.1)], selection: $selectedDent)
				.presentationDragIndicator(.hidden)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BasicImageRow: View {
    var restaurant: Restaurant
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(restaurant.name)
        }
    }
}

