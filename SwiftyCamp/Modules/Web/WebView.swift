//
//  WebView.swift
//  SwiftyCamp
//
//  Created by Ali Fayed on 04/12/2021.
//  Copyright © 2021 Ali Fayed.
//

import UIKit
import WebKit

class WebView: UIView {
    weak var delegate: WebViewController? {
        didSet {
            webView.uiDelegate = delegate
            webView.navigationDelegate = delegate
        }
    }

    let webView = WKWebView()
    let progressView = UIProgressView(progressViewStyle: .bar)
    private var estimatedProgressObserver: NSKeyValueObservation?

    override init(frame: CGRect) {
        super.init(frame: frame)

        if #available(iOS 13, *) {
            backgroundColor = .systemBackground
        } else {
            backgroundColor = .white
        }

        if #available(iOS 13, *) {
            backgroundColor = .systemBackground
            webView.backgroundColor = .systemBackground
        }

        // stop the web view from appearing full white initially; this is pretty blinding in dark mode!
        webView.isOpaque = false

        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.allowsBackForwardNavigationGestures = true

        // FIXME: For some reason this web view loves having horizontal bounces even for pages that don't scroll horizontally. Disabling all bouncing sucks, but at least it solves the weird scrolling behavior. Note: this might only happen when we're inside a split view?
        webView.scrollView.bounces = false

        addSubview(webView)

        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            webView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])

        progressView.isHidden = true
        progressView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(progressView)

        NSLayoutConstraint.activate([
            progressView.heightAnchor.constraint(equalToConstant: 2.0),
            progressView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            progressView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])

        setupEstimatedProgressObserver()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupEstimatedProgressObserver() {
        estimatedProgressObserver = webView.observe(\.estimatedProgress, options: .new) { [weak self] webView, _ in
            self?.progressView.setProgress(Float(webView.estimatedProgress), animated: true)
        }
    }

    func load(_ url: URL) {
        let request = URLRequest(url: url)
        webView.load(request)
    }

    @objc func reload() {
        webView.reload()
    }

    var canGoBack: Bool { return webView.canGoBack }
    @objc func goBack() {
        webView.goBack()
    }

    var canGoForward: Bool { return webView.canGoForward }
    @objc func goForward() {
        webView.goForward()
    }

    func loadingDidStart() {
        progressView.progress = 0
        progressView.isHidden = false
    }

    func loadingDidFinish() {
        progressView.isHidden = true
    }

    func getShareItems() -> [Any] {
        guard let url = webView.url else { return [] }
        var shareItems: [Any] = [url]

        if let webViewTitle = webView.title {
            shareItems.append("\(webViewTitle) (via @twostraws)")
        }

        return shareItems
    }
}
