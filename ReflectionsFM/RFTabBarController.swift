import UIKit.UITabBarController

class RFTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeViewController = HomeViewController(rootView: HomeView())
        let musicViewController = MusicViewController(rootView: MusicView())
        let radioViewController = RadioViewController(rootView: RadioView())
        let submissionViewController = SubmissionViewController(rootView: SubmissionView(onSubmit: {}))
        
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "1.circle"), tag: 0)
        musicViewController.tabBarItem = UITabBarItem(title: "Music", image: UIImage(systemName: "2.circle"), tag: 1)
        radioViewController.tabBarItem = UITabBarItem(title: "Radio", image: UIImage(systemName: "3.circle"), tag: 2)
        submissionViewController.tabBarItem = UITabBarItem(title: "Submit Music", image: UIImage(systemName: "4.circle"), tag: 3)
        
        self.viewControllers = [homeViewController,
                                musicViewController,
                                radioViewController,
                                submissionViewController]
        
    }
    
}
