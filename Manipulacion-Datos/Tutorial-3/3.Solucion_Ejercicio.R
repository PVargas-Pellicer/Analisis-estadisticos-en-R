
# Calculate the mean wingspan for each bird species. The function to do that is simply: mean()
sparrow <- mean(22, 24, 21)
kingfisher <- mean(26, 23, 25)
eagle <- mean(195, 201, 185)
hummingbird <- mean(8, 9, 9)

# Chain them together in a vector
wingspan <- c(sparrow, kingfisher, eagle, hummingbird)

# Create a bird species vector (careful to match the order of the previous vector!)
bird_sp <- c("sparrow", "kingfisher", "eagle", "hummingbird")
# notice how we put quotation marks around the names. It's because we're creating (character) values; writing sparrow without the "" would call the object we created in the code above, which would return the value 22!

# Bird species is currently in character form, but it should be a factor. Let's fix that:
# (To be honest it does not make any difference to the output here, but it would for some other types of plot. Take good habits early!)
class(bird_sp)                      # currently character
bird_sp <- as.factor(bird_sp)       # transforming into factor
class(bird_sp)                      # now a factor! 


# Then, combine the two vectors in a data frame
wings <- data.frame(bird_sp, wingspan)

# Plot the bar plot & save it to file
barplot(wings$wingspan, names.arg = wings$bird_sp,    # notice how we call the bird_sp column instead of typing all the names
        xlab = "Bird species", 
        ylab = "Average wingspan (cm)",               # adding axis titles
        ylim = c(0, 200),                             # setting the limits of the y axis to fit the eagle
        col = "gold"                                  # changing the colour because why not!
)
