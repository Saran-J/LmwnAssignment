import Foundation
import Moya
import RxSwift

struct PhotoResponse: Codable {
    var photos: [PhotoItem]?
}

struct PhotoItem: Codable {
    var id: Int
    var imageUrl: [String]
    var description: String
    var positiveVotesCount: Int
}

class GetPhotoService: BaseService<PhotoProvider, PhotoResponse> {
    func executeService(feature: String, page: Int) -> Observable<PhotoResponse> {
        return super.callService(
            target: PhotoProvider.getPhoto(feature: feature, page: page)
        )
    }
}
