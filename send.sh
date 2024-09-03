curl -X "POST" "https://api.onesignal.com/notifications" \
-H 'Content-Type: application/json' \
-H 'Authorization: Basic MjkxNDI1ZTEtOTlhMC00YTZiLTk4YWQtNGZhZTY2YzUxN2Zh' \
-d $'{
"included_segments": [
"Total Subscriptions"
],
"app_id": "d9740e14-8070-45a8-9c0b-f66dde0a44f1",
"contents": {
"en": "Hello, world"
}
}'


curl -X "POST" "https://api.onesignal.com/notifications" \
-H 'Content-Type: application/json' \
-H 'Authorization: Basic MjkxNDI1ZTEtOTlhMC00YTZiLTk4YWQtNGZhZTY2YzUxN2Zh' \
-d $'{
"included_segments": [
"All Email Subscriptions"
],
"app_id": "d9740e14-8070-45a8-9c0b-f66dde0a44f1",
"contents": {
"en": "Hello, world"
}
}'

curl --include \
     --request POST \
     --header "Content-Type: application/json; charset=utf-8" \
     --header "Authorization: Basic MjkxNDI1ZTEtOTlhMC00YTZiLTk4YWQtNGZhZTY2YzUxN2Zh" \
     --data-binary '{
         "app_id": "d9740e14-8070-45a8-9c0b-f66dde0a44f1",
         "email_subject": "Welcome to Cat Facts!",
         "email_body": "Welcome to Cat Facts",
         "included_segments": ["Total Subscriptions"]
     }' \
     https://api.onesignal.com/notifications

curl --include \
     --request POST \
     --header "Content-Type: application/json; charset=utf-8" \
     --header "Authorization: Basic MjkxNDI1ZTEtOTlhMC00YTZiLTk4YWQtNGZhZTY2YzUxN2Zh" \
     --data-binary '{
         "app_id": "d9740e14-8070-45a8-9c0b-f66dde0a44f1",
         "email_subject": "Filtered!",
         "email_body": "Welcome to Cat Facts",
         "filters": [
             {"field": "tag", "key": "sub-news", "relation": "=", "value": "subscribed"}
            ]
     }' \
     https://api.onesignal.com/notifications

// view identity
curl --header "Content-Type: application/json; charset=utf-8" \
     --header "Authorization: Basic MjkxNDI1ZTEtOTlhMC00YTZiLTk4YWQtNGZhZTY2YzUxN2Zh" \
"https://api.onesignal.com/apps/d9740e14-8070-45a8-9c0b-f66dde0a44f1/users/by/external_id/petr.valach@hotmail.com/identity"


// user profile
curl --request GET \
     --header 'Authorization: Basic MjkxNDI1ZTEtOTlhMC00YTZiLTk4YWQtNGZhZTY2YzUxN2Zh' \
     --url https://api.onesignal.com/apps/d9740e14-8070-45a8-9c0b-f66dde0a44f1/users/by/external_id/petr.valach@hotmail.com \
     --header 'accept: application/json'

// 
curl --request POST \
     --url 'https://onesignal.com/api/v1/players/csv_export?app_id=d9740e14-8070-45a8-9c0b-f66dde0a44f1' \
     --header 'Authorization: Basic MjkxNDI1ZTEtOTlhMC00YTZiLTk4YWQtNGZhZTY2YzUxN2Zh' \
     --header 'accept: application/json' \
     --header 'content-type: application/json' \
     --data '
{
  "extra_fields": [
    "external_user_id",
    "country"
  ],
  "segment_name": "Total Subscriptions"
}
'

-- players
curl --request GET \
     --url https://api.onesignal.com/apps/d9740e14-8070-45a8-9c0b-f66dde0a44f1/users/by/external_id/petr.valach@hotmail.com/identity \
     --header "Content-Type: application/json; charset=utf-8" \
     --header "Authorization: Basic MjkxNDI1ZTEtOTlhMC00YTZiLTk4YWQtNGZhZTY2YzUxN2Zh" \
     --data '
        {
            "extra_fields": [
                "tags",
            ]
        }'     