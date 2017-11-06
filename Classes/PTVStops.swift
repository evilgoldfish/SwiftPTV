//
//  PTVStops.swift
//  SwiftPTV
//
//  Copyright (c) 2017 evilgoldfish.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

public extension SwiftPTV {

    /// Retrieve all stops on a specific route.
    ///
    /// - Parameters:
    ///   - routeID: Identifier of route, returned by Routes API.
    ///   - routeType: Number identifying transport mode, returned via RouteTypes API.
    ///   - parameters: The parameters to be passed to the API as a query string. Can be `nil`.
    ///   - completionHandler: The completion handler to call when the request is complete.
    func retrieveStopsOnRoute(routeID: Int, routeType: RouteType, parameters: [String : Any]?, _ completionHandler: @escaping (StopsOnRouteResponse?) -> ()) {
        guard let routeType = routeType.type else {
            completionHandler(nil)
            return
        }
        
        retrieveURL(endpoint: "/v3/stops/route/\(routeID)/route_type/\(routeType)", parameters: parameters) { data in
            if let data = data {
                let response = try? self.decoder.decode(StopsOnRouteResponse.self, from: data)
                completionHandler(response)
            } else {
                completionHandler(nil)
            }
        }
    }

}
