
class Employee {
    
    let id: Int, firstName: String, lastName: String
    
    init(id: Int, firstName: String, lastName: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
    }
    
}

extension Collection where Iterator.Element: Employee {
    
    func getIDs() -> Array<Int> {
        var index = startIndex
        let iterator: AnyIterator<Int> = AnyIterator {
            defer { index = self.index(index, offsetBy: 1) }
            return index != self.endIndex ? self[index].id : nil
        }
        return Array(iterator)
    }
    
}

let employeeArray = [
    Employee(id: 1, firstName: "Jon", lastName: "Skeet"),
    Employee(id: 2, firstName: "Darin", lastName: "Dimitrov"),
    Employee(id: 4, firstName: "Hans", lastName: "Passant")
]

let idArray = employeeArray.getIDs()
print(idArray) // prints [1, 2, 4]