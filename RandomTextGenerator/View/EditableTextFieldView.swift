import SwiftUI

struct EditableTextFieldView: View {
    @ObservedObject var viewModel: HomeViewViewModel

    var body: some View {
        TextEditor(text: $viewModel.randomText)
            .frame(maxHeight: .infinity, alignment: .topLeading)
            .border(.gray, width: 2)
            .accessibilityIdentifier(HomeViewControlIdentifier.editableTextEditor)
        
        HStack {
            Text(Constants.wordCountLabelText)
                .frame(alignment: .leading)
                .accessibilityIdentifier(HomeViewControlIdentifier.wordCountLabel)
            
            Text("\(viewModel.getWordCount(sourceString: viewModel.randomText))")
                .frame(maxWidth:.infinity, alignment: .leading)
                .accessibilityIdentifier(HomeViewControlIdentifier.wordCount)
        }
    }
}
