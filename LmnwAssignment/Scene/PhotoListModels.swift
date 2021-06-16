import UIKit

enum PhotoList {
    enum getPhoto {
        struct Request {
            var page: Int
            var feature: String
        }
        struct Response {
            var photoResp: PhotoResponse?
        }
        struct ViewModel {
            var photoList: [PhotoDisplay]
        }
    }
}

struct PhotoDisplay {
    let imageUrl: String
    let positiveVotes: Int
    let description: String
}
