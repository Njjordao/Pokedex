
import SwiftUI

struct PokemonView: View {
    
    @State var name:String = ""
    @State var pokemon:PokemonModel = PokemonModel()
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        VStack{
            HStack{
                Text(pokemon.name.prefix(1).uppercased()+pokemon.name.dropFirst())
                    .font(.system(size: 50,design: .rounded))
                    .bold()
                    .shadow(color: .gray, radius: 7,x: 8,y: 8)
                    .offset(y:-55)
                
            }
            
            VStack{
                AsyncImage(url: URL(string: pokemon.sprites.other.artWork.front_default)){ image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }placeholder: {
                    Color(.gray)
                }
            }
            .frame(width: 200, height: 200, alignment: .top)
            .background(Color("backColor"))
            .cornerRadius(20)
            .offset(y:-55)
            
            VStack{
                Text("Habilidades")
                    .font(.system(size: 20,design: .rounded))
                    .bold()
                
                
                ForEach(pokemon.abilities, id:\.ability.name){ item in
                    Text("\(item.ability.name)")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .listRowSeparator(.hidden)
                    
                }
            }.offset(y:-55)
            VStack(alignment: .leading){
                Text("Dados")
                    .font(.system(size: 20,design: .rounded))
                    .bold()
            }
            
            
            VStack(alignment: .leading){
                ForEach(pokemon.stats, id:\.stat.name){ i in
                    Text("\(i.stat.name): ")+Text("\(i.base_stat)")
                    
                    ProgressView(value: Float(i.base_stat), total: 233)
                        .tint(Color.black)
                }
            }
            .frame(maxWidth: 350, alignment: .leading)
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView()
    }
}
