@testable import RandomTextGenerator

class RandomTextGeneratorStub: RandomTextCreator {
    static let randomText = "fgYUsDtsqtrHdakjYesoYrhdnfgsYUsDtsqtrHdakjYesoYrhdnfgs YUsDtsqtrHdakjYesoYrhdnfgsYUs DtsqtrHdakjYesoYrhdnfgsYUsDtsqtrHdak"
    
    static let randomTextWordCount = randomText.components(separatedBy: Constants.whiteSpace).count
    
    func generateRandomText(stringRange: String) -> String {
        RandomTextGeneratorStub.randomText
    }
}
