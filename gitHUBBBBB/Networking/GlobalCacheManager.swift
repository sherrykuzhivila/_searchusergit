//
//  GlobalCacheManager.swift
//  RGSeed
//
//  Created by MAC on 31/08/22.
//


//import Foundation
//
//class GlobalCacheManager {
//    
//    static let shared = GlobalCacheManager()
//    private var networkCache = [String: Any]()
//    private var cacheTimings = [String: Date]()
//    let cacheExpiryTime: TimeInterval = 20 * 1
//    
//    private init() {}
//    
//    func cache(data: Any, for router: NetworkRouter) {
//        if let key = router.urlRequest?.url?.absoluteString, router.shouldCache {
//            networkCache[key] = data
//            cacheTimings[key] = Date()
//        }
//    }
//    
//    func cached<T>(for router: NetworkRouter, of type: T.Type) -> T? {
//        if let key = router.urlRequest?.url?.absoluteString {
//            if let data = networkCache[key] {
//                if let result = data as? T {
//                    if router.shouldCache {
//                        if !cacheExpired(router: router) {
//                            return result
//                        }
//                    }
//                }
//            }
//        }
//        return nil
//    }
//    
//    func cacheExpired(router: NetworkRouter) -> Bool {
//        guard let key = router.urlRequest?.url?.absoluteString, let lastFetchedTime = self.cacheTimings[key] else {
//            return true
//        }
//        if lastFetchedTime.addingTimeInterval(cacheExpiryTime) > Date() {
//            return false
//        } else {
//            networkCache.removeValue(forKey: key)
//            cacheTimings.removeValue(forKey: key)
//            return true
//        }
//    }
//    
//}
