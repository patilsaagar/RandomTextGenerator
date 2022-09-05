enum Constants {
    
    static let randomWordLowerBound: UInt32         = 120
    static let randomWordUpperBound: UInt32         = 180
    static let wordCountLabelText                   = "Word Count:"
    static let buttonTitleText                      = "Random Text"
    static let newLine                              = "\n\n"
    static let defaultText                          = "Default"
    static let whiteSpace                           = " "
    static let emptyString                          = ""
}

enum StringRange: String {
    case alphabets = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
}

enum HomeViewControlIdentifier {
    static let editableTextEditor  = "EditableTextEditor"
    static let wordCountLabel      = "WordCountLabel"
    static let wordCount           = "wordCount"
    static let randomTextButton    = "Random Text"
}
