
import SwiftUI

struct ContentView: View {
    
    
    var limit:Array = [10, 50, 100, 500, 1000]
    
    @State var offset:Int = 0
    @State var selectLimit:Int = 10
    @State var isAddView:Bool = false
    @EnvironmentObject var pokController:PokController
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            NavigationView{
                VStack{
                    List{
                        ForEach(Array(pokController.pokemons.enumerated()), id:\.offset){ index, pokemon in
                             NavigationLink(destination: PokemonView(pokemon: pokemon), label: {
                                VStack{
                                    HStack{
                                        AsyncImage(url: URL(string: pokemon.sprites.other.artWork.front_default))
                                        
                                            .scaleEffect(0.15)
                                            .frame(width: 70, height: 50)
                                        
                                        Text("\(pokemon.name.prefix(1).uppercased()+pokemon.name.lowercased().dropFirst())")
                                            .padding(.horizontal)
                                    }
                                }.padding()
                            })
                        }
                    }.listStyle(.plain)
                    .navigationTitle(Text("Pokedex"))
                    .toolbar{
                        ToolbarItem(placement: .navigationBarLeading){
                            Button(action: {
                                offset = ((offset-selectLimit) <= 0 ? 0 : (offset-selectLimit))
                                updatePage()
                            }, label: {
                                Label("page back",systemImage: "lessthan.circle")
                            }).disabled(offset<=0)
                            
                        }
                        ToolbarItem(placement: .principal){
                            Picker("", selection: $selectLimit){
                                ForEach(limit,  id: \.self){
                                    Text(String($0))
                                }
                            }.onChange(of: selectLimit){_ in
                                offset=0
                                updatePage()
                                
                            }
                            
                        }
                        ToolbarItem(placement: .navigationBarTrailing){
                            Button(action: {
                                offset = offset+selectLimit
                                if offset >= 1154{
                                    offset = 1154
                                }
                                print(offset)
                                updatePage()
                            }, label: {
                                Label("page next",systemImage: "greaterthan.circle")
                            }).disabled(offset>=1060)
                        }
                    }
                    HStack{
                        Text("Page \((offset/selectLimit)+1) ... \(1154/selectLimit)")
                    }
                    .foregroundColor(.gray)
                    .opacity(0.8)
                    .font(.system(size: 14))
                }
                
            }
        }
    }
    func updatePage(){
        pokController.fetchPokedex(limit: selectLimit, offset: offset)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
