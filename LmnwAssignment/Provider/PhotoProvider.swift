import Foundation
import Moya

enum PhotoProvider {
    case getPhoto(feature: String, page: Int)
}

extension PhotoProvider: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.500px.com") ?? URL(fileURLWithPath: "")
    }
    
    var path: String {
        switch self {
        case .getPhoto:
            return "/v1/photos"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getPhoto:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case let .getPhoto(feature, page):
            return .requestParameters(
                parameters: ["feature": feature, "page": page, "rpp": 10],
                encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
    var sampleData: Data {
        return "".data(using: .utf8) ?? Data()
    }
}
