-- Load processed data into the news_articles table
INSERT INTO `your_project.your_dataset.news_articles` (id, title, link, summary, published, entities)
VALUES
  ('1', 'Title 1', 'https://link1.com', 'Summary 1', '2023-06-07 00:00:00 UTC', ['Entity1', 'Entity2']),
  ('2', 'Title 2', 'https://link2.com', 'Summary 2', '2023-06-08 00:00:00 UTC', ['Entity3', 'Entity4']);
