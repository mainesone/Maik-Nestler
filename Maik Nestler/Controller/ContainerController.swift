//
//  ContainerController.swift
//  Maik Nestler
//
//  Created by Maik Nestler on 08.03.21.
//

import UIKit
import SafariServices
import MessageUI

class ContainerController: UIViewController {
    
    // MARK: - Properties
    let contactEmail = "hello@maines.one"
    var menuController: SideMenuController!
    var centerController: UIViewController!
    var isExpanded = false
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
        configureNavigationBar()
        view.backgroundColor = .brandingColor
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return isExpanded
    }
    
    // MARK: - Functions
    func configureNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
    
    func configureHomeController() {
        let homeController = HomeController()
        homeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func configureMenuController() {
        if menuController == nil {
            menuController = SideMenuController()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }
    
    func animatePanel(shouldExpand: Bool, sideMenuOption: SideMenuOption?) {
        if shouldExpand {
            /// show menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
            }, completion: nil)
            
        } else {
            /// hide menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = 0
            }) { (_) in
                guard let sideMenuOption = sideMenuOption else { return }
                self.didSelectSideMenuOption(sideMenuOption: sideMenuOption)
            }
        }
        
        animateStatusBar()
    }
    
    func didSelectSideMenuOption(sideMenuOption: SideMenuOption) {
        switch sideMenuOption {
        case .automotive:
            let autoVC = AutomotiveViewController()
            let nav = UINavigationController(rootViewController: autoVC)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true, completion: nil)
        case .hobbies:
            print("Show Inbox")
        case .milestones:
            print("Show Milestones")
        case .email:
            sendEmail()
        case .linkedIn:
            launchSafariVC(withURLString: SocialMedia.linkedInLink.rawValue)
        case .gitHub:
            launchSafariVC(withURLString: SocialMedia.gitHubLink.rawValue)
        case .instagram:
            launchSafariVC(withURLString: SocialMedia.instagramLink.rawValue)
        }
    }
    
    func animateStatusBar() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
}

//MARK: - HomeControllerDelegate
extension ContainerController: HomeControllerDelegate {
    func handleSideMenuToggle(forSideMenuOption sideMenuOption: SideMenuOption?) {
        if !isExpanded {
            configureMenuController()
        }
        isExpanded = !isExpanded
        animatePanel(shouldExpand: isExpanded, sideMenuOption: sideMenuOption)
    }
}

//MARK: - SafariControllerDelegate
extension ContainerController: SFSafariViewControllerDelegate {
    func launchSafariVC(withURLString: String) {
        if let url = URL(string: withURLString) {
            let vc = SFSafariViewController(url: url)
            vc.preferredControlTintColor = .brandingColor
            vc.delegate = self
            present(vc, animated: true)
        }
    }
}

//MARK: - MailComposeViewControllerDelegate
extension ContainerController: MFMailComposeViewControllerDelegate {
    func sendEmail() {
        let sendMailVC = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(sendMailVC, animated: true, completion: nil)
        } else {
            showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let messageBody: String
        let deviceModelName = UIDevice.modelName
        let iOSVersion = UIDevice.current.systemVersion
        let topDivider = "------- Developer Info -------"
        let divider = "------------------------------"
        
        if let appVersion = UIApplication.appVersion {
            
            messageBody =  "\n\n\n\n\(topDivider)\nApp version: \(appVersion)\nDevice model: \(deviceModelName)\niOS version: \(iOSVersion)\n\(divider)"
        } else {
            messageBody = "\n\n\n\n\(topDivider)\nDevice model: \(deviceModelName)\niOS version: \(iOSVersion)\n\(divider)"
        }
        
        let mailVC = MFMailComposeViewController()
        mailVC.mailComposeDelegate = self
        mailVC.setToRecipients([contactEmail])
        mailVC.setSubject("Say Hey to Maik and leave some feedback")
        mailVC.setMessageBody(messageBody, isHTML: false)
        return mailVC
    }
    
    /// This alert gets shown if the device is a simulator, doesn't have Apple mail set up, or if mail is not available due to connectivity issues.
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertController(title: "Could Not Send Email",
                                                   message: "Your device could not send email. Please check email configuration and internet connection and try again.",
                                                   preferredStyle: .alert)
        
        sendMailErrorAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
        sendMailErrorAlert.view.tintColor = .brandingColor
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
