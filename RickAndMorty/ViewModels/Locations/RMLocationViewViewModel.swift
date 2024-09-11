//
//  RMLocationViewViewModel.swift
//  RickAndMorty
//
//  Created by Tal talspektor on 04/09/2024.
//

import Foundation

protocol RMLocationViewViewModelDelegate: AnyObject {
    func didFetchInitialLocations()
}

final class RMLocationViewViewModel {
    
    public weak var delegate: RMLocationViewViewModelDelegate?
    
    private var locations: [RMLocation] = [] {
        didSet {
            for location in locations {
                let cellViewModel = RMLocationTableViewCellViewModel(location: location)
                if !cellViewModels.contains(cellViewModel) {
                    cellViewModels.append(cellViewModel)
                }
            }
        }
    }
    
    // Location response info
    // Will contain next url, if present
    private var apiInfo: RMGetAllLocationsResponse.Info?
    
    private(set) var cellViewModels: [RMLocationTableViewCellViewModel] = []
    
    public var shouldShowLoadMoreIndicator: Bool {
        apiInfo?.next != nil
    }
    
    public var isLoadingMoreLocations = false
    
    private var didFinishPagination: (() -> Void)?
    
    // MARK: - Init
    
    init() {}
    
    public func registerDidFinishPaginationBlock(_ block: @escaping () -> Void) {
        self.didFinishPagination = block
    }
    
    // Paginate if additional locations are needed
    public func fetchAdditionalLoacations() {
        guard !isLoadingMoreLocations else {
            return
        }
        
        guard let nextUrlString = apiInfo?.next,
              let url = URL(string: nextUrlString) else {
            return
        }
        
        isLoadingMoreLocations = true
        
        guard let request = RMRequest(url: url) else {
            isLoadingMoreLocations = false
            return
        }
        
        RMService.shared.execute(request,
                                 expecting: RMGetAllLocationsResponse.self) { [weak self] result in
            guard let strongSelf = self else {
                return
            }
            
            switch result {
            case .success(let responseModel):
                let moreResults = responseModel.results
                let info = responseModel.info
                strongSelf.apiInfo = info
                strongSelf.cellViewModels.append(contentsOf: moreResults.compactMap {
                    .init(location: $0)
                })
                DispatchQueue.main.sync {
                    strongSelf.isLoadingMoreLocations = false
                    
                    // Notify via callback
                    strongSelf.didFinishPagination?()
                }
            case .failure(let error):
                print(String(describing: error))
                strongSelf.isLoadingMoreLocations = false
            }
        }
        // Fetch chatactors
    }
    
    public func location(at index: Int) -> RMLocation? {
        guard index < locations.count, index >= 0 else {
            return nil
        }
        return self.locations[index]
    }
    
    public func fetchLocations() {
        RMService.shared.execute(
            .lisetLocationReqiest,
            expecting: RMGetAllLocationsResponse.self
        ) { [weak self] result in
            switch result {
            case .success(let model):
                self?.apiInfo = model.info
                self?.locations = model.results
                DispatchQueue.main.async {
                    self?.delegate?.didFetchInitialLocations()
                }
            case .failure(let error):
                // TODO: Handle error
                break
            }
        }
    }
    
    private var hasMoreResults: Bool {
        false
    }
    

}
