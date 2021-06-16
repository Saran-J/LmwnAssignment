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
        let response = PhotoResponse(
            currentPage: 0,
            totalPage: 0,
            photos: [photoItem])
        return response
    }
    
    static func getMockWithImageListEmpty() -> PhotoResponse {
        let photoItem = PhotoItem(
            id: 1,
            name: "aaaa",
            imageUrl: [],
            description: "ddddd",
            positiveVotesCount: 1000)
        let response = PhotoResponse(
            currentPage: 0,
            totalPage: 0,
            photos: [photoItem])
        return response
    }
    
    static func getMockWithResultNil() -> PhotoResponse {
        let response = PhotoResponse(
            currentPage: 0,
            totalPage: 0,
            photos: nil)
        return response
    }
}
