import Foundation
@testable import LmnwAssignment

class SpyPhotoListPresenter: PhotoListPresentationLogic {
    var presentPhotoCalled = false
    var presentErrorCalled = false
    func presentPhoto(response: PhotoList.GetPhoto.Response) {
        presentPhotoCalled = true
    }
    
    func presentError(error: ServiceError) {
        presentErrorCalled = true
    }
}
