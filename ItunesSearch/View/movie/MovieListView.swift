import SwiftUI


struct MovieListView:View {
    
    @ObservedObject var viewModel = MovieListViewModel()
    
    var body: some View {
        List{
            ForEach(viewModel.movies){ movie in
                NavigationLink {
                    MovieDetailView(movie: movie)
                } label: {
                    MovieRowView(movie: movie)
                }
                .buttonStyle(PlainButtonStyle())
            }
            switch viewModel.state {
            case .good:
                Color.clear.onAppear {
                    viewModel.loadMore()
                }
            case .isLoading:
                ProgressView()
                    .progressViewStyle(.circular)
                    .frame(maxWidth: .infinity)
            case .loadedAll:
                Color.clear
            case .error(let string):
                Text(string).foregroundColor(.pink)
            }
        }
        .listStyle(.plain)
    
    }
}

#Preview {
    NavigationView {
        MovieListView(viewModel: MovieListViewModel())
    }
}
