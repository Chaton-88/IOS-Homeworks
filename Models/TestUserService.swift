
import UIKit

final class TestUserService: UserService {
    
    var testUser = User(fullName: "Incognito", avatar: #imageLiteral(resourceName: "Incognito"), status: "Don't warry 🧐")
    
    func verification(fullname: String) -> User? {
        let user = testUser
        if fullname == user.fullName {
            return user
        } else {
            return nil
        }
    }
}
