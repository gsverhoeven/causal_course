###############################################################################################
###############################################################################################
######                                                                                   ######
######                                                                                   ######
######                            Instrumental variables                                 ######
######                                                                                   ######
######                                  Exercises                                        ######
######                                                                                   ######
######                                                                                   ######
###############################################################################################
###############################################################################################



iv_reg <- function(dep_var, regressors_endo, regressors_exo, instruments, df){
  X <- as.matrix(df[,c(regressors_endo, regressors_exo)])
  y <- as.vector(df[,c(dep_var)])
  Z <- as.matrix(df[,c(regressors_exo, instruments)])
  
  b_ols <- solve(t(X)%*%X)%*%t(X)%*%y
  
  PzX <- Z%*%solve(t(Z)%*%Z)%*%t(Z)%*%X
  Pzy <- Z%*%solve(t(Z)%*%Z)%*%t(Z)%*%y
  b_iv <- solve(t(PzX)%*%PzX)%*%t(PzX)%*%Pzy
  
  res_ols <- y-X%*%b_ols
  sig2_ols <- as.numeric(t(res_ols)%*%res_ols/(dim(X)[1]-dim(X)[2]))
  V_ols <- sig2_ols*solve(t(X)%*%X)
  
  res_iv <- y-X%*%b_iv
  sig2_iv <- as.numeric(t(res_iv)%*%res_iv/dim(X)[1])
  V_iv <- sig2_iv*solve(t(PzX)%*%PzX)
  
  Pzu <- Z%*%solve(t(Z)%*%Z)%*%t(Z)%*%res_iv
  S <- t(Pzu)%*%Pzu/sig2_iv
  
  doi <- length(instruments) - length(regressors_endo)
  
  res <- list(b_ols = b_ols,b_iv = b_iv, V_ols = V_ols, V_iv = V_iv, Sargan = S, doi = doi)
  return(res)
}


###############################################################################################

# Prepare data 
df_gril$cons <- 1

# Make list of exogenous regressors
regressors_exo <- c("cons", "expr","tenure","rns","smsa")

# Mske list of endogenous regressors
regressors_endo <- c("s","iq")

# MAke list of instruments
instruments <- c("age", "age2", "med", "kww","mrt")

# Matrices
X <- as.matrix(df_gril[,c(regressors_endo, regressors_exo)])
y <- as.vector(df_gril$lw)
Z <- as.matrix(df_gril[,c(regressors_exo, instruments)])


# Example for iv_reg function
res <- iv_reg("lw", regressors_endo, regressors_exo, instruments, df_gril)

# Hausman test
Hausman <- t(res$b_iv-res$b_ols)%*%solve(res$V_iv-res$V_ols)%*%(res$b_iv-res$b_ols)

# Significance
pchisq(res$Sargan, df=res$doi, lower.tail=FALSE)
