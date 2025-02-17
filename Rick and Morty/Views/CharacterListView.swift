import SwiftUI

struct CharacterListView: View {
    @StateObject private var api = RickAndMortyAPI()
    
    var body: some View {
        NavigationView {
            List(api.characters) { character in
                NavigationLink(destination: CharacterDetailView(character: character)) {
                    CharacterRowView(character: character)
                }
            }
            .navigationTitle("Rick & Morty")
            .onAppear {
                api.fetchCharacters()
            }
        }
    }
}

