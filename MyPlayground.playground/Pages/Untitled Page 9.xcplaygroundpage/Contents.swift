
import Foundation

class Employee: NSObject {
    
    let id: Int, firstName: String, lastName: String
    
    init(id: Int, firstName: String, lastName: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
    }
    
}

let employeeArray = [
    Employee(id: 1, firstName: "Jon", lastName: "Skeet"),
    Employee(id: 2, firstName: "Darin", lastName: "Dimitrov"),
    Employee(id: 4, firstName: "Hans", lastName: "Passant")
]

let employeeNSArray = employeeArray as NSArray
if let idArray = employeeNSArray.value(forKeyPath: #keyPath(Employee.id)) as? [Int] {
    print(idArray) // prints [1, 2, 4]
}
