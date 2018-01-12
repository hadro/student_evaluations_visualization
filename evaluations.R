library(tidyverse)
library(reshape2)

#import data
df = read_csv('evaluations.csv')

#remove un-needed columns from df
df %>%
  select(-one_of(c('questions','order'))) -> df 

#Get long data from tidy data
melted = melt(df, id=c("questions_display"), variable.name = "semester", 
              value.name = "score")

#Set display text for rows
qs <- df$questions_display
qs1 <- c()
for(i in qs) qs1 <- c(qs1, substr(i, 3, 1000))

my.labels <- c("Spring 2012","Fall 2012","Spring 2013","Fall 2013",
               "Spring 2014","Fall 2014","Spring 2015","Fall 2015",
               "Fall 2016","Fall 2017",
               expression(bold("Total weighted average\nacross all semesters")))

#Set all the parameters for the heatmap
p <- ggplot(melted, aes(x = semester, y = questions_display,  fill = score)) + 
  #makes square boxes
  coord_equal() +
  #effectively creates white border around boxes
  geom_tile(colour="white",size=0.25)+
  #sets Pratt colors, but could be anything
  scale_fill_gradientn(limits = c(0,4), colors=c('black','#FFC200')) +
  #Make some of the theme elements more readable, and remove axes from behind
  theme(axis.text.x = element_text(angle = 90), 
        axis.ticks=element_line(size=0.0), 
        panel.background = element_blank()
       )+
  #set labels and caption
  labs(
      x="Semester", y="Evaluation Questions",fill = "Average\n Student\n Score", 
      title="Student Evaluations Overview\n for Josh Hadro SI 654",
      caption = "\n\nSource: Pratt SI student evaluations.\nCode available: https://github.com/hadro/student_evaluations_visualization"
      )+
  #set the questions in the right order we created earlier
  scale_y_discrete(labels=rev(qs1))+
  scale_x_discrete(labels= my.labels)+
  #Add the numerical overlay on top of the grid
  geom_text(aes(label = round(score, 1)), size = 3, color = "white")

p

#In case we want to save as a png
#ggsave(filename="evaluations.png",plot = p,dpi=300, type="cairo", width = 17, height = 22, units = "in")
