import Foundation

protocol RandomTextCreator: AnyObject {
    func generateRandomText(stringRange: String) -> String
}

class RandomTextGenerator: RandomTextCreator {
    
    func generateRandomText(stringRange: String) -> String {
        
        if stringRange.isEmpty { return Constants.emptyString }
        let randomNumber = arc4random_uniform(Constants.randomWordUpperBound - Constants.randomWordLowerBound) + Constants.randomWordLowerBound
        
        // Get characters array
        let randomCharacters = (0..<randomNumber).map{ _ in stringRange.randomElement() ?? Character.init(Constants.defaultText) }
        
        // Create String from generated array
        var randomText = String(randomCharacters)
        
        for _ in 0...Int.random(in: 0..<5) {
            let index = randomText.index(randomText.startIndex, offsetBy: Int.random(in: 1..<randomText.count))
            randomText.insert(contentsOf: Constants.newLine, at: index)
        }
        
        return randomText
    }
}
