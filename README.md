using-Web-View-to-Render-PDF-or-Open-URL
=============================================

The API illustrates how to create UIViewController with tableView having two sections: pdf files and url links and then open a pdf file or a web page in UIWebView.

During my app’s realization I touched the following topics:
- UITableView;
- UIWebView and UIWebViewDelegate;
- UIActivityIndicator;
- UIBarButtonItem.

Key features of the app: 
1. using table views with dynamic cells;
2. If you press a cell in the tableView your get a pdf file or a web page through push navigation.
3. I used the only VC for both pdf and url.
4. I used UIActivityIndicator and UIBarButtonItems Back and Forward for navigation between different web pages (they may active and inactive).