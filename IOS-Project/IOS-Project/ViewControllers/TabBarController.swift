import UIKit

class TabBarController: UITabBarController {
    func createTabBarVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabBarVC = TabBarController()

        let vc1 = storyboard.instantiateViewController(withIdentifier: "Calendar") as! CalendarViewController
        vc1.title = "Calendar"
        vc1.view.backgroundColor = UIColor(named: "BackgroundColor")

        let vc2 = storyboard.instantiateViewController(withIdentifier: "ToDoList") as! ToDoListViewController
        vc2.title = "ToDoList"

        let vc3 = storyboard.instantiateViewController(withIdentifier: "Finance") as! FinanceViewController
        vc3.title = "Finance"

        let vc4 = storyboard.instantiateViewController(withIdentifier: "Settings") as! SettingsViewController
        vc4.title = "Settings"

        tabBarVC.tabBar.backgroundColor = UIColor(named: "BackgroundColor")
        tabBarVC.tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBarVC.tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        tabBarVC.tabBar.layer.shadowOpacity = 4
        tabBarVC.tabBar.layer.shadowRadius = 5.0
        tabBarVC.tabBar.layer.cornerRadius = 30

        tabBarVC.setViewControllers([vc1, vc2, vc3, vc4], animated: false)
        tabBarVC.modalPresentationStyle = .fullScreen
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let delegate = windowScene.delegate as? SceneDelegate,
           let window = delegate.window {
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
                window.rootViewController = tabBarVC
            }, completion: nil)
        }
    }
}
