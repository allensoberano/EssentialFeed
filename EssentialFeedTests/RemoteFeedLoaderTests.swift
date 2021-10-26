//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Allen Soberano on 10/26/21.
//

import XCTest

class RemoteFeedLoader {
	func load(){
		HTTPClient.shared.requestedURL = URL(string: "https://a-url.com")
	}
}

class HTTPClient{
	static let shared = HTTPClient()

	private init() {}

	var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {

	func test_init_doesNotRequestDataFromURL(){
		let client = HTTPClient.shared
		let _ = RemoteFeedLoader()

		XCTAssertNil(client.requestedURL)
	}

	func test_load_requestDataFromURL() {
		let client = HTTPClient.shared
		let sut = RemoteFeedLoader()

		sut.load()

		XCTAssertNotNil(client.requestedURL)
	}

}
