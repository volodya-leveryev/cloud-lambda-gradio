FROM public.ecr.aws/docker/library/python:3.14-slim

COPY --from=public.ecr.aws/awsguru/aws-lambda-adapter:1.1.0 /lambda-adapter /opt/extensions/lambda-adapter

WORKDIR /app

RUN python -m pip install gradio

RUN python -m pip install torch torchvision --index-url https://download.pytorch.org/whl/cpu

COPY app.py  ./

CMD ["python3", "app.py"]
