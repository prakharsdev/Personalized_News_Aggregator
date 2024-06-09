import yaml
from models.train_model import train_model
from models.recommend import generate_recommendations

def load_config():
    with open('config/config.yaml', 'r') as file:
        config = yaml.safe_load(file)
    return config

if __name__ == "__main__":
    config = load_config()
    
    # Train the recommendation model
    train_model(config)
    
    # Generate recommendations
    generate_recommendations(config)
