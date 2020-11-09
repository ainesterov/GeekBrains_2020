enum BookStoreError: Error {
    case invalidSelection
    case outOfStore
    case insufficientAmountOfMoney(moneyRequired: Int)
}

enum LibraryError: Error {
    case invalidSelection
    case outOfLibrary
}


struct Item {
    let title: String
    let numberOfPages: Int
}

struct Book {
    let book: Item
    var price: Int
    var count: Int //Количество книг
}

struct LibraryBook {
    let book: Item
    var count: Int //Количество книг
}


class BookStore {
    private var books = ["Л.Толстой Война и Мир": Book(book: Item(title: "Л.Толстой Война и Мир", numberOfPages: 1002), price: 100, count: 5), "М.Булгаков Мастер и Маргарита": Book(book: Item(title: "М.Булгаков Мастер и Маргарита", numberOfPages: 400), price: 150, count: 3), "А.Чехов Вишневый сад": Book(book: Item(title: "А.Чехов Вишневый сад", numberOfPages: 210), price: 120, count: 4)]
    
    var moneyPaid: Int = 90
    func sellBook(bookName: String) -> (Item?, BookStoreError?) {
        guard let item = books[bookName] else {
            return (nil, BookStoreError.invalidSelection)
        }
        guard item.count > 0 else {
            return (nil, BookStoreError.outOfStore)
        }
        guard item.price <= moneyPaid else {
            return (nil, BookStoreError.insufficientAmountOfMoney(moneyRequired: item.price - moneyPaid))
        }
        
        moneyPaid -= item.price
        var newItem = item
        newItem.count -= 1
        books[bookName] = newItem
        return (newItem.book,nil)
    }
}

class Library {
    private var books = ["Л.Толстой Анна Каренина": LibraryBook(book: Item(title: "Л.Толстой Анна Каренина", numberOfPages: 402), count: 5), "М.Булгаков Собачье сердце": LibraryBook(book: Item(title: "М.Булгаков Собачье сердце", numberOfPages: 350), count: 2), "А.Грибоедов Горе от ума": LibraryBook(book: Item(title: "А.Грибоедов Горе от ума", numberOfPages: 210), count: 1)]
    
    func getBook(bookName: String) throws -> Item {
        guard let item = books[bookName] else {
            throw LibraryError.invalidSelection
        }
        guard item.count > 0 else {
            throw LibraryError.outOfLibrary
        }
        var newItem = item
        newItem.count -= 1
        books[bookName] = newItem
        return newItem.book
    }
}

let bookStore = BookStore()
let book1 = bookStore.sellBook(bookName: "Л.Толстой Война и Мир")
if let book_1 = book1.0 {
    print(book_1)
} else if let error = book1.1 {
    print(error)
}

let library = Library()
do {
    let book2 = try library.getBook(bookName: "А.Грибоедов Горе от ума")
    print(book2)
} catch let error {
    print(error)
}

do {
    let book3 = try library.getBook(bookName: "Ф.Достоевский Бесы")
    print(book3)
} catch LibraryError.invalidSelection {
    print("Нет такой книги в библиотеке!!")
}
