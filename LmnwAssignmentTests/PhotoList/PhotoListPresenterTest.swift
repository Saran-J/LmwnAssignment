import Foundation
import XCTest
@testable import LmnwAssignment

class PhotoListPresenterTest: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func testWhenCallPresentGetPhotoShouldCallDisplayPhoto() {
        let presenter = PhotoListPresenter()
        let viewController = SpyPhotoListViewController()
        presenter.viewController = viewController
        
        let mockResponse = MockGetPhotoResponse.getMock()
        let response = PhotoList.GetPhoto.Response(photoResp: mockResponse)
        presenter.presentPhoto(response: response)
        
        XCTAssertEqual(true, viewController.displayPhotoCalled)
    }
    
    func testWhenCallPresentGetPhotoWhenResultNilShouldCallDisplayPhoto() {
        let presenter = PhotoListPresenter()
        let viewController = SpyPhotoListViewController()
        presenter.viewController = viewController
        
        let mockResponse = MockGetPhotoResponse.getMockWithResultNil()
        let response = PhotoList.GetPhoto.Response(photoResp: mockResponse)
        presenter.presentPhoto(response: response)
        
        XCTAssertEqual(true, viewController.displayPhotoCalled)
    }
    
    func testWhenCallPresentGetPhotoWhenImageListEmptyShouldCallDisplayPhoto() {
        let presenter = PhotoListPresenter()
        let viewController = SpyPhotoListViewController()
        presenter.viewController = viewController
        
        let mockResponse = MockGetPhotoResponse.getMockWithImageListEmpty()
        let response = PhotoList.GetPhoto.Response(photoResp: mockResponse)
        presenter.presentPhoto(response: response)
        
        XCTAssertEqual(true, viewController.displayPhotoCalled)
    }
    
    func testWhenCallPresentErrorShouldCallDisplayError() {
        let presenter = PhotoListPresenter()
        
        let viewController = SpyPhotoListViewController()
        presenter.viewController = viewController
        
        presenter.presentError(error: ServiceError(.translateResponseFail))
        XCTAssertEqual(true, viewController.displayErrorCalled)
    }
}
