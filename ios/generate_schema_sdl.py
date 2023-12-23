import os
import requests


SDL_QUERY = """query SDL {
  sdl
}"""


SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))


if __name__ == "__main__":
    with open(f"{SCRIPT_DIR}/schema.graphqls", "w") as fw:
        res = requests.post("http://localhost:4000/graphql", json={"query": SDL_QUERY})
        fw.write(res.json()["data"]["sdl"])
