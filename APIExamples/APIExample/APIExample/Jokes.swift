//
//  Jokes.swift
//  APIExample
//
//  Created by Noura Alowayid on 10/11/1444 AH.
//

import SwiftUI
struct JokesAPI: Codable, Identifiable{
    let id = UUID()
    let joke: String
}
struct Jokes: View {
        @State private var joke = [JokesAPI]()
        var body: some View {
            ScrollView{
                VStack {
                    ForEach (joke) { item in
                        VStack {
                            Text(item.joke)
                                .frame (maxWidth: .infinity)
                                .foregroundColor (.white)
                                .font (.title2)
                                .padding(.all, 24)
                                .background (.gray)
                                .padding (.bottom, 30)
                        }
                    }
                }
            }
        .task {
        await loadData ()
    }
}
        func loadData( ) async {
            try! await Task.sleep(nanoseconds: 3_000_000_000)
            let url = URL(string: "https://jokes34.p.rapidapi.com/v1/jokes?limit=20&page=1")!
            let (data,_) = try! await URLSession.shared.data(from: url)
            let serverJokes = try! JSONDecoder().decode([JokesAPI].self, from: data)
            joke = serverJokes
        }
    }

struct Jokes_Previews: PreviewProvider {
    static var previews: some View {
        Jokes()
    }
}
