//
//  ViewModel.swift
//  apicalls
//
//  Created by user240138 on 4/12/23.
//

import SwiftUI









//class ViewModel: ObservableObject {
//    @Published var courses: [Course] = []
//
//    func fetch() {
//        guard let url = URL(string:"https://iosacademy.io/api/v1/courses/index.php") else {
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) {[weak self] data,
//            _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//
//            do {
//                let courses = try JSONDecoder().decode([Course].self, from: data)
//                DispatchQueue.main.async {
//                    self?.courses = courses
//                }
//            }
//            catch {
//                print(error)
//            }
//
//        }
//        task.resume()
//    }
//
//}


struct URLImage: View {
    let urlString: String
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiiamge = UIImage(data: data){
            Image(uiImage: uiiamge)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130,height: 70)
                .background(Color.gray)
        }
        else {
            Image(systemName: "video")
                .frame(width: 130,height: 70)
                .aspectRatio(contentMode: .fit)
                .background(Color.gray)
                .onAppear {
                    fetchData()
                }
        
        }
    }
    
    private func fetchData() {
        guard let url = URL(string:urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {
            data,_,_ in
            self.data = data
        }
        task.resume()
    }
}
