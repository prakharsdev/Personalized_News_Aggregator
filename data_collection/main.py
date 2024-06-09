import yaml
from scripts.collect_news import collect_news

def load_config():
    with open('config/config.yaml', 'r') as file:
        config = yaml.safe_load(file)
    return config

if __name__ == '__main__':
    config = load_config()
    collect_news(config)
