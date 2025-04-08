make.custom.hla.gene.belt <- function(chr = 6, min.pos = 29900000, max.pos = 33300000) {
  par(mar = c(0, 5, 0, 4))
  offset <- 2
  yrange <- 0
  big.yrange <- yrange + offset
  gene.y <- 0
  padding <- 5e5 # 500,000 bases = 0.5 Mb
  shift <- 6e4  # Shift right by 200,000 bases
  
  plot(-1, -1, xlim = c(min.pos - shift, max.pos - shift), ylim = c(-1, 1.5), xlab = "", ylab = "", axes = FALSE)
  
  
  
  hla_genes <- data.frame(
    GENE = c("HLA-A", "HLA-B", "HLA-C", "HLA-DQA1", "HLA-DQB1", "HLA-DRB1", "HLA-DPA1", "HLA-DPB1"),
    START = c(30019970, 31431272, 31346171, 32716284, 32739039, 32660042, 33145064, 33157346)
  )
  
  
  
  gene_length <- 0
  hla_genes$END <- hla_genes$START + gene_length
  gene.center <- (hla_genes$START + hla_genes$END) / 2
  
  # Assign directions to avoid overlap
  genetips <- c("upleft", "upright", "upleft", "downright", "upright", "upleft", "downright", "upright")
  genecols <- c("#00ab34", "#c800a0", "#7100c8", "#567200", "#ecbd00", "#c80000", "#FF0000", "#0033F2")
  
  boxheight <- big.yrange / 4
  geneboxheight <- boxheight 
  tiplen.y <- boxheight / 2
  tiplen.x <- (max.pos - min.pos) / 75
  
  for (i in seq_len(nrow(hla_genes))) {
    center <- gene.center[i]
    gene.head <- gene.y + geneboxheight / 2
    gene.foot <- gene.y - geneboxheight / 2
    direction <- genetips[i]
    pickcol <- genecols[i]
    
    # Main gene line
    lines(rep(center, 2), c(gene.head, gene.foot), lwd = 0.7, col = pickcol)
    
    # Calculate tip direction
    if (grepl("up", direction)) {
      y0 <- gene.head
      y1 <- gene.head + tiplen.y
      if (grepl("left", direction)) {
        x1 <- center - tiplen.x
        lines(c(center, x1), c(y0, y1), lwd = 0.4, col = "black")
        text(x = x1, y = y1 + 1.7 * tiplen.y, label = hla_genes$GENE[i],
             pos = 2, font = 3, cex = 0.8, col = "black", xpd = TRUE)
      } else {
        x1 <- center + tiplen.x
        lines(c(center, x1), c(y0, y1), lwd = 0.4, col = "black")
        text(x = x1, y = y1 + 1.7 * tiplen.y, label = hla_genes$GENE[i],
             pos = 4, font = 3, cex = 0.8, col = "black", xpd = TRUE)
      }
    } else {
      y0 <- gene.foot
      y1 <- gene.foot - tiplen.y
      if (grepl("left", direction)) {
        x1 <- center - tiplen.x
        lines(c(center, x1), c(y0, y1), lwd = 0.4, col = "black")
        text(x = x1, y = y1 - 1.7 * tiplen.y, label = hla_genes$GENE[i],
             pos = 2, font = 3, cex = 0.8, col = "black", xpd = TRUE)
      } else {
        x1 <- center + tiplen.x
        lines(c(center, x1), c(y0, y1), lwd = 0.4, col = "black")
        text(x = x1, y = y1 - 1.7 * tiplen.y, label = hla_genes$GENE[i],
             pos = 4, font = 3, cex = 0.8, col = "black", xpd = TRUE)
      }
    }
  }
}

