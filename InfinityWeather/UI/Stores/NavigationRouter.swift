//
//  NavigationRouter.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/7/25.
//

import SwiftUI

@Observable
class NavigationRouter {
     var route: Route = .home
     var mainRoutes : [Route] = [.home, .favorites]
    
    func navigateTo(_ route: Route) {
        self.route = route
    }
}
