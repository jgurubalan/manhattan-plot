df <- read.table("jia_gwama_sex_diff_chr6.gwama.out", header = TRUE, sep = "\t")
#modify the colnames for P to use with qqman Manhattan Plot (Which P?)
colnames(df) <- c("Chromosome",	
                  "Position",	
                  "SNP",	
                  "A1",	
                  "A2",
                  "eaf",	
                  "OR",	
                  "OR_se",	
                  "OR_95L",	
                  "OR_95U",	
                  "z",	
                  "p_value",	
                  "_-log10_p-value",
                  "q_statistic",	
                  "q_p-value",	
                  "i2",	
                  "n_studies",	
                  "n_samples",	
                  "effects",	
                  "male_eaf",	
                  "male_OR",	
                  "male_OR_se",	
                  "male_OR_95L",	
                  "male_OR_95U",	
                  "male_z",	
                  "P_male",	
                  "male_n_studies",	
                  "male_n_samples",	
                  "female_eaf",	
                  "female_OR",	
                  "female_OR_se",	
                  "female_OR_95L",	
                  "female_OR_95U",	
                  "female_z",	
                  "P_female",	
                  "female_n_studies",	
                  "female_n_samples",	
                  "Pdiff",
                  "P")






