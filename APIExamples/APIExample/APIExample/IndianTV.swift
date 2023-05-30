//
//  IndianTV.swift
//  APIExample
//
//  Created by Noura Alowayid on 10/11/1444 AH.
//

import SwiftUI

struct IndianTV: View {
    @State private var categories = [String]()
    var body: some View {
        ScrollView{
            VStack {
                ForEach (categories, id: \.self) { item in
                    VStack {
                        Text(item)
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
                let url = URL(string: "https://indian-tv-schedule.p.rapidapi.com/getCategories")!
                let (data,_) = try! await URLSession.shared.data(from: url)
                let serverCategories = try! JSONDecoder().decode([String].self, from: data)
                categories = serverCategories
            }
        }

struct IndianTV_Previews: PreviewProvider {
    static var previews: some View {
        IndianTV()
    }
}
