import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                AsyncImage(url: URL(string: character.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                } placeholder: {
                    ProgressView()
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    InfoRow(title: "Status", value: character.status)
                    InfoRow(title: "Species", value: character.species)
                    InfoRow(title: "Location", value: character.location.name)
                }
                .padding()
            }
        }
        .navigationTitle(character.name)
    }
}

struct InfoRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
            Text(value)
                .foregroundColor(.gray)
        }
    }
}


#Preview {
    NavigationView {
        CharacterDetailView(character: Character(
            id: 1,
            name: "Rick Sanchez",
            status: "Alive",
            species: "Human",
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            location: Character.Location(name: "Earth")
        ))
    }
}
