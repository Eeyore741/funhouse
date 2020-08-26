import Foundation

var str = "Hello, playground"

final class MyApp {
    
    let m = MyFramework.MyFactory()
}

final class MyFramework {
    
    enum Events {
        
        case doEvent(withDate: Date)
        
        func publish() {
            
        }
    }
    
    class MyFactory {
        
        func doEvent() -> Void {
            print(#function)
        }
    }
}
