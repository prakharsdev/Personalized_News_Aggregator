news_sources:
  - type: rss
    url: 'https://rss.cnn.com/rss/cnn_topstories.rss'
  - type: api
    url: 'https://newsapi.org/v2/top-headlines'
    params:
      country: 'us'
      apiKey: 'YOUR_NEWSAPI_KEY'
pubsub_topic: 'projects/YOUR_PROJECT_ID/topics/YOUR_TOPIC_NAME'
