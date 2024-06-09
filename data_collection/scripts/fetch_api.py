def fetch_api_data(api_response):
    articles = []
    for item in api_response['articles']:
        article = {
            'title': item['title'],
            'link': item['url'],
            'summary': item['description'],
            'published': item['publishedAt']
        }
        articles.append(article)
    return articles
