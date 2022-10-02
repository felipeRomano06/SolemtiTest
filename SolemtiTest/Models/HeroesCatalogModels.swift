
import Foundation

// MARK: - HeroesCaracters
struct HeroesCaracters: Codable {
    var code: Int?
    var status: String?
    var etag: String?
    var data: DataHereo?
}

// MARK: - DataClass
struct DataHereo: Codable {
    var offset, limit, total, count: Int?
    var results: [Result]?
}

// MARK: - Result
struct Result: Codable {
    var id: Int?
    var name, resultDescription: String?
    
    var thumbnail: Thumbnail?
    var resourceURI: String?
    var urls: [URLElement]?
    

}

// MARK: - Comics
struct Comics: Codable {
    var available: Int?
    var collectionURI: String?
    var items: [ComicsItem]?
    var returned: Int?
}

// MARK: - ComicsItem
struct ComicsItem: Codable {
    var resourceURI: String?
    var name: String?
}

// MARK: - Stories
struct Stories: Codable {
    var available: Int?
    var collectionURI: String?
    var items: [StoriesItem]?
    var returned: Int?
}

// MARK: - StoriesItem
struct StoriesItem: Codable {
    var resourceURI: String?
    var name: String?
    var type: TypeEnum?
    
}

enum TypeEnum: String, Codable {
    case cover = "cover"
    case interiorStory = "interiorStory"
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    var path: String?
    var `extension`: String?

    
}

// MARK: - URLElement
struct URLElement: Codable {
    var type: String?
    var url: String?
}

struct ParameterCaracter: Codable{
    var apikey:String //= "4051892e3bee2f5cadbfcc6ec4e3f4aa"
    var hash: String// = "330c80cf9c19f9f598994b73b35ee6f8"
    var ts: String // = "1664550867"
    var limit: Int
    var offset: Int // = 0
}



extension Encodable {
  func asDictionary() throws -> [String: Any] {
    let data = try JSONEncoder().encode(self)
    guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
      throw NSError()
    }
    return dictionary
  }
}
