import requests
import yaml

def load_config():
    with open('config.yaml', 'r') as file:
        config = yaml.safe_load(file)
    return config

def send_slack_notification(channel, message, config):
    url = "https://slack.com/api/chat.postMessage"
    headers = {
        "Authorization": f"Bearer {config['slack']['api_token']}",
        "Content-Type": "application/json"
    }
    payload = {
        "channel": channel,
        "text": message
    }
    response = requests.post(url, headers=headers, json=payload)
    if response.status_code != 200:
        raise Exception(f"Request to Slack API failed: {response.status_code}, {response.text}")

if __name__ == "__main__":
    config = load_config()
    # Example usage
    channel = "#news-recommendations"
    message = "Here is your personalized news update!"
    send_slack_notification(channel, message, config)
