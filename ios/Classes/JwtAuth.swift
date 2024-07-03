//
//  JwtAuth.swift
//  zendesk_helper
//
//  Created by José Cleiton Correia on 03/07/24.
//

import Foundation
import ChatProvidersSDK

class JWTAuth: NSObject, JWTAuthenticator {
    private let token: String
    private let result: FlutterResult

    init(result: @escaping FlutterResult, token: String) {
        self.token = token
        self.result = result
    }

    func getToken(_ completion: @escaping (String?, Error?) -> Void) {
        completion(token, nil)
        result(true)
    }
}
