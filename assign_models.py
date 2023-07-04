import json
import sys

def main():
    models = {"Models": []}
    for model in sys.argv[1:]:
        models["Models"].append(json.load(open(f"models/{model}.json")))
    
    json.dump(models, open("tf-worker/schema.json", "w"))
    json.dump(models, open("main-controller/schema.json", "w"))


if __name__ == "__main__":
    main()
