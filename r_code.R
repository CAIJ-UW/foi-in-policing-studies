#country plot
plot1 <- ggplot(df, aes(Country, fill = country_flag)) +
    geom_bar(show.legend = FALSE) +
    scale_fill_manual(values = c("TRUE" = rgb(238, 39, 56, maxColorValue = 255), "FALSE" = "black")) +
    theme(text = element_text(size=13)) +
    scale_y_continuous(name = "Number of Publications", breaks = c(0, 4, 8, 12, 16, 20)) +
    scale_x_discrete(name = "", labels = c("Canada", "United Kingdom", "United States")) +
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))
print(plot1)
  #labs (title = "Number of publications using freedom of information requests by country")  

#year
plot2 <- ggplot(df, aes(Year, fill = year_flag)) +
  geom_bar(show.legend = FALSE) + 
  scale_fill_manual(values = c("TRUE" = rgb(238, 39, 56, maxColorValue = 255), "FALSE" = "black")) +
  theme(text = element_text(size=13)) +
  scale_x_continuous(name = "", breaks = c(2003, 2005, 2007, 2009, 2011, 2013, 2015, 2017, 2019)) +
  scale_y_continuous(name = "Number of Publications", breaks = c(0, 2, 4, 6, 8, 10, 12)) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))
print(plot2)
  #labs(title = "Number of publications using freedom of information requests by year") 

#number of sources
plot3 <- ggplot(df, aes(Number_of_Sources, fill = sources_flag)) +
  geom_bar(show.legend = FALSE) + 
  scale_fill_manual(values = c("FALSE" = rgb(238, 39, 56, maxColorValue = 255), "TRUE" = "black")) +
  theme(text = element_text(size=13)) +
  scale_y_continuous(name = "Number of Publicatons",  breaks = c(0, 4, 8, 12, 16, 20)) +
  scale_x_continuous(name = "", breaks = c(1, 2, 3, 4), 
                   labels = c("1 Source (FOI)", "2 Sources", "3 Sources", "4 Sources")) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))
print(plot3)
  #labs(title = "Number of data sources used, in addition to freedom of information requests")

#Combinations of Sources
plot4 <- ggplot(df2, aes(x = reorder(Combination, -Count), y = Count, fill = combination_flag)) +
  geom_bar(stat = "identity", show.legend = FALSE) + 
  scale_fill_manual(values = c("TRUE" = rgb(238, 39, 56, maxColorValue = 255), "FALSE" = "black")) +
  theme(text = element_text(size=12)) +
  scale_y_continuous(name = "Number of Times Combination Used", breaks = c(0, 2, 4, 6, 8, 10, 12, 14, 16)) +
  scale_x_discrete(name = "", labels = c("Open Source", "Interviews", "Surveys", 
                                                                  "Experiments", "Focus Grps", 
                                                                  "Participant Obs.")) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))
print(plot4)


plot1 <- arrangeGrob (plot1, top = textGrob("A", x = unit(0, "npc"), y = unit(1, "npc"), just = c("left", "top"),
                                            gp=gpar(col="Black", fontsize = 15)))
plot2 <- arrangeGrob (plot2, top = textGrob("B", x = unit(0, "npc"), y = unit(1, "npc"), just = c("left", "top"),
                                            gp=gpar(col="Black", fontsize = 15)))
plot3 <- arrangeGrob (plot3, top = textGrob("C", x = unit(0, "npc"), y = unit(1, "npc"), just = c("left", "top"),
                                            gp=gpar(col="Black", fontsize = 15)))
plot4 <- arrangeGrob (plot4, top = textGrob("D", x = unit(0, "npc"), y = unit(1, "npc"), just = c("left", "top"),
                                            gp=gpar(col="Black", fontsize = 15)))

#Create plot grid
ggarrange(plot1, plot2, plot3, plot4, ncol = 2, nrow = 2)
