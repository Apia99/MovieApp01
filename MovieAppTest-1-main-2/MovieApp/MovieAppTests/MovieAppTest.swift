//
//  MovieAppTeest.swift
//  MovieAppTests
//
//  Created by Admin on 24/03/2022.
//

import XCTest
import Combine
@testable import MovieApp

class MovieAppTest: XCTestCase {
    private var subscribers = Set<AnyCancellable>()

    var viewModel: SearchViewModel!

    let fakeNetworkManager = MockNetworkManager()
    
    override func setUpWithError() throws {
       
        
        fakeNetworkManager.baseUrl = "Movie_response"

        viewModel = SearchViewModel(networkManager: fakeNetworkManager)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMoviesCount_success() {
        
        let expectation = expectation(description: "waiting for call")
        
        viewModel
            .$movies
            .dropFirst()
            .sink { movies in
                XCTAssertEqual(movies.count, 20)
                expectation.fulfill()
            }
            .store(in: &subscribers)
        
        viewModel.searchMovies(searchedText: "Movie_response")
        
        waitForExpectations(timeout: 1.0)
    }
    
    func testMoviesCount_failure() {
        
        let expectation = expectation(description: "waiting for call")
        fakeNetworkManager.baseUrl = "failure_responce"
        
        viewModel
            .$movies
            .dropFirst()
            .sink { movies in
                XCTAssertEqual(movies.count, 0)
                expectation.fulfill()
            }
            .store(in: &subscribers)
        
        viewModel.searchMovies(searchedText: "failure_responce")
        
        waitForExpectations(timeout: 1.0)
    }
    
    func testMovieName_success() {
        
        let expectation = expectation(description: "waiting for call")
        
        viewModel
            .$movies
            .dropFirst()
            .sink { movies in
                XCTAssertEqual(movies.first?.originalTitle, "Spider-Man: No Way Home")
                expectation.fulfill()
            }
            .store(in: &subscribers)
        
        viewModel.searchMovies(searchedText: "Movie_response")
        
        waitForExpectations(timeout: 1.0)
    }
    
    func testMovieName_failure() {
        
        let expectation = expectation(description: "waiting for call")
        fakeNetworkManager.baseUrl = "failure_responce"
        
        viewModel
            .$movies
            .dropFirst()
            .sink { movies in
                XCTAssertEqual(movies.first?.originalTitle, "0")
                expectation.fulfill()
            }
            .store(in: &subscribers)
        
        viewModel.searchMovies(searchedText: "failure_responce")
        
        waitForExpectations(timeout: 1.0)
    }
    
    func testMoviePopularity_success() {
        
        let expectation = expectation(description: "waiting for call")
        
        viewModel
            .$movies
            .dropFirst()
            .sink { movies in
                XCTAssertEqual(movies.first?.popularity, 6988.789)
                expectation.fulfill()
            }
            .store(in: &subscribers)
        
        viewModel.searchMovies(searchedText: "Movie_response")
        
        waitForExpectations(timeout: 1.0)
    }
    
    func testMoviePopularity_failure() {
        
        let expectation = expectation(description: "waiting for call")
        fakeNetworkManager.baseUrl = "failure_responce"
        
        viewModel
            .$movies
            .dropFirst()
            .sink { movies in
                XCTAssertEqual(movies.first?.popularity, 23445)
                expectation.fulfill()
            }
            .store(in: &subscribers)
        
        viewModel.searchMovies(searchedText: "failure_responce")
        
        waitForExpectations(timeout: 1.0)
    }
    
    func testposterPath_success() {
        
        let expectation = expectation(description: "waiting for call")
        
        viewModel
            .$movies
            .dropFirst()
            .sink { movies in
                XCTAssertEqual(movies.first?.posterPath, "/rhU1aBcLhbqcesDOn6cjmz6sjos.jpg")
                expectation.fulfill()
            }
            .store(in: &subscribers)
        
        viewModel.searchMovies(searchedText: "Movie_response")
        
        waitForExpectations(timeout: 1.0)
    }
    
    func testposterPath_failure() {
        
        let expectation = expectation(description: "waiting for call")
        fakeNetworkManager.baseUrl = "failure_responce"
        
        viewModel
            .$movies
            .dropFirst()
            .sink { movies in
                XCTAssertEqual(movies.first?.posterPath, "2344dfdgfhhf_vhfg5")
                expectation.fulfill()
            }
            .store(in: &subscribers)
        
        viewModel.searchMovies(searchedText: "failure_responce")
        
        waitForExpectations(timeout: 1.0)
    }
    
}
