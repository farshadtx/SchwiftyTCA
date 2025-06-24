import SwiftUI
import Dependencies

struct CachedImageView<Placeholder: View, ImageContent: View>: View {
    @Dependency(\.cacheService) var cacheService
    @Dependency(\.urlSession) var urlSession

    let url: URL?
    let placeholder: () -> Placeholder
    let imageContent: (Image) -> ImageContent

    @State private var loadedImage: Image?

    var body: some View {
        Group {
            if let loadedImage {
                imageContent(loadedImage)
            } else {
                placeholder()
                    .task {
                        await loadImage()
                    }
            }
        }
    }

    private func loadImage() async {
        guard let url else { return }

        if let cached = cacheService.image(for: url) {
            loadedImage = cached
            return
        }

        do {
            let (data, _) = try await urlSession.data(from: url)
            cacheService.insertImage(data: data, for: url)
            if let newImage = cacheService.image(for: url) {
                loadedImage = newImage
            }
        } catch URLError.cancelled {

        } catch {
            print("❌ Failed to load image from \(url):", error)
        }
    }
}
