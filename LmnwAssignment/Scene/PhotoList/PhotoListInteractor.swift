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
    var page = 1
    
    func getPhoto(request: PhotoList.GetPhoto.Request) {
        if request.isRefresh {
            page = 0
        }
        page += 1
        
        getPhotoService.executeService(
            feature: request.feature,
            page: page)
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
