
import Foundation

struct PokedexResponse:Codable{
    var count:Int = 0
    //var next:String = ""
    //var previous:String = ""
    var results:[PokedexResponseItem] = []
    
}

struct PokedexResponseItem:Codable{
    var name:String = ""
    var url:String = ""
}
