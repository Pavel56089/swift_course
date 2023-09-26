struct Student<T> {
    var name: String
    var id: T
    
    init(name: String, id: T) {
        self.name = name
        self.id = id
    }
}

// Использование класса Student с разными типами идентификации (например, Int и String)
let student1 = Student(name: "Alex", id: 123)
let student2 = Student(name: "Pavel", id: "p.baharuev")

print("Student 1: \(student1.name), ID: \(student1.id)")
print("Student 2: \(student2.name), ID: \(student2.id)")


protocol UniversityProtocol {
    associatedtype Element
    
    //function, which enroll some student to the course
    func enroll(element: Element)
}

//by id
struct IdProcessor: UniversityProtocol {
    typealias Element = Int
    
    func enroll(element: Int) {
        print("Processing Int element: \(element)")
    }
}

// by login
struct LoginProcessor: UniversityProtocol {
    typealias Element = String
    
    func enroll(element: String) {
        print("Processing String element: \(element)")
    }
}

// Использование протокола
let idProcessor = IdProcessor()
idProcessor.enroll(element: 42)

let loginProcessor = LoginProcessor()
loginProcessor.enroll(element: "p.baharuev")
