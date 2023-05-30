//
//  TomorrowShows.swift
//  APIExample
//
//  Created by Noura Alowayid on 10/11/1444 AH.
//

import SwiftUI
struct Shows: Codable, Identifiable{
    let id = UUID()
    let shows:[String]
    let date: String
}
struct TomorrowShows: View {
    @State private var show = [Shows]()
    var body: some View {
        ScrollView{
            VStack {
                ForEach (show) { item in
                    VStack {
                        Text(item.date)
                            .frame (maxWidth: .infinity)
                            .foregroundColor (.white)
                            .font (.title2)
                            .padding(.all, 24)
                            .background (.gray)
                            .padding (.bottom, 30)
                        Text (String("\(item.shows)"))
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
                        let url = URL(string: "https://show-air-dates.p.rapidapi.com/tomorrow")!
                        let (data,_) = try! await URLSession.shared.data(from: url)
                        let serverShows = try! JSONDecoder().decode([Shows].self, from: data)
                        show = serverShows
                    }
                }
struct TomorrowShows_Previews: PreviewProvider {
    static var previews: some View {
        TomorrowShows()
    }
}
