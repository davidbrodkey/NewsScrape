library(httr2)
library(dplyr)
library(jsonlite)

req <- request("https:///newsapi.org/v2/everything") %>%
  req_url_query(
    q = '`"Dogs"`',
    from = Sys.Date() - 1,
    pageSize = 10,
    apiKey = Sys.getenv("NEWS_API_KEY")
  )
resp <- req_perform(req)
output<-resp_body_json(resp)

json_data <- toJSON(output, pretty = TRUE)
write(json_data, file = "my_data.json")
