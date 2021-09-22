//
//  ChannelModel.swift
//  MoviesAppTask_GizaSys
//
//  Created by Saber on 19/09/2021.
//

import Foundation
import CoreData

// MARK: - ChannelContainer
@objc(ChannelContainer)
class ChannelContainer: NSManagedObject, Codable {
    
    @NSManaged var channels: [Channel]?
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    required convenience init(from decoder: Decoder) throws {
        guard let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext,
              let managedObjectContext = decoder.userInfo[codingUserInfoKeyManagedObjectContext] as? NSManagedObjectContext,let entity = NSEntityDescription.entity(forEntityName: DatabaseConstants.channelContainerEntityName, in: managedObjectContext) else {
            print("errorrrroo")
            // return
            fatalError("Failed to decode Account")
        }
        self.init(entity: entity, insertInto: managedObjectContext)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dataContainer = try container.nestedContainer(keyedBy: ChannelDataCodingKeys.self, forKey: .data)
        self.channels = try (dataContainer.decodeIfPresent([Channel].self, forKey: .channels))
        
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        var dataContainer = container.nestedContainer(keyedBy: ChannelDataCodingKeys.self, forKey: .data)
        
        try dataContainer.encode(channels, forKey: .channels)
    }
    
}
//MARK: - Data object Coding Keys
enum ChannelDataCodingKeys: String, CodingKey {
    case channels
}


// MARK: - Channel
@objc(Channel)
class Channel:NSManagedObject, Codable {
    @NSManaged var title: String?
    @NSManaged var series: [Series]?
    @NSManaged var latestMedia: [LatestMedia]?
    @NSManaged var id: String?
    @NSManaged var iconAssetURL: String?
    @NSManaged var coverAssetURL: String?
    
    enum CodingKeys: String, CodingKey {
        case title,  id
        case iconAsset
        case coverAsset
        case series
        case latestMedia
        
    }
    required convenience init(from decoder: Decoder) throws {
        guard let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext,
              let managedObjectContext = decoder.userInfo[codingUserInfoKeyManagedObjectContext] as? NSManagedObjectContext,let entity = NSEntityDescription.entity(forEntityName: DatabaseConstants.channelEntityName, in: managedObjectContext) else {
            print("errorrrroo")
            // return
            fatalError("Failed to decode Account")
        }
        self.init(entity: entity, insertInto: managedObjectContext)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
//        self.mediaCount = try container.decodeIfPresent(Int64.self, forKey: .mediaCount)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.series = try container.decodeIfPresent([Series].self, forKey: .series)
        self.latestMedia = try container.decodeIfPresent([LatestMedia].self, forKey: .latestMedia)
        
        let coverAssetContainer = try container.nestedContainer(keyedBy: CoverAssetCodingKeys.self, forKey: .coverAsset)
        self.coverAssetURL = try coverAssetContainer.decodeIfPresent(String.self, forKey: .url)

        let IconAssetContainer = try container.nestedContainer(keyedBy: IconAssetCodingKeys.self, forKey: .iconAsset)
        
        self.iconAssetURL = try IconAssetContainer.decodeIfPresent(String.self, forKey: .thumbnailUrl)
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(series, forKey: .series)
        try container.encodeIfPresent(latestMedia, forKey: .latestMedia)

        var coverAssetContainer =  container.nestedContainer(keyedBy: CoverAssetCodingKeys.self, forKey: .coverAsset)
        try coverAssetContainer.encodeIfPresent(coverAssetURL, forKey: .url)
        
        var IconAssetContainer =  container.nestedContainer(keyedBy: IconAssetCodingKeys.self, forKey: .iconAsset)
        try IconAssetContainer.encodeIfPresent(iconAssetURL, forKey: .thumbnailUrl)
        
    }
    
}

// MARK: - CoverAsset Coding keys

enum CoverAssetCodingKeys: String, CodingKey {
    case url
}

// MARK: - IconAsset Coding keys
enum IconAssetCodingKeys: String, CodingKey {
    case thumbnailUrl
}

// MARK: - LatestMedia
@objc(LatestMedia)
class LatestMedia:NSManagedObject, Codable {
    var type: String?
    var title: String?
    var coverAssetURL: String?
    
    enum CodingKeys: String, CodingKey {
        case type, title
        case coverAsset
    }
    required convenience init(from decoder: Decoder) throws {
        guard let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext,
              let managedObjectContext = decoder.userInfo[codingUserInfoKeyManagedObjectContext] as? NSManagedObjectContext,let entity = NSEntityDescription.entity(forEntityName: DatabaseConstants.latestMediaEntityName, in: managedObjectContext) else {
            print("errorrrroo")
            // return
            fatalError("Failed to decode Account")
        }
        self.init(entity: entity, insertInto: managedObjectContext)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        
        let coverAssetContainer = try container.nestedContainer(keyedBy: CoverAssetCodingKeys.self, forKey: .coverAsset)
        self.coverAssetURL = try coverAssetContainer.decodeIfPresent(String.self, forKey: .url)
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(title, forKey: .title)
        
        var coverAssetContainer =  container.nestedContainer(keyedBy: CoverAssetCodingKeys.self, forKey: .coverAsset)
       try coverAssetContainer.encodeIfPresent(coverAssetURL, forKey: .url)
    }
    
}



// MARK: - Series
@objc(Series)
class Series:NSManagedObject, Codable {
    var title: String?
    var id: String?
    var coverAssetURL: String?
    
    enum CodingKeys: String, CodingKey {
        case title, id
        case coverAsset
    }
    required convenience init(from decoder: Decoder) throws {
        guard let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext,
              let managedObjectContext = decoder.userInfo[codingUserInfoKeyManagedObjectContext] as? NSManagedObjectContext,let entity = NSEntityDescription.entity(forEntityName: DatabaseConstants.seriesEntityName, in: managedObjectContext) else {
            print("errorrrroo")
            // return
            fatalError("Failed to decode Account")
        }
        self.init(entity: entity, insertInto: managedObjectContext)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        
        let coverAssetContainer = try container.nestedContainer(keyedBy: CoverAssetCodingKeys.self, forKey: .coverAsset)
        self.coverAssetURL = try coverAssetContainer.decodeIfPresent(String.self, forKey: .url)
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(title, forKey: .title)
        
        var coverAssetContainer =  container.nestedContainer(keyedBy: CoverAssetCodingKeys.self, forKey: .coverAsset)
       try coverAssetContainer.encodeIfPresent(coverAssetURL, forKey: .url)
    }

}