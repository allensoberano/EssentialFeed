//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Allen Soberano on 10/26/21.
//

import XCTest

class RemoteFeedLoader {

}

class HTTPClient{
	var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {

	func test_init_doesNotRequestDataFromURL(){
		let client = HTTPClient()
		let _ = RemoteFeedLoader()

		XCTAssertNil(client.requestedURL)
	}

}
