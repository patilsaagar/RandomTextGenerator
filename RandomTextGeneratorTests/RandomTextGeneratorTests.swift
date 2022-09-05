import XCTest
@testable import RandomTextGenerator

class RandomTextGeneratorTests: XCTestCase {
    
    func test_generateRandomText_WithAlphabeticStringRange_ReturnsAlphabeticRandomText() {
        
        // ARRANGE
        let randomTextGeneratorStub = createRandomTextGenerator()
        
        // ACT
        let randomText = randomTextGeneratorStub.generateRandomText(stringRange: StringRange.alphabets.rawValue)
        
        // ASSERT
        XCTAssertFalse(randomText.isEmpty)
        XCTAssertTrue(isAlphabeticText(text: randomText))
    }
    
    func test_generateRandomText_WithEmptyStringRange_ReturnsEmptyString() {
        
        // ARRANGE
        let randomTextGeneratorStub = createRandomTextGenerator()
        
        // ACT
        let randomText = randomTextGeneratorStub.generateRandomText(stringRange: Constants.emptyString)
        
        // ASSERT
        XCTAssertTrue(randomText.isEmpty)
    }
    
    func test_generateRandomText_WithAlphabeticStringRange_ReturnsRandomTextGreaterThanLowerBound() {
        
        // ARRANGE
        let randomTextGeneratorStub = createRandomTextGenerator()
        
        // ACT
        let randomText = randomTextGeneratorStub.generateRandomText(stringRange: StringRange.alphabets.rawValue)
        let randomTextCount = randomText.replacingOccurrences(of: Constants.newLine, with: Constants.emptyString)

        // ASSERT
        XCTAssertFalse(randomText.isEmpty)
        XCTAssertTrue(randomTextCount.count >= Constants.randomWordLowerBound)
    }
    
    func test_generateRandomText_WithAlphabeticStringRange_ReturnsRandomTextLowerThanUpperBound() {
        
        // ARRANGE
        let randomTextGeneratorStub = createRandomTextGenerator()
        
        // ACT
        let randomText = randomTextGeneratorStub.generateRandomText(stringRange: StringRange.alphabets.rawValue)
        let randomTextCount = randomText.replacingOccurrences(of: Constants.newLine, with: Constants.emptyString)
        
        // ASSERT
        XCTAssertFalse(randomText.isEmpty)
        XCTAssertTrue(randomTextCount.count <= Constants.randomWordUpperBound)
    }
    
    // MARK: Private Function
    private func createRandomTextGenerator() -> RandomTextGenerator {
        return RandomTextGenerator()
    }
    
    private func isAlphabeticText(text: String) -> Bool {
        let resultText = text.replacingOccurrences(of: Constants.newLine, with: Constants.emptyString)
        return CharacterSet.letters.isSuperset(of: CharacterSet(charactersIn: resultText))
    }
}
