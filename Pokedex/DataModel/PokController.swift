
import Foundation

class PokController:ObservableObject{
    
    let urlAPI:String = "https://pokeapi.co/api/v2/pokemon"
    @Published var itemsPokedex:PokedexResponse = PokedexResponse()
    @Published var pokemon:PokemonModel = PokemonModel()
    @Published var pokemons:[PokemonModel] = []
    
    init(){
        
        fetchPokedex()
    }
    
    func fetchPokedex(limit:Int = 10, offset:Int = 0){
        
        guard let url = URL(string: "\(urlAPI)?limit=\(limit)&offset=\(offset)")
        else{
            print("URL NOT FOUND")
            return
        }
        URLSession.shared.dataTask(with: url){(data, res, error) in if error != nil {
            print("error \(error!)")
            return
        }
            
            do{
                if let data = data{
                    let result = try JSONDecoder().decode(PokedexResponse.self, from: data)
                    
                    self.itemsPokedex = result

                    print("count \(self.itemsPokedex.count)")
                    self.pokemons=[]
                    result.results.forEach(){ item in
                        self.fetchPokemon(urlpok: item.url)
                    }
                }
            }
            catch{
                print("fetch error \(error)")
            }
                    }.resume()
    }
    
    func fetchPokemon(urlpok:String){
        
        guard let url = URL(string:urlpok)
        else{
            print("URL NOT FOUND")
            return
        }
        URLSession.shared.dataTask(with: url){(data, res, error) in if error != nil {
            print("error \(error!)")
            return
        }
            do{
                if let data = data{
                    let result = try JSONDecoder().decode(PokemonModel.self, from: data)
                    
                    self.pokemon = result
                    self.pokemons.append(result)
                }
            }
            catch{
                print("fetch error \(error)")
            }
            
        }.resume()
    }
    
    func fetchPokemons (){
        
        
    }
}
