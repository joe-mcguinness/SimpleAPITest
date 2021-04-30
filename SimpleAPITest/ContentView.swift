//
//  ContentView.swift
//  SimpleAPITest
//
//  Created by Joe McGuinness on 30/04/2021.
//

import SwiftUI


struct ContentView: View {

	
	@State var data = RootObjectData(title: "testing")
	
	func getData() {
		let urlString = "https://jsonplaceholder.typicode.com/todos/1"
		let url = URL(string: urlString)
		
		URLSession.shared.dataTask(with: url!) {data, _, error in
			DispatchQueue.main.async {
				if let data = data {
					do {
						let decoder = JSONDecoder()
						let decodedData = try decoder.decode(RootObjectData.self, from: data)
						self.data = decodedData
					} catch {
						print ("Error getting data!! \(error)")
					}
				}
			}
		}.resume()
	}
	
    var body: some View {
		VStack(spacing: 10){
			Text("\(data.title)").accessibility(identifier: "titleString")
			Button("Refresh data") {getData()}.accessibility(identifier: "refreshButton")
		}
    }


	struct ContentView_Previews: PreviewProvider {
		static var previews: some View {
			ContentView()
		}
	}
}
