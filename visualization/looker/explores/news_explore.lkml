explore: news_explore {
  view_name: news_articles
  label: "News Articles and Interactions"

  join: user_interactions {
    sql_on: ${news_articles.article_id} = ${user_interactions.article_id} ;;
    relationship: one_to_many
  }

  join: user_recommendations {
    sql_on: ${news_articles.article_id} = ${user_recommendations.article_id} ;;
    relationship: one_to_many
  }

  join: users {
    sql_on: ${user_interactions.user_id} = ${users.user_id} ;;
    relationship: many_to_one
  }
}

view: news_articles {
  sql_table_name: your_project.your_dataset.news_articles ;;

  dimension: id {
    primary_key: yes
    hidden: yes
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: link {
    type: string
    sql: ${TABLE}.link ;;
  }

  dimension: summary {
    type: string
    sql: ${TABLE}.summary ;;
  }

  dimension: published {
    type: time
    sql: ${TABLE}.published ;;
    timeframes: [time, date, week, month, quarter, year]
  }

  measure: count {
    type: count
    sql: ${id} ;;
  }
}

view: user_interactions {
  sql_table_name: your_project.your_dataset.user_interactions ;;

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: article_id {
    type: string
    sql: ${TABLE}.article_id ;;
  }

  dimension: interaction {
    type: string
    sql: ${TABLE}.interaction ;;
  }

  measure: average_interactions {
    type: average
    sql: ${interaction} ;;
  }
}

view: user_recommendations {
  sql_table_name: your_project.your_dataset.user_recommendations ;;

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: article_id {
    type: string
    sql: ${TABLE}.article_id ;;
  }

  dimension: recommended_at {
    type: time
    sql: ${TABLE}.recommended_at ;;
    timeframes: [time, date, week, month, quarter, year]
  }

  measure: count {
    type: count
    sql: ${id} ;;
  }
}

view: users {
  sql_table_name: your_project.your_dataset.users ;;

  dimension: user_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  measure: count {
    type: count
    sql: ${user_id} ;;
  }
}
