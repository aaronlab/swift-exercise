//
//  ViewController.swift
//  Web
//
//  Created by Aaron Lee on 7/18/20.
//  Copyright © 2020 Aaron Lee. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var txtUrl: UITextField!
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    // url 인수를 통해 웹 페이지의 주소를 전달받아 웹 페이지를 보여줌
    func loadWebPage(_ url: String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myWebView.navigationDelegate = self
        loadWebPage("https://www.google.com")   // 앱 실행 시 초기 홈페이지 호출
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    // http 없을 시 프로토콜 자동 삽입
    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag {
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    
    // 텍스트 필드의 주소로 웹 뷰 로딩
    @IBAction func btnGoToUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("https://www.google.com")
    }
    
    
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("http://www.aaronlab.net")
    }
    
    // html 코드를 변수에 저장 후 웹뷰로 나타냄
    @IBAction func btnLoadingHtmlString(_ sender: UIButton) {
        let htmlString = "<h1> HTML String </h1><p> Using String for a WebPage </p><p><a href=\"http://www.aaronlab.net/\">Go to AaronLab</a></p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    // htmlView.html을 웹 뷰로 나타냄
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading() // 로딩 중지
    }
    
    
    @IBAction func btnRefresh(_ sender: UIBarButtonItem) {
        myWebView.reload()  // 새로고침
    }
    
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()  // 이전 페이지로
    }
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()   // 다음 페이지로
    }
}

