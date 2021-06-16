import UIKit
protocol PhotoListBusinessLogic {
}

protocol PhotoListDataStore {
}

class PhotoListInteractor: PhotoListBusinessLogic, PhotoListDataStore {
    var presenter: PhotoListPresentationLogic?
    var worker: PhotoListWorker?
}
