import Foundation
import XCTest
@testable import LmnwAssignment

class PhotoListInteractorTest: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func testWhenCallGetPhotoAndResultSuccessShouldCallPresentResult() {
        let interactor = PhotoListInteractor()
        interactor.getPhotoService = StubGetPhotoService(mockResult: .success)
        
        let presenter = SpyPhotoListPresenter()
        interactor.presenter = presenter
        
        let request = PhotoList.GetPhoto.Request(isRefresh: true, feature: "")
        interactor.getPhoto(request: request)
        XCTAssertEqual(true, presenter.presentPhotoCalled)
    }
    
    func testWhenCallGetPhotoAndResultFailShouldCallPresentError() {
        let interactor = PhotoListInteractor()
        interactor.getPhotoService = StubGetPhotoService(
            mockResult: .failure(error: ServiceError(.translateResponseFail)))
        
        let presenter = SpyPhotoListPresenter()
        interactor.presenter = presenter
        
        let request = PhotoList.GetPhoto.Request(isRefresh: true, feature: "")
        interactor.getPhoto(request: request)
        XCTAssertEqual(true, presenter.presentErrorCalled)
    }
    
    func testWhenCallGetPhotoAndResultFailWithUnknownErrrShouldCallPresentError() {
        let interactor = PhotoListInteractor()
        interactor.getPhotoService = StubGetPhotoService(
            mockResult: .failureUnknowError(error: .unknowError))
        
        let presenter = SpyPhotoListPresenter()
        interactor.presenter = presenter
        
        let request = PhotoList.GetPhoto.Request(isRefresh: true, feature: "")
        interactor.getPhoto(request: request)
        XCTAssertEqual(true, presenter.presentErrorCalled)
    }
}
