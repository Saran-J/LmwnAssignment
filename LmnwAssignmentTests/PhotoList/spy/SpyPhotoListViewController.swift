import Foundation
@testable import LmnwAssignment

class SpyPhotoListViewController: PhotoListDisplayLogic {
    var displayPhotoCalled = false
    var displayErrorCalled = false
    func displayPhoto(viewModel: PhotoList.GetPhoto.ViewModel) {
        displayPhotoCalled = true
    }
    
    func displayError(error: ServiceError) {
        displayErrorCalled = true
    }
}
