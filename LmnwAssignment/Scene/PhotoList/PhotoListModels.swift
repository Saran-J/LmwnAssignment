import UIKit

enum PhotoList {
    enum GetPhoto {
        struct Request {
            var isRefresh: Bool
            var feature: String
        }
        struct Response {
            var photoResp: PhotoResponse
        }
        struct ViewModel {
            var photoList: [PhotoDisplay]
            var isLastPage: Bool
        }
    }
}

struct PhotoDisplay {
    let name: String
    let imageUrl: String
    let positiveVotes: String
    let description: String
}
