#Load dataset
TitanicData <-read.csv("data/titanic.csv", colClasses = c(
  PassengerId = "numeric",
  Pclass = "numeric",
  Name = "character",
  Sex = "factor",
  Age = "numeric",
  SibSp = "numeric",
  Parch = "numeric",
  Ticket = "character",
  Fare = "numeric",
  Cabin = "character",
  Embarked = "factor"
))

# Define levels for categorical columns
embarked_levels <- c("C", "Q", "S")
sex_levels <- c("female", "male")

# Update factor columns with levels
TitanicData$Embarked <- factor(TitanicData$Embarked, levels = embarked_levels)
TitanicData$Sex <- factor(TitanicData$Sex, levels = sex_levels)

# Display the dataset
View(TitanicData)

# Display frequency and percentage of Pclass
table_Pclass <- table(TitanicData$Pclass)
percentage_Pclass <- prop.table(table_Pclass) * 100
class_labels_Pclass <- c("First Class", "Second Class", "Third Class")
cat("Frequency and Percentage of Pclass:\n")
cat(table_Pclass, "\n")
cat(paste0("Percentage:\n", round(percentage_Pclass, 2)), "\n")
cat(paste0("Class Labels:\n", class_labels_Pclass, "\n\n"))

# Display frequency and percentage of Sex
table_Sex <- table(TitanicData$Sex)
percentage_Sex <- prop.table(table_Sex) * 100
class_labels_Sex <- c("Female", "Male")
cat("Frequency and Percentage of Sex:\n")
cat(table_Sex, "\n")
cat(paste0("Percentage:\n", round(percentage_Sex, 2)), "\n")
cat(paste0("Class Labels:\n", class_labels_Sex, "\n\n"))

# Display frequency and percentage of Embarked
table_Embarked <- table(TitanicData$Embarked)
percentage_Embarked <- prop.table(table_Embarked) * 100
class_labels_Embarked <- c("Cherbourg", "Queenstown", "Southampton")
cat("Frequency and Percentage of Embarked:\n")
cat(table_Embarked, "\n")
cat(paste0("Percentage:\n", round(percentage_Embarked, 2)), "\n")
cat(paste0("Class Labels:\n", class_labels_Embarked, "\n\n"))

# Calculate mean, median, and mode for Age
mean_Age <- mean(TitanicData$Age, na.rm = TRUE)
median_Age <- median(TitanicData$Age, na.rm = TRUE)
mode_Age <- as.numeric(names(table(TitanicData$Age))[which.max(table(TitanicData$Age))])

cat("Measures of Central Tendency for Age:\n")
cat(paste0("Mean: ", round(mean_Age, 2)), "\n")
cat(paste0("Median: ", median_Age), "\n")
cat(paste0("Mode: ", mode_Age), "\n\n")

# Calculate mean, median, and mode for Fare
mean_Fare <- mean(TitanicData$Fare, na.rm = TRUE)
median_Fare <- median(TitanicData$Fare, na.rm = TRUE)
mode_Fare <- as.numeric(names(table(TitanicData$Fare))[which.max(table(TitanicData$Fare))])

cat("Measures of Central Tendency for Fare:\n")
cat(paste0("Mean: ", round(mean_Fare, 2)), "\n")
cat(paste0("Median: ", median_Fare), "\n")
cat(paste0("Mode: ", mode_Fare), "\n\n")

# Calculate range, variance, and standard deviation for Age
range_Age <- range(TitanicData$Age, na.rm = TRUE)
variance_Age <- var(TitanicData$Age, na.rm = TRUE)
sd_Age <- sd(TitanicData$Age, na.rm = TRUE)

cat("Measures of Distribution for Age:\n")
cat(paste0("Range: ", paste(range_Age, collapse = " - ")), "\n")
cat(paste0("Variance: ", round(variance_Age, 2)), "\n")
cat(paste0("Standard Deviation: ", round(sd_Age, 2)), "\n\n")

# Calculate range, variance, and standard deviation for Fare
range_Fare <- range(TitanicData$Fare, na.rm = TRUE)
variance_Fare <- var(TitanicData$Fare, na.rm = TRUE)
sd_Fare <- sd(TitanicData$Fare, na.rm = TRUE)

cat("Measures of Distribution for Fare:\n")
cat(paste0("Range: ", paste(range_Fare, collapse = " - ")), "\n")
cat(paste0("Variance: ", round(variance_Fare, 2)), "\n")
cat(paste0("Standard Deviation: ", round(sd_Fare, 2)), "\n\n")

# Calculate correlation between Age and Fare
correlation_Age_Fare <- cor(TitanicData$Age, TitanicData$Fare, use = "complete.obs")

cat("Measures of Relationship (Correlation) between Age and Fare:\n")
cat(paste0("Correlation Coefficient: ", round(correlation_Age_Fare, 2)), "\n\n")

# Perform ANOVA for Fare among different Passenger Classes
anova_result <- aov(Fare ~ Pclass, data = TitanicData)

# Display ANOVA summary
summary(anova_result)

#Basic Visualizations
#Univariate Plots

library(ggplot2)

# Univariate Histogram for Numerical Variable (e.g., Age)
ggplot(TitanicData, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black", alpha = 0.7) +
  labs(title = "Histogram of Age", x = "Age", y = "Frequency") +
  theme_minimal()

# Univariate Bar Plot for Categorical Variable (e.g., Pclass)
ggplot(TitanicData, aes(x = factor(Pclass))) +
  geom_bar(fill = "lightcoral", color = "black", alpha = 0.7) +
  labs(title = "Bar Plot of Passenger Class", x = "Passenger Class", y = "Count") +
  theme_minimal()

# Univariate Box Plot for Numerical Variable (e.g., Fare)
ggplot(TitanicData, aes(x = factor(Pclass), y = Fare)) +
  geom_boxplot(fill = "lightgreen", color = "black", alpha = 0.7) +
  labs(title = "Box Plot of Fare by Passenger Class", x = "Passenger Class", y = "Fare") +
  theme_minimal()

# Univariate Bar Plot for Categorical Variable (e.g., Sex)
ggplot(TitanicData, aes(x = factor(Sex))) +
  geom_bar(fill = "lightcoral", color = "black", alpha = 0.7) +
  labs(title = "Bar Plot of Gender", x = "Gender", y = "Count") +
  theme_minimal()

#Multivariate plots
# Multivariate Scatter Plot for Numerical Variables (e.g., Age and Fare)
ggplot(TitanicData, aes(x = Age, y = Fare, color = factor(Pclass))) +
  geom_point(alpha = 0.7) +
  labs(title = "Scatter Plot of Age and Fare by Passenger Class",
       x = "Age", y = "Fare", color = "Passenger Class") +
  theme_minimal()

# Multivariate Box Plot for Numerical and Categorical Variables (e.g., Age and Pclass)
ggplot(TitanicData, aes(x = factor(Pclass), y = Age, fill = factor(Pclass))) +
  geom_boxplot(alpha = 0.7) +
  labs(title = "Box Plot of Age by Passenger Class",
       x = "Passenger Class", y = "Age", fill = "Passenger Class") +
  theme_minimal()

# Multivariate Bar Plot for Categorical Variables (e.g., Pclass and Sex)
ggplot(TitanicData, aes(x = factor(Pclass), fill = factor(Sex))) +
  geom_bar(position = "dodge", alpha = 0.7) +
  labs(title = "Bar Plot of Passenger Class by Gender",
       x = "Passenger Class", fill = "Gender") +
  theme_minimal()


