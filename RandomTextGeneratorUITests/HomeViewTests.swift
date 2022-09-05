import XCTest

class HomeViewTests: XCTestCase {
    let app = XCUIApplication()
    
    // MARK: Setup
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
        
    func test_HomeView_OnAppear_ShouldLoadUIElements() {
        
        // ACT
        let textEditor = app.textViews[HomeViewControlIdentifier.editableTextEditor]
        let wordCountLabel = app.staticTexts[HomeViewControlIdentifier.wordCountLabel]
        let wordCount = app.staticTexts[HomeViewControlIdentifier.wordCount]
        let randomTextButton = app.buttons[HomeViewControlIdentifier.randomTextButton]
        
        // ASSERT
        XCTAssertTrue(textEditor.exists)
        XCTAssertTrue(wordCountLabel.exists)
        XCTAssertTrue(wordCount.exists)
        XCTAssertTrue(randomTextButton.exists)
        
        XCTAssertFalse(wordCount.label.isEmpty)
        XCTAssertEqual(Constants.wordCountLabelText, wordCountLabel.label)
        XCTAssertEqual(HomeViewControlIdentifier.randomTextButton, randomTextButton.label)
    }
    
    func test_HomeView_OnAppear_ShouldDisplayTotalWordCount() {
        
        // ARRANGE
        let editableTextEditor = app.textViews[HomeViewControlIdentifier.editableTextEditor]
        let wordCountLabel = app.staticTexts[HomeViewControlIdentifier.wordCountLabel]
        let newRandomText = String(describing: editableTextEditor.value)
        let newRandomTextWordCount = newRandomText.components(separatedBy: Constants.newLine).count
        
        // ACT
        let expectedWordCount = getTextsCount(sourceText: newRandomText).components(separatedBy: Constants.whiteSpace).count
        
        // ASSERT
        XCTAssertTrue(editableTextEditor.exists)
        XCTAssertTrue(wordCountLabel.exists)
        
        XCTAssertNotNil(newRandomText)
        XCTAssertNotNil(newRandomTextWordCount)
        XCTAssertTrue(newRandomTextWordCount > 0)
        XCTAssertEqual(expectedWordCount, newRandomTextWordCount)
    }
    
    func test_HomeView_OnTapOfRandomTextButton_ShouldGenerateRandomTextAndUpdateWordCount() {
        
        // ARRANGE
        let randomTextButton = app.buttons[HomeViewControlIdentifier.randomTextButton]
        let wordCountLabel = app.staticTexts[HomeViewControlIdentifier.wordCountLabel]
        let wordCount = app.staticTexts[HomeViewControlIdentifier.wordCount]
        let editableTextEditor = app.textViews[HomeViewControlIdentifier.editableTextEditor]
        
        let oldRandomText = String(describing: editableTextEditor.value)

        // ACT
        randomTextButton.tap()
        let newRandomText = String(describing: editableTextEditor.value)
        let textWordCount = newRandomText.components(separatedBy: Constants.newLine).count

        // ASSERT
        XCTAssertTrue(randomTextButton.exists)
        XCTAssertTrue(wordCountLabel.exists)
        XCTAssertTrue(wordCount.exists)
        XCTAssertTrue(editableTextEditor.exists)
        
        XCTAssertNotNil(newRandomText)
        XCTAssertNotNil(textWordCount)
        XCTAssertTrue(textWordCount > 0)
        XCTAssertNotEqual(newRandomText, oldRandomText)
    }
    
    func test_HomeView_OnNewTextEntryInTextEditor_ShouldUpdateWordCount() {
        
        // ARRANGE
        let editableTextEditor = app.textViews[HomeViewControlIdentifier.editableTextEditor]
        let cursorPoint = editableTextEditor.coordinate(withNormalizedOffset: CGVector(dx: 0.9, dy: 0.9))
        let wordCount = app.staticTexts[HomeViewControlIdentifier.wordCount]
        
        let oldRandomText = String(describing: editableTextEditor.value)
        let oldRandomWordCount = oldRandomText.components(separatedBy: Constants.whiteSpace).count
        let textEditorInputString = "This is dummy text"
        
        // ACT
        cursorPoint.tap()
        editableTextEditor.typeText(Constants.whiteSpace)
        editableTextEditor.typeText(textEditorInputString)
        
        let newRandomText = String(describing: editableTextEditor.value)
        let expectedWordCount = getTextsCount(sourceText: newRandomText)
        let newTextWordCount = expectedWordCount.components(separatedBy: Constants.whiteSpace).count
        
        // ASSERT
        XCTAssertTrue(editableTextEditor.exists)
        XCTAssertTrue(wordCount.exists)
        
        XCTAssertNotNil(newRandomText)
        XCTAssertNotNil(expectedWordCount)
        XCTAssertNotNil(newTextWordCount)
        XCTAssertNotEqual(newRandomText, oldRandomText)
        XCTAssertNotEqual(newTextWordCount, oldRandomWordCount)
    }
    
    // MARK: Tear Down
    override func tearDown() {
        app.terminate()
        super.tearDown()
    }
    
    // MARK: Private function
    private func getTextsCount(sourceText: String) -> String {
        sourceText.replacingOccurrences(of: Constants.newLine, with: Constants.whiteSpace)
    }
}
