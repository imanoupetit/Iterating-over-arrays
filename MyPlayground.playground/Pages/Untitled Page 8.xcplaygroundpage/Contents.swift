
class Employee {
    
    let id: Int, firstName: String, lastName: String
    
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

extension Array where Element: Employee {
    
    func getIDs() -> Array<Int> {
        let iterator = EmployeeIterator(self)
        let anyIterator = AnyIterator(iterator)
        return Array<Int>(anyIterator)
    }
    
}

let employeeArray = [
    Employee(id: 1, firstName: "Jon", lastName: "Skeet"),
    Employee(id: 2, firstName: "Darin", lastName: "Dimitrov"),
    Employee(id: 4, firstName: "Hans", lastName: "Passant")
]

let idArray = employeeArray.getIDs()
print(idArray) // prints [1, 2, 4]