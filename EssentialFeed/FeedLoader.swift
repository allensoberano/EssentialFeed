//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Allen Soberano on 10/26/21.
//

import Foundation

enum LoadFeedResult {
	case success([FeedItem])
	case error(Error)
}
protocol FeedLoader {
	func load(completion: @escaping (LoadFeedResult) -> Void)
}
