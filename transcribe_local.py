import whisper
import sys

def main(audio_path: str, model_name: str = "base"):
    # Load the Whisper model
    model = whisper.load_model(model_name)

    # Transcribe the audio file
    result = model.transcribe(audio_path)

    # Print the transcription
    print(result['text'])
    
if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python transcribe_local.py <audio_path> [model_name]")
    else:
        audio_path = sys.argv[1]
        model_name = sys.argv[2] if len(sys.argv) > 2 else "base"
        main(audio_path, model_name)