# Dockerでの実行方法

1. イメージのビルド

```sh
docker build -t whisper-transcriber .
```

2. 音声ファイルの準備

ローカルに音声ファイル（例: `audio.wav`）を用意してください。

3. コンテナの実行

音声ファイルをコンテナにマウントして実行します。

```sh
docker run --rm -v "$(pwd):/app" whisper-transcriber python transcribe_local.py /app/audio.wav
```

モデル名を指定する場合は、コマンドの末尾に追加してください（例: `small`）。

```sh
docker run --rm -v "$(pwd):/app" whisper-transcriber python transcribe_local.py /app/audio.wav small
```
# VoiceToText