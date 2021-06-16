import UIKit
import RxSwift

protocol PhotoListBusinessLogic {
    func getPhoto(request: PhotoList.GetPhoto.Request)
}

protocol PhotoListDataStore {
}

class PhotoListInteractor: PhotoListBusinessLogic, PhotoListDataStore {
    var presenter: PhotoListPresentationLogic?
    var getPhotoService = GetPhotoService()
    var disposeBag = DisposeBag()
    
    func getPhoto(request: PhotoList.GetPhoto.Request) {
        getPhotoService.executeService(
            feature: request.feature,
            page: request.page)
            .subscribe { [weak self] resp in
                self?.handleGetPhotoResponse(resp: resp)
            } onError: { [weak self] error in
                let serviceError = (error as? ServiceError) ?? ServiceError(.unknownError)
                self?.presenter?.presentError(error: serviceError)
            }
            .disposed(by: disposeBag)
    }
    
    private func handleGetPhotoResponse(resp: PhotoResponse) {
        let response = PhotoList.GetPhoto.Response(photoResp: resp)
        self.presenter?.presentPhoto(response: response)
    }
}
