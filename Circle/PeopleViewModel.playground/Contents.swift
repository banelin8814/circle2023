
import Foundation

protocol PeopleViewModelDelegate: AnyObject {
    
    func didFinish()
    func didFail(error: Error)
    
}

class PeopleViewModel {
    
    private(set) var people = [PersonResponse]()//() 表示 people 屬性是可變的
    
    weak var delegate:PeopleViewModelDelegate?
    
    @MainActor //get placed onto the main thread(更新數據到主線）但是抓取數據還是在後台
    func gerUsers(){
        
        //這邊有asynchronous context的概念
        Task {[weak self] in
            do {
                
                let url = URL(string: "https://reqres.in/api/users?page=2")!
                let (data,_) = try await  URLSession.shared.data(from: url) //(data,_) 這編是一個tuple   //await 就是swfit concurrency //使用 URLSession 下載數據
                
                let jsonDecoder = JSONDecoder()// 解碼數據
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase //因為資料是SnakeCase的形式
                
                self?.people = try jsonDecoder.decode(UserReponse.self, from: data).data  //.data後面這段不是很懂
                self?.delegate?.didFinish()
            }catch{
                self?.delegate?.didFail(error: error)
            }
        }
    }
}
