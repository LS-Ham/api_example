# Text Encoding to UTF-8 in CMD
# Example For Select Calculated Data for tag API by using curl in ubuntu

LAKE_ID=$YOUR_LAKE_ID
API_KEY=$YOUR_API_KEY
CLOUD_VENDOR=$YOUR_CLOUD_VENDOR
CLOUD_REGION=$YOUR_CLOUD_REGION

CONTENT_HEADER=Content-Type:application/json
API_HEADER=x-api-key:$API_KEY
URL=https://${CLOUD_VENDOR}.${CLOUD_REGION}.machlake.com/lakes/${LAKE_ID}/values/calculated

# ------------------------------------------------------------------------------------------------- #

# CASE - Calculated DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn with calc_mode=min
TAG_NAME=sensor1,sensor2
CALC_MODE=min
DATE_FORMAT="YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn"
START_TIME="2021-01-06 17:00:00 000:000:000"
END_TIME="2021-01-06 21:00:00 000:000:000"

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER --data-urlencode "tag_name=$TAG_NAME" --data-urlencode "calc_mode=$CALC_MODE" --data-urlencode "start_time=$START_TIME" --data-urlencode "end_time=$END_TIME" --data-urlencode "date_format=$DATE_FORMAT"

# Return Format
# {"data":{"calc_mode":"MIN","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor1","data":[{"TIME":"2021-01-06 17:00:00 000:000:000","VALUE":1},{"TIME":"2021-01-06 18:00:00 000:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:04 000:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:05 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]},{"tag_name":"sensor2","data":[{"TIME":"2021-01-06 17:00:00 000:000:000","VALUE":1},{"TIME":"2021-01-06 17:00:01 000:000:000","VALUE":1.5},{"TIME":"2021-01-06 17:00:02 000:000:000","VALUE":2},{"TIME":"2021-01-06 17:00:03 000:000:000","VALUE":1},{"TIME":"2021-01-06 17:00:04 000:000:000","VALUE":1.5},{"TIME":"2021-01-06 17:00:05 000:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 000:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:04 000:000:000","VALUE":2},{"TIME":"2021-01-06 20:00:05 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]}]},"status":"success"}

# ------------------------------------------------------------------------------------------------- #

# CASE - Calculated DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn with calc_mode=max and interval_value=3
TAG_NAME=sensor1,sensor2
CALC_MODE=max
DATE_FORMAT="YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn"
START_TIME="2021-01-06 17:00:00 000:000:000"
END_TIME="2021-01-06 21:00:00 000:000:000"
INTERVAL_VALUE=3

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER --data-urlencode "tag_name=$TAG_NAME" --data-urlencode "calc_mode=$CALC_MODE" --data-urlencode "start_time=$START_TIME" --data-urlencode "end_time=$END_TIME" --data-urlencode "date_format=$DATE_FORMAT" --data-urlencode "interval_value=$INTERVAL_VALUE"

# Return Format
# {"data":{"calc_mode":"MAX","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":20,"length":17}],"samples":[{"tag_name":"sensor2","data":[{"TIME":"2021-01-06 17:00:00 000:000:000","VALUE":2},{"TIME":"2021-01-06 17:00:03 000:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:03 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]},{"tag_name":"sensor1","data":[{"TIME":"2021-01-06 17:00:00 000:000:000","VALUE":2},{"TIME":"2021-01-06 18:00:00 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:03 000:000:000","VALUE":2.5},{"TIME":"2021-01-06 20:00:06 000:000:000","VALUE":2}]}]},"status":"success"}

# ------------------------------------------------------------------------------------------------- #

# CASE - Calculated DATA GET with date format YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn with calc_mode=min and interval_type=m and interval_value=90
TAG_NAME=sensor1,sensor2
CALC_MODE=cnt
DATE_FORMAT="YYYY-MM-DD HH24:MI:SS mmm:uuu:nnn"
START_TIME="2021-01-06 17:00:00 000:000:000"
END_TIME="2021-01-06 21:00:00 000:000:000"
INTERVAL_TYPE=m
INTERVAL_VALUE=90

curl -k -G $URL -H $CONTENT_HEADER -H $API_HEADER --data-urlencode "tag_name=$TAG_NAME" --data-urlencode "calc_mode=$CALC_MODE" --data-urlencode "start_time=$START_TIME" --data-urlencode "end_time=$END_TIME" --data-urlencode "date_format=$DATE_FORMAT" --data-urlencode "interval_value=$INTERVAL_VALUE" --data-urlencode "interval_type=$INTERVAL_TYPE"

# Return Format
# {"data":{"calc_mode":"COUNT","columns":[{"name":"TIME","type":5,"length":4096},{"name":"VALUE","type":12,"length":20}],"samples":[{"tag_name":"sensor2","data":[{"TIME":"2021-01-06 16:30:00 000:000:000","VALUE":1},{"TIME":"2021-01-06 18:00:00 000:000:000","VALUE":1},{"TIME":"2021-01-06 19:30:00 000:000:000","VALUE":1}]},{"tag_name":"sensor1","data":[{"TIME":"2021-01-06 16:30:00 000:000:000","VALUE":1},{"TIME":"2021-01-06 18:00:00 000:000:000","VALUE":1},{"TIME":"2021-01-06 19:30:00 000:000:000","VALUE":1}]}]},"status":"success"}

# ------------------------------------------------------------------------------------------------- #