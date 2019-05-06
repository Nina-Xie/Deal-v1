////
////  NetworkManager.swift
////  Deal
////
////  Created by Nina Xie on 4/26/19.
////  Copyright © 2019 F(X). All rights reserved.
////
//
//import Foundation
//import Alamofire
//
//class NetworkManager {
//    
//    private static let endpoint = "http"
//    
//    static func getFavoriteItems (completion: @escaping ([Item]) -> Void){
//        Alamofire.request(endpoint, method: .get).validate().response { response in
//            switch response.result{
//            case .success(let data):
//                let jsonDecoder = JSONDecoder()
//                if let favoriteItems = try? jsonDecoder.decode(FavoriteItemList.self, from: data){
//                    completion(favoriteItems)
//                } else {
//                    print("Invalid response data")
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
//    
//    static func getUser (completion: @escaping(user) -> Void){
//        Alamofire.request(endpoint, method: .get).validate().response { response in
//            switch response.result{
//            case .success(let data):
//                let jsonDecoder = JSONDecoder()
//                if let user = try? jsonDecoder.decode(User.self, from: data){
//                    
//                }
//            case .failure(let error):
//                print(error.localizeDescription)
//                
//            }
//        }
//    }
//    
//}
//
