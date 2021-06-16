import Foundation
import RxSwift
@testable import LmnwAssignment

class StubGetPhotoService: GetPhotoService {
    let result: MockResult
    
    public init(mockResult: MockResult) {
        result = mockResult
    }
    
    override func executeService(feature: String, page: Int) -> Observable<PhotoResponse> {
        switch result {
        case .success:
            let response = PhotoResponse(photos: [])
            return .just(response)
        case .failure(let error):
            return .error(error)
        case .failureUnknowError(let error):
            return .error(error)
        }
    }
}
