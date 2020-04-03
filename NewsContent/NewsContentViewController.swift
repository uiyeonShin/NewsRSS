//
//  NewsViewController.swift
//  RSSNewsReader
//
//  Created by 신의연 on 2020/03/20.
//  Copyright © 2020 Koggy. All rights reserved.
//

import UIKit
import SnapKit
import Untagger
class NewsContentViewController: UIViewController {
    
    private let webView: UIWebView = {
        var webView = UIWebView()
        webView.backgroundColor = .white
        return webView
    }()
    
    private let spinner = UIActivityIndicatorView(style: .gray)
    let articleTitleLeft = "<h2><span class=\"title\">"
    let articleTitleRight = "</span></h2>"
    var articleTitle = ""
    var keywords = [""]
    let keywordsLeft = "<h5><span class=\"keywords\">"
    let keywordsRight = "</span></h5>"
    var url = ""
    var htmlStr = """
        
    """
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setURL(url: url)
    }
    
    private func setLayout() {
        navigationItem.largeTitleDisplayMode = .never
        view.addSubview(webView)
        webView.snp.makeConstraints { (m) in
            m.width.equalTo(view.snp.width)
            m.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            m.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    func setURL(url: String) {
        guard let baseURL = URL(string: url) else { return }
        htmlStr = articleTitleLeft+articleTitle+articleTitleRight+keywordsLeft+" 키워드 : \(keywords[0]), \(keywords[1]), \(keywords[2])"+keywordsRight+htmlStr
        webView.loadHTMLString(htmlStr, baseURL: baseURL)
    }
    
    
}
