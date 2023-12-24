import XCTest
@testable import TestMin

final class TestMinTests: XCTestCase {
    
    func test_shortfall() {
        // When
        let sut = Province(producers: [])
        let producers = [Producer(province: sut, cost: 10, name: "Byzantium", production: 9),
                         Producer(province: sut, cost: 12, name: "Attaliz", production: 10),
                         Producer(province: sut, cost: 10, name: "Sinope", production: 6)]
        
        sut.setProducers(arr: producers)
        
        // Act
        
        // Then
        XCTAssertEqual(sut.shortfall(), 5)
    }
    
    func test_profit() {
        // When
        let sut = Province(producers: [])
        let producers = [Producer(province: sut, cost: 10, name: "Byzantium", production: 9),
                         Producer(province: sut, cost: 12, name: "Attaliz", production: 10),
                         Producer(province: sut, cost: 10, name: "Sinope", production: 6)]
        
        sut.setProducers(arr: producers)
        // Act
        
        // Then
        XCTAssertEqual(sut.profit(), 230)
    }
    
    func test_profit_noProducers() {
        // Given
        
        // When
        let sut = Province(producers: [])
        // Then
        XCTAssertEqual(sut.profit(), 0)
    
    }    
    func test_shortfall_noProducers() {
        // Given
        
        // When
        let sut = Province(producers: [])
        // Then
        XCTAssertEqual(sut.shortfall(), 30)
    
    }
    
}
