file_name_with_path <- "~/Desktop/MBA /Harrisburg/COURSE WORK/ANALY 510/Assignment7/collaboration-on-repository-and-data-cleanup/dirty_data.csv"

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

file_name_with_path_after_step1 <- "~/Desktop/MBA /Harrisburg/COURSE WORK/ANALY 510/Assignment7/collaboration-on-repository-and-data-cleanup/dirty_data_after_step1.csv"
write.csv(dirty_data, file = file_name_with_path_after_step1, eol = "\n", na = "NA",
          row.names = FALSE, fileEncoding = "")





