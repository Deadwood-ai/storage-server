FROM python:3.12.2

RUN pip install --upgrade pip && \
    pip install pandas fabric supabase jupyter ipython pydantic python-dotenv pydantic_settings tqdm

RUN mkdir /data
WORKDIR /data

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser"]