
class Employee {
    
    let id: Int
    let firstName: String
    let lastName: String
    
    init(id: Int, firstName: String, lastName: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
    }
    
}

struct EmployeeIterator: IteratorProtocol {
    
    let employeeArray: [Employee]
    var i = 0
    
    init(_ employeeArray: [Employee]) {
        self.employeeArray = employeeArray
    }
    
    mutating func next() -> Int? {
        guard i < employeeArray.count else { return nil }
        defer { i += 1 }
        return employeeArray[i].id
    }
    
}

struct EmployeeSequence: Sequence {
    
    let employeeArray: [Employee]
    
    func makeIterator() -> EmployeeIterator {
        return EmployeeIterator(employeeArray)
    }
    
}

let employeeArray = [
    Employee(id: 1, firstName: "Jon", lastName: "Skeet"),
    Employee(id: 2, firstName: "Darin", lastName: "Dimitrov"),
    Employee(id: 4, firstName: "Hans", lastName: "Passant")
]

let employeeSequence = EmployeeSequence(employeeArray: employeeArray)
let array = Array(employeeSequence)
print(array) // prints [1, 2, 4]