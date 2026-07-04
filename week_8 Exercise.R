#week8
#upload data
student_data<- read.csv("C:\\Users\\jzlnm\\Downloads\\student_data.csv")
View(student_data)

#student high
Student_high <- Student_high<-student_data[student_data$final_exam_mark>80,]
View(Student_high)

#arrange question 2
library(dplyr)
mydata1 <- student_data %>% arrange(coursework_mark)
View(mydata1)

#select function question 3
mydata2 <- student_data %>% select(student_name, final_exam_mark)
View(mydata2)

#descriptive statistic question4
nrow(student_data)
ncol(student_data)

#R query question 5
head(student_data)
tail(student_data)
str(student_data)
summary(student_data)

#Identify and detect outliers question 6
boxplot(student_data$final_exam_mark, main = "Boxplot of Final Exam Mark")
boxplot(student_data$coursework_mark, main = "Boxplot of Coursework Mark")
first_q <- quantile(student_data$final_exam_mark, 0.25)
third_q <- quantile(student_data$final_exam_mark, 0.75)
iqr <- IQR(student_data$final_exam_mark)
le <- first_q - 1.5 * iqr
ue <- third_q + 1.5 * iqr
print(le)
print(ue)

data_new <- student_data$final_exam_mark
data_new <- data_new[!data_new < le]
data_new <- data_new[!data_new > ue]
print(data_new)

data_new <- student_data$final_exam_mark
avg <- round(mean(data_new))
data_new[data_new < le] <- avg
data_new[data_new > ue] <- avg
print(data_new)

data_new <- student_data$final_exam_mark
data_new[data_new < le] <- le
data_new[data_new > ue] <- ue
print(data_new)