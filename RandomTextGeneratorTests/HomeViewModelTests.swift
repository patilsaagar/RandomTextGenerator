import XCTest
@testable import RandomTextGenerator

class HomeViewModelTests: XCTestCase {
    
    private var randomTextGeneratorStub: RandomTextCreator?
    
    // MARK: Setup
    override func setUp() {
        super.setUp()
        randomTextGeneratorStub = RandomTextGeneratorStub()
    }
        
    func test_generateRandomText_WithValidDependency_ReturnsRandomText() {
        
        // ARRANGE
        let homeViewModel = createHomeViewModel(randomTextGeneratorStub: self.randomTextGeneratorStub)
        
        // ACT
        homeViewModel.generateRandomText()
        
        // ASSERT
        XCTAssertNotNil(homeViewModel.randomText)
        XCTAssertFalse(homeViewModel.randomText.isEmpty)
        XCTAssertEqual(RandomTextGeneratorStub.randomText, homeViewModel.randomText)
    }
    
    func test_generateRandomText_WithNilDependency_ReturnsEmptyRandomText() {
        
        // ARRANGE
        let homeViewModel = createHomeViewModel(randomTextGeneratorStub: nil)
        
        // ACT
        homeViewModel.generateRandomText()
        
        // ASSERT
        XCTAssertTrue(homeViewModel.randomText.isEmpty)
    }
    
    func test_generateRandomText_WithNilDependency_ReturnsDefaultText() {
        
        // ARRANGE
        let homeViewModel = createHomeViewModel(randomTextGeneratorStub: nil)
        
        // ACT
        homeViewModel.generateRandomText()
        
        // ASSERT
        XCTAssertTrue(homeViewModel.randomText.isEmpty)
    }
    
    func test_generateRandomText_verifyWordCount_ReturnsExpectedWordCount() {
        
        // ARRANGE
        let homeViewModel = createHomeViewModel(randomTextGeneratorStub: randomTextGeneratorStub)
        let randomText = RandomTextGeneratorStub.randomText
        let expectedWordCount = RandomTextGeneratorStub.randomTextWordCount
        
        // ACT
        let wordCount = homeViewModel.getWordCount(sourceString: randomText)
        
        // ASSERT
        XCTAssertTrue(wordCount > 0)
        XCTAssertEqual(expectedWordCount, wordCount)
    }
    
    // MARK: Tear Down
    override func tearDown() {
        randomTextGeneratorStub = nil
        super.tearDown()
    }

    // MARK: Private function
    private func createHomeViewModel(randomTextGeneratorStub: RandomTextCreator?) -> HomeViewViewModel {
        return HomeViewViewModel(randomTextCreator: randomTextGeneratorStub)
    }
}
