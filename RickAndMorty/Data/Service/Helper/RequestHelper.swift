//
//  RequestHelper.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import Alamofire

class RequestHelper {
    static var headerContentType = "Content-Type"
    static var headerContentTypeValue = "application/json; charset=utf-8"
    static var headerAccept = "Accept"
    static var headerAcceptValue = "application/json"

    // Call ws with or without any authentication
    static func requestExecute(_ url: String, parameters: [String: Any], method: HTTPMethod, encoding: ParameterEncoding? = URLEncoding.default,
                               success: @escaping (_ response: AFDataResponse<Data>) -> Void, failure: @escaping (_ error: Error?) -> Void) {
        let param: Parameters = parameters
        let headers: HTTPHeaders = addAnonymousHeaders()
        AF.request(url, method: method, parameters: param, encoding: encoding!, headers: headers).responseData(completionHandler: { response in
            print(response.debugDescription)
            if response.error == nil {
                success(response)
            } else {
                failure(response.error)
            }
        })
    }

    private static func addAnonymousHeaders() -> HTTPHeaders {
        return [headerContentType: headerContentTypeValue, headerAccept: headerAcceptValue]
    }
}
