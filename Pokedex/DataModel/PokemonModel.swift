
import Foundation

struct PokemonModel:Codable {
    
    var abilities:[Abilities] = []
    var base_experience: Int = 0
    //var forms
    //var game_indices: [],
    var height: Int = 0
    //var held_items: [ ],
    var id:Int = 0
    var is_default:Bool = true
    var location_area_encounters:String = ""
    //var moves: [],
    var name:String = ""
    var order:Int = 0
    //var past_types: [ ],
    //var species: {},
    var sprites:Sprite = Sprite()
    var stats:[Stats] = []
    //var types: [],
    var weight:Int = 0
    
}

struct Abilities:Codable{
    var ability:Ability = Ability()
    
}

struct Ability:Codable{
    
    var name:String = ""
    
}

struct Sprite:Codable{
    var front_default:String = ""
    var other: OfficialArtWork = OfficialArtWork()
    
}


struct OfficialArtWork: Codable {
    
    var artWork: FrontDefault = FrontDefault()
    
    private enum CodingKeys: String, CodingKey {
        
        case artWork = "official-artwork"
            
    }
    
}

struct FrontDefault: Codable {
    var front_default: String = ""
}

struct Stats:Codable{
    var base_stat:Int = 0
    var stat:Stat = Stat()
    
   
}
struct Stat:Codable{
    var name:String = ""
}
