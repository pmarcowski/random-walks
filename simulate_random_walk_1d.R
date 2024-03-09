# Title: Simulate one-dimensional random walks
# Author: Przemyslaw Marcowski, PhD
# Email: p.marcowski@gmail.com
# Date: 2024-02-03
# Copyright (c) 2024 Przemyslaw Marcowski

# This code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

# This script simulates a 1D random walk with independent agents. 
# Parameters control the number of agents, the duration of their walks, 
# and the frequency of visualization updates. It pre-allocates matrices 
# for storing the agents' positions, sets up the plot area, and initializes 
# all agents to start at the origin. The simulation visualizes the individual 
# trajectories of these agents as they randomly move along a 1D line.

# Initialize parameters
n_agents <- 10 # number of agents in the simulation
n_walks <- 500 # number of steps each agent takes
buffer_size <- 1 # controls how often the plot updates (steps between updates)

# Pre-allocate a matrix for agents
agents <- matrix(0, nrow = n_walks + 1, ncol = n_agents)

# Setup the plot area
par(mfrow = c(1, 1), pty = "m")
matplot(0, type = "n", xlab = "Time", ylab = "Value", xlim = c(1, n_walks), ylim = c(-50, 50))
abline(h = 0, lty = "dashed")
title(paste("1D Random Walk Simulation:", n_agents, "agents"))

# Initialize agents at 0
for (j in 1:n_agents) {
  agents[1, j] <- 0
}

# Simulation loop for each step
for (i in 2:(n_walks+1)) {
  for (j in 1:n_agents) {
    # Move agent either -1 or +1 (randomly chosen)
    step <- sample(c(-1, 1), 1, TRUE)
    agents[i, j] <- agents[i-1, j] + step
  }
  
  # Update the plot every 'buffer_size' steps
  if (i %% buffer_size == 0 || i == n_walks + 1) {
    if (i > 2) { # make sure there's enough data to plot
      # Plot only the new segment for each agent
      for (j in 1:n_agents) {
        matlines(x = c(i-1, i), y = agents[(i-1):i, j], type = "l", col = j)
      }
    }
  }
  
  Sys.sleep(.05) # pause for animation effect
}
