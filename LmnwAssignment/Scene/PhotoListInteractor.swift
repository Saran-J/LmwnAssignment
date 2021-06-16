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
            .subscribe { response in
                print(response)
            } onError: { error in
                print(error)
            }
            .disposed(by: disposeBag)
    }
}
