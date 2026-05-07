
# Load data
rep1 <- read.table("/Users/miracomputers/Desktop/Spring 2026_NSBB 552/Assignment_2:eonakpojeruo/rep1.fpkm", header=TRUE, sep="\t")
rep2 <- read.table("/Users/miracomputers/Desktop/Spring 2026_NSBB 552/Assignment_2:eonakpojeruo/rep2.fpkm", header=TRUE, sep="\t")
#FPKM values are in column 10 so;
rep1_vals <- rep1[,10]
rep2_vals <- rep2[,10]
#Log transform
log_rep1 <- log2(rep1_vals + 1)
log_rep2 <- log2(rep2_vals + 1)
# Compute correlation
cor_value <- cor(log_rep1, log_rep2)

# Save scatterplot
png("/Users/miracomputers/Desktop/Spring 2026_NSBB 552/Assignment_2:eonakpojeruo/scatterplot.png",
    width = 900, height = 700)

plot(log_rep1, log_rep2,
     main = paste("Log FPKM Scatterplot\nCorrelation =", round(cor_value, 3)),
     xlab = "Replicate 1 (log2 FPKM + 1)",
     ylab = "Replicate 2 (log2 FPKM + 1)",
     pch = 16,
     col = rgb(0, 0, 1, 0.5))

abline(lm(log_rep2 ~ log_rep1), col = "red", lwd = 2)

dev.off()
#check that it saved:
file.exists("/Users/miracomputers/Desktop/Spring 2026_NSBB 552/Assignment_2:eonakpojeruo/scatterplot.png")
png("/Users/miracomputers/Desktop/Spring 2026_NSBB 552/Assignment_2:eonakpojeruo/boxplot.png",
    width = 800, height = 700)

boxplot(log_rep1, log_rep2,
        names = c("Replicate 1", "Replicate 2"),
        main = "Comparison of Log FPKM Values",
        ylab = "log2(FPKM + 1)",
        col = c("lightblue", "lightgreen"))

dev.off()
#check
file.exists("/Users/miracomputers/Desktop/Spring 2026_NSBB 552/Assignment_2:eonakpojeruo/boxplot.png")