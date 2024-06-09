dashboard: news_dashboard {
  title: "News Aggregator Dashboard"
  layout: newspaper

  # Explore to use for the dashboard
  explore: news_explore

  # A section for key metrics
  section: key_metrics {
    title: "Key Metrics"
    description: "Overview of key metrics related to news articles and user interactions."

    # Total number of articles
    tile: total_articles {
      title: "Total Articles"
      type: single_value
      query: {
        measures: [news_articles.count]
      }
    }

    # Total number of users
    tile: total_users {
      title: "Total Users"
      type: single_value
      query: {
        measures: [users.count]
      }
    }

    # Average user interactions
    tile: avg_interactions {
      title: "Average User Interactions"
      type: single_value
      query: {
        measures: [user_interactions.average_interactions]
      }
    }
  }

  # A section for recent articles
  section: recent_articles {
    title: "Recent Articles"
    description: "Details of the most recent news articles."

    tile: article_list {
      title: "Article List"
      type: table
      query: {
        dimensions: [news_articles.title, news_articles.published, news_articles.summary]
        sorts: [news_articles.published: desc]
        limit: 10
      }
    }
  }

  # A section for user recommendations
  section: user_recommendations {
    title: "User Recommendations"
    description: "Details of user recommendations and interactions."

    tile: recommendations_over_time {
      title: "Recommendations Over Time"
      type: line
      query: {
        dimensions: [user_recommendations.recommended_at]
        measures: [user_recommendations.count]
        sorts: [user_recommendations.recommended_at: asc]
        limit: 100
      }
    }
  }
}
