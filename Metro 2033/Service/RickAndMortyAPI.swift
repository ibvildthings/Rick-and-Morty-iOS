import Foundation

class RickAndMortyAPI: ObservableObject {
    @Published var characters: [Character] = []
    
    func fetchCharacters() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _ , error in
            guard let data = data else { return }
            
            do {
                let response = try JSONDecoder().decode(Characters.self, from: data)
                DispatchQueue.main.async {
                    self.characters = response.results
                }
            } catch {
                print("Error:\(error)")
            }
        }.resume()
    }
}
