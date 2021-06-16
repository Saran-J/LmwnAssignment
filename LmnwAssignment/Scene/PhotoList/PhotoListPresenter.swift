import UIKit

protocol PhotoListPresentationLogic {
    func presentPhoto(response: PhotoList.GetPhoto.Response)
    func presentError(error: ServiceError)
}

class PhotoListPresenter: PhotoListPresentationLogic {
    weak var viewController: PhotoListDisplayLogic?
    
    func presentPhoto(response: PhotoList.GetPhoto.Response) {
        let photoDisplayList: [PhotoDisplay] =
            response.photoResp.photos?.map({ item -> PhotoDisplay in
                let voteCountDisplay =
                    NumberFormatComponent().formatDecimal(
                    number: item.positiveVotesCount)
                
                let photoDisplay = PhotoDisplay(
                    name: item.name,
                    imageUrl: item.imageUrl.first ?? "",
                    positiveVotes: voteCountDisplay,
                    description: item.description)
                return photoDisplay
            }) ?? []
        let viewModel = PhotoList.GetPhoto.ViewModel(
            photoList: photoDisplayList,
            isLastPage: response.photoResp.currentPage == response.photoResp.totalPage)
        viewController?.displayPhoto(viewModel: viewModel)
    }
    
    func presentError(error: ServiceError) {
        self.viewController?.displayError(error: error)
    }
}
