import SwiftUI

@main
struct RandomTextGeneratorApp: App {
        
    var body: some Scene {
        WindowGroup {
            HomeView(randomTextCreator: RandomTextGenerator())
        }
    }
}
