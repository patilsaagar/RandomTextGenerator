import Foundation
import Combine

class HomeViewViewModel: ObservableObject {
    
    @Published var randomText: String = String()
    private weak var randomTextCreator: RandomTextCreator?
        
    init(randomTextCreator: RandomTextCreator?) {
        self.randomTextCreator = randomTextCreator
        generateRandomText()
    }
    
    func generateRandomText() {
        self.randomText = randomTextCreator?.generateRandomText(stringRange: StringRange.alphabets.rawValue) ?? Constants.emptyString
    }
    
    func getWordCount(sourceString: String) -> Int {
        let characterSet = CharacterSet.whitespaces.union(.newlines)
        let components = sourceString.components(separatedBy: characterSet)
        let words = components.filter { !$0.isEmpty }
        
        return words.count
    }
}
