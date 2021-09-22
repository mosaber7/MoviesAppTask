//
//  Media.swift
//  MoviesAppTask_GizaSys
//
//  Created by Saber on 19/09/2021.
//

import Foundation
import CoreData

// MARK: - MediaContainer
@objc(MediaContainer)
class MediaContainer: NSManagedObject, Codable {
    @NSManaged var media: [Media]?
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    required convenience init(from decoder: Decoder) throws {
        guard let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext,
              let managedObjectContext = decoder.userInfo[codingUserInfoKeyManagedObjectContext] as? NSManagedObjectContext,let entity = NSEntityDescription.entity(forEntityName: DatabaseConstants.mediaContainerEntityName, in: managedObjectContext) else {
            print("errorrrroo")
            // return
            fatalError("Failed to decode Account")
        }
        self.init(entity: entity, insertInto: managedObjectContext)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dataContainer = try container.nestedContainer(keyedBy: MediaDataCodingKeys.self, forKey: .data)
        self.media = try (dataContainer.decodeIfPresent([Media].self, forKey: .media))
    
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        var dataContainer = container.nestedContainer(keyedBy: MediaDataCodingKeys.self, forKey: .data)
        try dataContainer.encode(media, forKey: .media)
    }
    
}


// MARK: - DataClass Coding Keys
enum MediaDataCodingKeys: String, CodingKey {
    case media
}

// MARK: - Media
@objc(Media)
class Media: NSManagedObject, Codable {
    @NSManaged var type, title: String?
    @NSManaged var channelTitle: String?
    @NSManaged var coverAssetURL: String?
    
    
    enum CodingKeys: String, CodingKey {
        case type
        case title
        case coverAsset
        case channel
    }
    required convenience init(from decoder: Decoder) throws {
        guard let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext,
              let managedObjectContext = decoder.userInfo[codingUserInfoKeyManagedObjectContext] as? NSManagedObjectContext,let entity = NSEntityDescription.entity(forEntityName: DatabaseConstants.mediaEntityName, in: managedObjectContext) else {
            print("errorrrroo")
            // return
            fatalError("Failed to decode Account")
        }
        self.init(entity: entity, insertInto: managedObjectContext)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        
        let coverAssetContainer = try container.nestedContainer(keyedBy: MediaCoverAssetCodingKeys.self, forKey: .coverAsset)
        self.coverAssetURL = try (coverAssetContainer.decodeIfPresent(String.self, forKey: .url))
        let channelContainer = try container.nestedContainer(keyedBy: MediaChannelCodingKeys.self, forKey: .channel)
        self.channelTitle = try (channelContainer.decodeIfPresent(String.self, forKey: .title))
    
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(title, forKey: .title)
        var coverAssetContainer =  container.nestedContainer(keyedBy: MediaCoverAssetCodingKeys.self, forKey: .coverAsset)
        try coverAssetContainer.encodeIfPresent(coverAssetURL, forKey: .url)
        var channelContainer =  container.nestedContainer(keyedBy: MediaChannelCodingKeys.self, forKey: .channel)
        try channelContainer.encodeIfPresent(channelTitle, forKey: .title)
        
    }
    
}

// MARK: - Channel CodingKeys
enum MediaChannelCodingKeys: String, CodingKey {
    case title
}


// MARK: - CoverAsset coding Keys
enum MediaCoverAssetCodingKeys: String, CodingKey{
    case url
}

