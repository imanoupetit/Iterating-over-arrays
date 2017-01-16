class Employee {
    
    let id: Int, firstName: String, lastName: String
    
    init(id: Int, firstName: String, lastName: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
    }
    
}

extension Sequence where Iterator.Element: Employee {
    
    func getIDs() -> Array<Int> {
        var iterator = self.makeIterator()
        let anyIterator: AnyIterator<Int> = AnyIterator {
            guard let next = iterator.next() else { return nil }
            return next.id
        }
        return Array(anyIterator)
    }
    
}

let employeeArray = [
    Employee(id: 1, firstName: "Jon", lastName: "Skeet"),
    Employee(id: 2, firstName: "Darin", lastName: "Dimitrov"),
    Employee(id: 4, firstName: "Hans", lastName: "Passant")
]

let idArray = employeeArray.getIDs()
print(idArray) // prints [1, 2, 4]