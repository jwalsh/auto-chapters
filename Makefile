# Makefile

EXAMPLE_URL = "https://github.com/AssemblyAI-Examples/audio-examples/raw/main/20230607_me_canadian_wildfires.mp3"
AUDIO_FILE = audio.mp3 

.DEFAULT_GOAL := help

.PHONY: run clean

$(AUDIO_FILE): 
	@echo "Downloading audio file from $(EXAMPLE_URL)"
	curl -s -L -o $(AUDIO_FILE) $(EXAMPLE_URL)

run: $(AUDIO_FILE) ## Run the transcription
	@echo "Running transcription of $(AUDIO_FILE)"
	poetry run python auto_chapters/cli.py -f $(AUDIO_FILE)

clean: ## Remove generated and downloaded files 
	@echo "Removing $(AUDIO_FILE)"
	rm -f $(AUDIO_FILE)

.PHONY: help
help: ## Print this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
