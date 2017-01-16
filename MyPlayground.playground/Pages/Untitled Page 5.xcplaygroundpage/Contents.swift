
class Employee {
    
    let id: Int, firstName: String, lastName: String
    
    init(id: Int, firstName: String, lastName: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
    }
    
}

struct EmployeeSequence: Sequence, IteratorProtocol {
    
    let employeeArray: [Employee]
    private var index = 0
    
    init(employeeArray: [Employee]) {
        self.employeeArray = employeeArray
    }
    
    mutating func next() -> Int? {
        guard index < employeeArray.count else { return nil }
        defer { index += 1 }
        return employeeArray[index].id
    }
    
}

let employeeArray = [
    Employee(id: 1, firstName: "Jon", lastName: "Skeet"),
    Employee(id: 2, firstName: "Darin", lastName: "Dimitrov"),
    Employee(id: 4, firstName: "Hans", lastName: "Passant")
]
let employeeSequence = EmployeeSequence(employeeArray: employeeArray)
let idArray = Array(employeeSequence)
print(idArray) // prints [1, 2, 4]