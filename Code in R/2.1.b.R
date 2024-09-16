# Simulation Question 2.1.b of the Textbook
# Author: Allen Zhang, Chadi Bsila

num_simulations <- 100000

P <- matrix(c(0.1, 0.3, 0.6, 
              0.0, 0.4, 0.6, 
              0.3, 0.2, 0.5), nrow = 3, byrow = TRUE)

success_count = 0

for (i in 1:num_simulations) {
  
  # Step 1: We know X_1 = 2 (fix this as initial condition)
  state_1 <- 2
  
  # Step 2 to 4: Simulate up to X_5 = 1
  state_2 <- sample(1:3, size = 1, prob = P[state_1, ])  # X_2 depends on X_1
  state_3 <- sample(1:3, size = 1, prob = P[state_2, ])  # X_3 depends on X_2
  state_4 <- sample(1:3, size = 1, prob = P[state_3, ])  # X_4 depends on X_3
  
  # We fix X_5 = 1
  state_5 <- 1
  
  # Step 6: Simulate X_6 based on X_5 = 1
  state_6 <- sample(1:3, size = 1, prob = P[state_5, ])
  
  # Step 7: We know X_7 = 3
  state_7 <- 3
  
  # Step 8: Simulate X_8 based on X_7 = 3
  state_8 <- sample(1:3, size = 1, prob = P[state_7, ])
  
  # Step 9: Simulate X_9 based on X_8
  state_9 <- sample(1:3, size = 1, prob = P[state_8, ])
  
  # Check if X_9 = 2
  if (state_9 == 2) {
    success_count = success_count + 1
  }
}

# Calculate the probability
cat("P(X_9 = 2 | X_1 = 2, X_5 = 1, X_7 = 3) ≈", success_count / num_simulations, "\n")

# Calculate using Transition Matrix
P %^% 2




