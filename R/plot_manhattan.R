library(CMplot)

# Set up layout: 2 rows (Manhattan + Gene Belt)
layout(matrix(1:2, nrow = 2), heights = c(7, 1))

# Prepare data
mydata <- df[, c("SNP", "Chromosome", "Position", "P")]
mydata$SNP <- as.character(mydata$SNP)

# HLA and AA SNPs
hla_snps <- mydata$SNP[grepl("^HLA", mydata$SNP)]
aa_snps  <- mydata$SNP[grepl("^AA",  mydata$SNP)]

# ✅ NEW: Define SNPs you want labeled
custom_snps_to_label <-  c(
  "AA_B_70_31432506_N",
  "AA_DRB1_13_32660109_SG"
)

# Combine all SNPs to highlight
highlight_snps <- unique(c(hla_snps, aa_snps, custom_snps_to_label))

# ⚠️ DEBUGGING CHECK: Are all highlight SNPs in the data?
missing_snps <- highlight_snps[!highlight_snps %in% mydata$SNP]
if (length(missing_snps) > 0) {
  stop("These highlight SNPs are NOT found in the data:\n", paste(missing_snps, collapse = ", "))
}

# ✅ Label vector — only label if in your custom list
highlight_labels <- sapply(highlight_snps, function(snp) {
  if (snp %in% custom_snps_to_label) return(snp) else return("")
})

# FINAL DEBUG: Check lengths match
if (length(highlight_labels) != length(highlight_snps)) {
  stop("Length of highlight.text does not match highlight SNPs.")
}

# Assign colors
highlight_colors <- sapply(highlight_snps, function(snp) {
  if (snp %in% custom_snps_to_label) return(adjustcolor("violet", alpha.f = 1))
  if (snp %in% hla_snps) return(adjustcolor("orange", alpha.f = 0.9))
  if (snp %in% aa_snps) return(adjustcolor("red", alpha.f = 0.3))
  return("grey")  # default color if not in the above categories
})
# Plot Manhattan
par(mar = c(1, 5, 2, 2))
CMplot(mydata,
       plot.type = "m",
       pch = 3,
       ylim = c(0,15),
       LOG10 = TRUE,
       col = c("grey30", "grey60"),
       highlight = highlight_snps,
       highlight.col = highlight_colors,
       highlight.pch = 18,
       highlight.cex = 1.2,
       highlight.text = highlight_labels,
       highlight.text.col = "black",
       highlight.text.cex = 1,
       chr.border = TRUE,
       ylab = expression(-log[10](italic(Phet))),
       file.output = FALSE)

# Add threshold line
abline(h = 5.21, col = "black", lty = 2, lwd = 1.5)

# Add title
mtext("Gender heterogeneity", 
      side = 3, 
      line = 0.5, 
      cex = 1.2, 
      font = 2, 
      adj = 1)

# Gene belt panel
#par(mar = c(5, 4, 1, 2))
#make.custom.hla.gene.belt(min.pos = 29602800, max.pos = 33268403)
#1100X450
