def parse_rss_feed(feed):
    articles = []
    for entry in feed.entries:
        article = {
            'title': entry.title,
            'link': entry.link,
            'summary': entry.summary,
            'published': entry.published
        }
        articles.append(article)
    return articles
