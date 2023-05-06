FROM python:3.11-alpine

WORKDIR /usr/src/app

COPY app/ ./
RUN pip3 install --no-cache-dir -r requirements.txt

ENV DYNAMODB_ENDPOINT="http://t12s-blogq-dynamodb:28091"
ENV AWS_ACCESS_KEY_ID='DUMMYIDEXAMPLE'
ENV AWS_SECRET_ACCESS_KEY='DUMMYEXAMPLEKEY'

CMD [ "python3", "dynamodb-init.py" ]