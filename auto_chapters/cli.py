import assemblyai as aai
import os
import click


def cli():
    pass

# Get from env ASSEMBLYAI_API_KEY
aai.settings.api_key = os.getenv("ASSEMBLYAI_API_KEY")

audio_url = "https://github.com/AssemblyAI-Examples/audio-examples/raw/main/20230607_me_canadian_wildfires.mp3"

config = aai.TranscriptionConfig(auto_chapters=True)

transcript = aai.Transcriber().transcribe(audio_url, config)

for chapter in transcript.chapters:
  print(f"{chapter.start}-{chapter.end}: {chapter.headline}")