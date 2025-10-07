//
//  ErrorDetails.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/7/25.
//


//
//  ErrorDetails.swift
//  TravelBuddy
//
//  Created by Admin on 5/8/23.
//

import Foundation

@Observable
class ErrorDetails {
    
    private(set) var title: String = ""
    private(set) var message: String = ""
    private(set) var errorId: UUID?
    
    private(set) var requestError: RequestError?
    
    var isEmpty: Bool {
        title == "" ||  message == ""
    }
    var hasError: Bool {
        errorId != nil
    }
    
    func update(_ title: String, _ message: String) {
        self.title = title
        self.message = message
        errorId = UUID()
    }
    
    func clear() {
        title = ""
        message = ""
        errorId = nil
    }
    
    func setRequestError(_ error: RequestError?) {
        self.requestError = error
    }
    
}

extension ErrorDetails {
    convenience init(title: String, message: String) {
        self.init()
        //self.update(title, message)
    }
}
