import Foundation
@testable import LmnwAssignment

class MockGetPhotoResponse: NSObject {
    static func getMock() -> PhotoResponse {
        let photoItem = PhotoItem(
            id: 1,
            name: "aaaa",
            imageUrl: ["bbb", "cccc"],
            description: "ddddd",
            positiveVotesCount: 1000)
        let response = PhotoResponse(photos: [photoItem])
        return response
    }
    
    static func getMockWithImageListEmpty() -> PhotoResponse {
        let photoItem = PhotoItem(
            id: 1,
            name: "aaaa",
            imageUrl: [],
            description: "ddddd",
            positiveVotesCount: 1000)
        let response = PhotoResponse(photos: [photoItem])
        return response
    }
    
    static func getMockWithResultNil() -> PhotoResponse {
        let response = PhotoResponse(photos: nil)
        return response
    }
}
