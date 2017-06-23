//
//  API.swift
//  testProject
//
//  Created by Graf iOS Developer on 22.06.17.
//  Copyright © 2017 v-jet. All rights reserved.
//

import Foundation
import Alamofire

class ResponseObject {
    let error:Error? = nil
    let response = Array<Any>()
    let originalResponse:AnyObject? = nil
    let userData:AnyObject? = nil
}

class WebManager {

    
    private func sendRequest(method: HTTPMethod, action: String? = nil, params: Parameters? = nil, userData:AnyObject? = nil, header: HTTPHeaders?, completionHandler:(ResponseObject) -> ()) {
        
        var requestString = "http://api.doitserver.in.ua"
        
        if (action != nil) {
            requestString = requestString.appending(action!)
        }
        
        Alamofire.request(requestString, method: method, parameters: params, encoding: JSONEncoding.default, headers: header).responseJSON { response in
            
            
            print("1")
        }
    }
    
    
    func signIn(with email: String!, password: String!, completionHandler:(ResponseObject) -> ()) {
        
        let params = Parameters(dictionaryLiteral: ("email", email),("password", password))
        
        self.sendRequest(method: .post, action: "/login", params: params, header: nil) { response in
            
            print("1")
        }
    }
    
}
