import Foundation
import Moya
import RxSwift

struct PhotoResponse: Codable {
    var currentPage: Int
    var totalPage: Int
    var photos: [PhotoItem]?
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case totalPage = "total_pages"
        case photos = "photos"
    }
}

struct PhotoItem: Codable {
    var id: Int
    var name: String
    var imageUrl: [String]
    var description: String
    var positiveVotesCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case imageUrl = "image_url"
        case description = "description"
        case positiveVotesCount = "positive_votes_count"
    }
}

class GetPhotoService: BaseService<PhotoProvider, PhotoResponse> {
    func executeService(feature: String, page: Int) -> Observable<PhotoResponse> {
        return super.callService(
            target: PhotoProvider.getPhoto(feature: feature, page: page)
        )
    }
}
