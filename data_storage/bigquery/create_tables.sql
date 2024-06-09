-- Create a table to store processed news articles
CREATE TABLE IF NOT EXISTS `your_project.your_dataset.news_articles` (
  id STRING,
  title STRING,
  link STRING,
  summary STRING,
  published TIMESTAMP,
  entities ARRAY<STRING>
);

-- Create a table to store user recommendations
CREATE TABLE IF NOT EXISTS `your_project.your_dataset.user_recommendations` (
  user_id STRING,
  article_id STRING,
  recommended_at TIMESTAMP
);
