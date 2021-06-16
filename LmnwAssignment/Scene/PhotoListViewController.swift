import UIKit

protocol PhotoListDisplayLogic: class {
    func displayPhoto(viewModel: PhotoList.GetPhoto.ViewModel)
}

class PhotoListViewController: UIViewController, PhotoListDisplayLogic {
    
    
    var interactor: PhotoListBusinessLogic?
    var router: (NSObjectProtocol & PhotoListRoutingLogic & PhotoListDataPassing)?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let viewController = self
        let interactor = PhotoListInteractor()
        let presenter = PhotoListPresenter()
        let router = PhotoListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func displayPhoto(viewModel: PhotoList.GetPhoto.ViewModel) {
    }
}
