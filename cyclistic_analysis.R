# =========================================================
# Cyclistic Case Study
# =========================================================

library(tidyverse)
library(lubridate)

# ---------------------------
# 1) Load data
# ---------------------------
data_path <- "data/sample_trips.csv"
all_trips <- read_csv(data_path, show_col_types = FALSE)

# ---------------------------
# 2) Data Preparation
# ---------------------------
all_trips <- all_trips %>%
  mutate(
    started_at = ymd_hms(started_at),
    ended_at   = ymd_hms(ended_at),
    
    ride_length = as.numeric(difftime(ended_at, started_at, units = "mins")),
    
    date = as.Date(started_at),
    month = month(date, label = TRUE, abbr = TRUE),
    weekday = wday(date, label = TRUE, abbr = TRUE)
  ) %>%
  filter(ride_length > 0)

# Day Arrangement
all_trips$weekday <- factor(
  all_trips$weekday,
  levels = c("Sun","Mon","Tue","Wed","Thu","Fri","Sat")
)

# Month Arrangement
all_trips$month <- factor(
  all_trips$month,
  levels = c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
)

# ---------------------------
# 3) Create folders
# ---------------------------
dir.create("outputs", showWarnings = FALSE)
dir.create("outputs/plots", showWarnings = FALSE)

# =========================================================
# ANALYSIS
# =========================================================

# 1) Number of rides by day
rides_day <- all_trips %>%
  count(member_casual, weekday)

p1 <- ggplot(rides_day,
             aes(weekday, n, fill = member_casual)) +
  geom_col(position = "dodge") +
  labs(title = "Number of Rides by Day and Rider Type",
       x = "Day of Week",
       y = "Number of Rides")

ggsave("outputs/plots/rides_by_day.png", p1, width = 8, height = 5)

# 2) Avg duration by day
duration_day <- all_trips %>%
  group_by(member_casual, weekday) %>%
  summarise(avg_duration = mean(ride_length), .groups="drop")

p2 <- ggplot(duration_day,
             aes(weekday, avg_duration, fill = member_casual)) +
  geom_col(position="dodge") +
  labs(title="Average Ride Duration by Day and Rider Type",
       x="Day of Week",
       y="Average Duration (minutes)")

ggsave("outputs/plots/duration_by_day.png", p2, width = 8, height = 5)

# 3) Bike type usage
bike_type <- all_trips %>%
  count(member_casual, rideable_type)

p3 <- ggplot(bike_type,
             aes(rideable_type, n, fill=member_casual)) +
  geom_col(position="dodge") +
  labs(title="Number of Rides by Bike Type and Rider Type",
       x="Bike Type",
       y="Number of Rides")

ggsave("outputs/plots/rides_by_bike_type.png", p3, width = 8, height = 5)

# 4) Rides by month
rides_month <- all_trips %>%
  count(member_casual, month)

p4 <- ggplot(rides_month,
             aes(month, n, color=member_casual, group=member_casual)) +
  geom_line(size=1) +
  geom_point(size=2) +
  labs(title="Number of Rides by Month and Rider Type",
       x="Month",
       y="Number of Rides")

ggsave("outputs/plots/rides_by_month.png", p4, width = 8, height = 5)

# 5) Avg duration by month
duration_month <- all_trips %>%
  group_by(member_casual, month) %>%
  summarise(avg_duration = mean(ride_length), .groups="drop")

p5 <- ggplot(duration_month,
             aes(month, avg_duration, color=member_casual, group=member_casual)) +
  geom_line(size=1) +
  geom_point(size=2) +
  labs(title="Average Ride Duration by Month and Rider Type",
       x="Month",
       y="Average Duration (minutes)")

ggsave("outputs/plots/duration_by_month.png", p5, width = 8, height = 5)

# ---------------------------
# Export tables
# ---------------------------
write_csv(rides_day,"outputs/rides_by_day.csv")
write_csv(duration_day,"outputs/duration_by_day.csv")
write_csv(rides_month,"outputs/rides_by_month.csv")
write_csv(duration_month,"outputs/duration_by_month.csv")

# =========================================================
# DONE - THANK YOU
# =========================================================


