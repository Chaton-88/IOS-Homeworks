
import UIKit

protocol UserService {
    func verification(fullname: String) -> User?
}

final class CurrentUserService: UserService {
    
    var nameUser: User?
    
    func verification(fullname: String) -> User? {
        let newUser = nameUser
        if fullname == nameUser?.fullName {
            return newUser
        } else {
            return nil
        }
    }
}


