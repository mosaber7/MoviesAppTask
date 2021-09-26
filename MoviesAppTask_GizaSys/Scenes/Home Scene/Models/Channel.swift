////
////  ChannelModel.swift
////  MoviesAppTask_GizaSys
////
////  Created by Saber on 19/09/2021.
////
//
//import Foundation
//import CoreData
//
//
//
//// MARK: - ChannelContiner
//@objc(ChannelContiner)
//class ChannelContainer: NSManagedObject ,Codable {
//    @NSManaged var channels: [Channel]?
//
//    enum CodingKeys: String, CodingKey {
//        case data
//    }
//    required convenience init(from decoder: Decoder) throws {
//        guard let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext,
//              let managedObjectContext = decoder.userInfo[codingUserInfoKeyManagedObjectContext] as? NSManagedObjectContext,let entity = NSEntityDescription.entity(forEntityName: DatabaseConstants.channelContainerEntityName, in: managedObjectContext) else {
//            print("error")
//            // return
//            fatalError("Failed to decode Account")
//        }
//        self.init(entity: entity, insertInto: managedObjectContext)
//
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        let dataContainer = try container.nestedContainer(keyedBy: DataClassCodingKeys.self, forKey: .data)
//        self.channels = try (dataContainer.decodeIfPresent([Channel].self, forKey: .channels))
//
//    }
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        var dataClassContainer = container.nestedContainer(keyedBy: DataClassCodingKeys.self, forKey: .data)
//        try dataClassContainer.encodeIfPresent(channels, forKey: .channels)
//    }
//
//}
//
//// MARK: - DataClass
//enum DataClassCodingKeys: String, CodingKey{
//    case channels
//}
//
//// MARK: - Channel
//@objc(Channel)
//class Channel: NSManagedObject, Codable {
//    @NSManaged var title: String?
//    @NSManaged var series: [Series]?
//    @NSManaged var latestMedia: [LatestMedia]?
// //   @NSManaged var id: String?
//    @NSManaged var iconAssetURL: String?
//    @NSManaged  var coverAssetURL: String?
//
//    enum CodingKeys: String, CodingKey {
//        case title
//        case series
//        case latestMedia
//        case iconAsset
//        case coverAsset
//    }
//    required convenience init(from decoder: Decoder) throws {
//        guard let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext,
//              let managedObjectContext = decoder.userInfo[codingUserInfoKeyManagedObjectContext] as? NSManagedObjectContext,let entity = NSEntityDescription.entity(forEntityName: DatabaseConstants.channelEntityName, in: managedObjectContext) else {
//            print("errorrrroo")
//            // return
//            fatalError("Failed to decode Account")
//        }
//        self.init(entity: entity, insertInto: managedObjectContext)
//
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.title = try container.decodeIfPresent(String.self, forKey: .title)
//        self.series = try container.decodeIfPresent([Series].self, forKey: .series)
//        self.latestMedia = try container.decodeIfPresent([LatestMedia].self, forKey: .latestMedia)
//
//        let iconAssetContainer = try container.nestedContainer(keyedBy: IconAssetCodingKeys.self, forKey: .iconAsset)
//        self.iconAssetURL = try iconAssetContainer.decodeIfPresent(String.self, forKey: .iconAssetURL)
//
//        let coverAssetContainer = try container.nestedContainer(keyedBy: CoverAssetCodingKeys.self, forKey: .coverAsset)
//        self.coverAssetURL = try coverAssetContainer.decodeIfPresent(String.self, forKey: .coverAssetURL)
//
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encodeIfPresent(title, forKey: .title)
//        try container.encodeIfPresent(series, forKey: .series)
//        try container.encodeIfPresent(latestMedia, forKey: .latestMedia)
//
//        var iconAssetContainer = container.nestedContainer(keyedBy: IconAssetCodingKeys.self, forKey: .iconAsset)
//        try iconAssetContainer.encodeIfPresent(iconAssetURL, forKey: .iconAssetURL)
//
//        var coverAssetContainer = container.nestedContainer(keyedBy: CoverAssetCodingKeys.self, forKey: .coverAsset)
//        try coverAssetContainer.encodeIfPresent(coverAssetURL, forKey: .coverAssetURL)
//    }
//
//}
//
//// MARK: - CoverAsset CodingKeys
//enum CoverAssetCodingKeys: String, CodingKey {
//    case coverAssetURL = "url"
//}
//
//// MARK: - IconAsset CodingKeys
//enum IconAssetCodingKeys: String, CodingKey {
//    case thumbnailURL = "thumbnailUrl"
//    case iconAssetURL = "url"
//}
//
//// MARK: - LatestMedia
//@objc(LatestMedia)
//class LatestMedia:NSManagedObject ,Codable {
//    var type: String?
//    var title: String?
//    var coverAssetURL: String?
//
//    enum CodingKeys: String, CodingKey {
//        case type
//        case title
//        case coverAsset
//    }
//    required convenience init(from decoder: Decoder) throws {
//        guard let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext,
//              let managedObjectContext = decoder.userInfo[codingUserInfoKeyManagedObjectContext] as? NSManagedObjectContext,let entity = NSEntityDescription.entity(forEntityName: DatabaseConstants.latestMediaEntityName, in: managedObjectContext) else {
//            print("errorrrroo")
//            // return
//            fatalError("Failed to decode Account")
//        }
//        self.init(entity: entity, insertInto: managedObjectContext)
//
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.type = try container.decodeIfPresent(String.self, forKey: .type)
//        self.title = try container.decodeIfPresent(String.self, forKey: .title)
//
//        let coverAssetContainer = try container.nestedContainer(keyedBy: CoverAssetCodingKeys.self, forKey: .coverAsset)
//        self.coverAssetURL = try coverAssetContainer.decodeIfPresent(String.self, forKey: .coverAssetURL)
//
//
//    }
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encodeIfPresent(type, forKey: .type)
//        try container.encodeIfPresent(title, forKey: .title)
//
//        var coverAssetContainer = container.nestedContainer(keyedBy: CoverAssetCodingKeys.self, forKey: .coverAsset)
//        try coverAssetContainer.encodeIfPresent(coverAssetURL, forKey: .coverAssetURL)
//    }
//}
//
////enum TypeEnum: String, Codable {
////    case course = "course"
////    case video = "video"
////}
//
//// MARK: - Series
//@objc(Series)
//class Series: NSManagedObject, Codable {
//    var title: String?
//    var coverAssetURL: String?
//
//    enum CodingKeys: String, CodingKey {
//        case title
//        case coverAsset
//    }
//
//    required convenience init(from decoder: Decoder) throws {
//        guard let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext,
//              let managedObjectContext = decoder.userInfo[codingUserInfoKeyManagedObjectContext] as? NSManagedObjectContext,let entity = NSEntityDescription.entity(forEntityName: DatabaseConstants.seriesEntityName, in: managedObjectContext) else {
//            print("errorrrroo")
//            // return
//            fatalError("Failed to decode Account")
//        }
//        self.init(entity: entity, insertInto: managedObjectContext)
//
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.title = try container.decodeIfPresent(String.self, forKey: .title)
//
//        let coverAssetContainer = try container.nestedContainer(keyedBy: CoverAssetCodingKeys.self, forKey: .coverAsset)
//        self.coverAssetURL = try coverAssetContainer.decodeIfPresent(String.self, forKey: .coverAssetURL)
//    }
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encodeIfPresent(title, forKey: .title)
//
//        var coverAssetContainer = container.nestedContainer(keyedBy: CoverAssetCodingKeys.self, forKey: .coverAsset)
//        try coverAssetContainer.encodeIfPresent(coverAssetURL, forKey: .coverAssetURL)
//    }
//}


import Foundation


// MARK: - Welcome
struct ChannelContainer: Codable {
    var data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    var channels: [Channel]?
}

// MARK: - Channel
struct Channel: Codable {
    var title: String?
    var series: [Series]?
    var mediaCount: Int?
    var latestMedia: [LatestMedia]?
    var id: String?
    var iconAsset: IconAsset?
    var coverAsset: CoverAsset?
    var slug: String?
}

// MARK: - CoverAsset
struct CoverAsset: Codable {
    var url: String?
}

// MARK: - IconAsset
struct IconAsset: Codable {
    var thumbnailURL: String?
    var url: String?

    enum CodingKeys: String, CodingKey {
        case thumbnailURL = "thumbnailUrl"
        case url
    }
}

// MARK: - LatestMedia
struct LatestMedia: Codable {
    var type: TypeEnum?
    var title: String?
    var coverAsset: CoverAsset?
}

enum TypeEnum: String, Codable {
    case course = "course"
    case video = "video"
}

// MARK: - Series
struct Series: Codable {
    var title: String?
    var coverAsset: CoverAsset?
    var id: String?
}

