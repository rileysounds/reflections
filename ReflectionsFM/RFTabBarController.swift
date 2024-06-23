import UIKit.UITabBarController

class RFTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeViewController = HomeViewController(rootView: HomeView())
        let submissionViewController = SubmissionViewController(rootView: SubmissionView(onSubmit: {}))
        let shopViewController = ShopViewController(rootView: ShopView())
        
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "1.circle"), tag: 0)
        submissionViewController.tabBarItem = UITabBarItem(title: "Submit Music", image: UIImage(systemName: "2.circle"), tag: 1)
        shopViewController.tabBarItem = UITabBarItem(title: "Shop", image: UIImage(systemName: "3.circle"), tag: 2)
        
        self.viewControllers = [homeViewController,
                                submissionViewController,
                                shopViewController]
    }
}
