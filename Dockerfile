# Dockerfile

# 1. Python と ffmpeg を含む slim イメージをベースに
FROM python:3.10-slim

# 2. システム依存ライブラリのインストール
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      ffmpeg \
      git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# 3. 作業ディレクトリを設定
WORKDIR /app

# 4. Whisper ソースと依存ライブラリをインストール
#    whisper は GitHub 版を直接インストール
RUN pip install --no-cache-dir \
      git+https://github.com/openai/whisper.git \
      torch \
      numpy

# 5. ローカルのスクリプト類をコンテナへコピー
COPY transcribe_local.py .

# 6. デフォルトコマンドはヘルプ表示
ENTRYPOINT ["python", "transcribe_local.py"]
