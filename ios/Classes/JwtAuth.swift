//
//  JwtAuth.swift
//  zendesk_chat
//

import Foundation
import ChatProvidersSDK

class JWTAuth: NSObject, JWTAuthenticator {
    private let token: String

    init(token: String) {
        self.token = token
    }

    func getToken(_ completion: @escaping (String?, Error?) -> Void) {
        completion(token, nil)
    }

    func waitGetTokenSucceed() {
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()

        getToken { token, error in
            if let error = error {
               print("getToken error -> \(error)")
            }

            dispatchGroup.leave()
        }

        dispatchGroup.wait()
    }
}
