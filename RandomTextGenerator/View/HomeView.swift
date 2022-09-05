import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel: HomeViewViewModel
    
    init(randomTextCreator: RandomTextGenerator) {
        _viewModel = StateObject(wrappedValue: HomeViewViewModel(randomTextCreator: randomTextCreator))
    }
    
    var body: some View {
        VStack {
            EditableTextFieldView(viewModel: viewModel)
            
            Button(Constants.buttonTitleText) {
                viewModel.generateRandomText()
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .tint(.purple)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static let randomTextCreator = RandomTextGenerator()
    static var previews: some View {
        HomeView(randomTextCreator: randomTextCreator)
    }
}
