import Foundation

enum TypeOfWorker: Int {
    case manager
    case senior
    case middle
    case junior
    
    var job: Int {
        switch self {
        case .manager:
            return 4
        case .senior:
            return 3
        case .middle:
            return 2
        case .junior:
            return 1
        }
    }
    
}

enum CivilStatus{
    case single
    case married
    case widowed
    case divorced
}

enum Department {
    case iosDeveloper
    case androidDeveloper
    case webFrontendDeveloper
    case webBackendDeveloper
    case fullStack
    case other
}

typealias salaryClosure = (_ amount: Int) -> Void

protocol CompanyProtocol {
    var companyName: String {get}
    var budget: Int {get set}
    var workers: [WorkerProtocol] {get set}
    var foundationYear: Int { get }
}

protocol WorkerProtocol {
    var name: String {get}
    var age: Int {get set}
    var position: TypeOfWorker {get set}
    var department: Department {get}
    var maritalStatus: CivilStatus {get set}
}

extension WorkerProtocol {
    
    func salary() -> Int{
        switch position {
        case .manager:
            return self.age * 1000 * 4
        case .senior:
            return self.age * 1000 * 3
        case .middle:
            return self.age * 1000 * 2
        case .junior:
            return self.age * 1000 * 1
            
        }
    }
}

struct Company: CompanyProtocol {
    
    var companyName: String
    var budget: Int
    var workers: [WorkerProtocol]
    var foundationYear: Int
    
    init(companyName: String, budget: Int, workers: [WorkerProtocol], foundationYear: Int) {
        self.companyName = companyName
        self.budget = budget
        self.workers = workers
        self.foundationYear = foundationYear
    }
}

struct Worker: WorkerProtocol {
    
    var name: String
    var age: Int
    var position: TypeOfWorker
    var department: Department
    var maritalStatus: CivilStatus
    init(name: String, age: Int, position: TypeOfWorker, department: Department,maritalStatus: CivilStatus) {
        self.name = name
        self.age = age
        self.position = position
        self.department = department
        self.maritalStatus = maritalStatus
    }
}

var workers: [Worker] = [
    Worker(name: "Tim Cook", age: 62, position: .manager, department: .other, maritalStatus: .married),
    Worker(name: "Steve Jobs", age: 55, position: .senior, department: .iosDeveloper, maritalStatus: .single),
    Worker(name: "Alex Gorsky", age: 35, position: .junior, department: .androidDeveloper, maritalStatus: .divorced)
]

var apple = Company(companyName: "Apple", budget: 100, workers: workers, foundationYear: 1976)
