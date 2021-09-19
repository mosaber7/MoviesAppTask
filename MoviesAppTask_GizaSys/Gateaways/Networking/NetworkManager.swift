//
//  NetworkManager.swift
//  MoviesAppTask_GizaSys
//
//  Created by Saber on 19/09/2021.
//

import Foundation
import Alamofire

class NetworkManager{
    // Block to handle responses in case of success and have data
    typealias NetworkSuccessBlock = (_ T:Decodable?)->Void
    
   static func retrieveCatgories<T>(modelType: T.Type, successBlock:@escaping NetworkSuccessBlock) where T : Decodable{
        let req = MoviesRequestFactory.media
        AF.request(req).responseJSON { (response) in
            do{
                guard let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext else {
                    fatalError("Failed to retrieve managed object context")
                }
                let jsonDecoder = JSONDecoder()
                
                let managedObjectContext = CoreDataManager.shared.persistentContainer.viewContext
                jsonDecoder.userInfo[codingUserInfoKeyManagedObjectContext] = managedObjectContext
                
                let modelResponse =   try jsonDecoder.decode(T.self, from: response.data!)
                print(modelResponse)

                try managedObjectContext.save()
                
            let categoriesData =   try jsonDecoder.decode(T.self, from: response.data!)
                DispatchQueue.main.async {
              successBlock(categoriesData)
                }
            }catch let error{
                print(error)
                fatalError(error.localizedDescription)
            }
        }
        
    }
    
  
    
    
    
}
