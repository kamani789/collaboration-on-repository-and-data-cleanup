file_name_with_path <- "C:/Users/kzlc665/Desktop/collaboration-on-repository-and-data-cleanup/dirty_data.csv"

dirty_data <- read_csv(file_name_with_path)

##step 1 Populate Area data from previous non NA value where it is missing

library('zoo')

library('dplyr')

b <- data.frame(col1 = dirty_data$Year, col2  = dirty_data$Area) %>% 
  do(na.locf(.))

dirty_data$Area <- b$col2

#clear temp object
b <- {}

#should return 0L as there are no NAs
x <- sum(is.na(dirty_data$Area))

file_name_with_path_after_step1 <- "C:/Users/kzlc665/Desktop/collaboration-on-repository-and-data-cleanup/dirty_data_after_step1.csv"
write.csv(dirty_data, file = file_name_with_path_after_step1, eol = "\n", na = "NA",
          row.names = FALSE, fileEncoding = "")


##Step 2

library('stringdist')
library('stringi')
library('stringr')

#Remove all spaces and special characters
dirty_data$Street <-  str_replace_all(dirty_data$Street, "[^[:alnum:]]", "")

dirty_data$`Street 2` <-  str_replace_all(dirty_data$`Street 2`, "[^[:alnum:]]", "")

#Capitalize first letter
dirty_data$Street <- stri_trans_totitle(dirty_data$Street)
dirty_data$`Street 2` <- stri_trans_totitle(dirty_data$`Street 2`)

#Replace all occurances of streets with str. and avenues as ave.

dirty_data$Street <-  gsub("treet", "tr.", dirty_data$Street)
dirty_data$Street <-  gsub("venue", "ve.", dirty_data$Street)

dirty_data$`Street 2` <-  gsub("treet", "tr.", dirty_data$`Street 2`)
dirty_data$`Street 2` <-  gsub("venue", "ve.", dirty_data$`Street 2`)

file_name_with_path_after_step2 <- "C:/Users/kzlc665/Desktop/collaboration-on-repository-and-data-cleanup/dirty_data_after_step2.csv"
write.csv(dirty_data, file = file_name_with_path_after_step2, eol = "\n", na = "NA",
          row.names = FALSE, fileEncoding = "")


ize_of_dirty_data <- NROW(na.omit(dirty_data$Street))
##check all of them are equal before looping through each row

all.equal(dirty_data$Street,dirty_data$`Street 2`)

dirty_data$`Street 2` <- NA


file_name_with_path_after_step3 <- "dirty_data-after_step3"
write.csv(dirty_data, file = file_name_with_path_after_step3, eol = "\n", na = "NA",
          row.names = FALSE, fileEncoding = "")
