import SwiftUI

struct YahooWeather: View {
  @State private var jokes = [Joke]()

  var body: some View {
    List(jokes, id: \.id) { joke in
      Text(joke.joke)
    }
    .onAppear {
      let url = URL(string: "https://jokes34.p.rapidapi.com/v1/jokes?limit=20&page=1")!

      let request = URLRequest(url: url)

      let session = URLSession.shared
      let task = session.dataTask(with: request) { data, response, error in
        guard let data = data else {
          print(error ?? "No error")
          return
        }

        let jokes = try! JSONDecoder().decode([Joke].self, from: data)

        DispatchQueue.main.async {
          self.jokes = jokes
        }
      }

      task.resume()
    }
  }
}

struct Joke: Decodable {
  let id: Int
  let joke: String
}

struct Yahoo: View {
  var body: some View {
    NavigationView {
      YahooWeather()
        .navigationBarTitle("Jokes")
    }
  }
}
