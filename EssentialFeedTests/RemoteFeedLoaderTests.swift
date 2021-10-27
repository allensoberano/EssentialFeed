//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Allen Soberano on 10/26/21.
//

import XCTest

class RemoteFeedLoader {
	let client: HTTPClient
	let url: URL

	init(url: URL, client: HTTPClient){
		self.client = client
		self.url = url
	}

	func load(){
		client.get(from: url)
	}
}

protocol HTTPClient{
	func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {

	func get(from url: URL){
		requestedURL = url
	}

	var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {

	func test_init_doesNotRequestDataFromURL(){
		let url = URL(string: "https://a-url.com")!
		let client = HTTPClientSpy()
		let _ = RemoteFeedLoader(url: url, client: client)

		XCTAssertNil(client.requestedURL)
	}

	func test_load_requestDataFromURL() {
		let url = URL(string: "https://a-givin-url.com")!
		let client = HTTPClientSpy()
		let sut = RemoteFeedLoader(url: url, client: client)

		sut.load()

		XCTAssertEqual(client.requestedURL, url)
	}

}
