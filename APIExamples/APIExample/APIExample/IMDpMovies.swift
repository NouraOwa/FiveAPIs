//
//  IMDpMovies.swift
//  APIExample
//
//  Created by Noura Alowayid on 10/11/1444 AH.
//

import SwiftUI
struct Movies: Codable, Identifiable {
    let rank: Int
    let title: String
    let rating: Double
    let id: String
    let year: Int
    let description: String
}
struct IMDpMovies: View {
    @State private var movie = [Movies]()
//    [
//        Movies(rank: 1,
//               title: "The Shawshank Redemption",
//               rating: 9.3,
//               id: "top1",
//               year: 1994,
//               description: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.")
//    ]
    
    var body: some View {
        ScrollView{
            VStack {
                ForEach (movie) { item in
                    VStack {
                        Text(item.id)
                            .frame (maxWidth: .infinity)
                            .foregroundColor (.white)
                            .font (.title2)
                            .padding(.all, 24)
                            .background (.gray)
                            .padding (.bottom, 30)
                        Text (item.title)
                            .frame (maxWidth: .infinity)
                            .foregroundColor (.white)
                            .font (.title2)
                            .padding(.all, 24)
                            .background (.gray)
                            .padding (.bottom, 30)
                        Text("\(item.rating)")
                            .frame (maxWidth: .infinity)
                            .foregroundColor (.white)
                            .font (.title2)
                            .padding(.all, 24)
                            .background (.gray)
                            .padding (.bottom, 30)
                        Text(item.description)
                            .frame (maxWidth: .infinity)
                            .foregroundColor (.white)
                            .font (.title2)
                            .padding(.all, 24)
                            .background (.gray)
                            .padding (.bottom, 30)
                        Text("\(item.year)")
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
                let url = URL(string: "https://imdb-top-100-movies.p.rapidapi.com/" )!
                let (data,_) = try! await URLSession.shared.data(from: url)
                let serverMovies = try! JSONDecoder().decode([Movies].self, from: data)
                movie = serverMovies
            }
        }
                    struct YahooWeather_Previews: PreviewProvider {
                        static var previews: some View {
                            IMDpMovies()
                        }
                    }

