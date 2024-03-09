# Title: Simulate two-dimensional random walks
# Author: Przemyslaw Marcowski, PhD
# Email: p.marcowski@gmail.com
# Date: 2024-02-03
# Copyright (c) 2024 Przemyslaw Marcowski

# This code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

# This script simulates a 2D random walk with independent agents.
# Parameters control the number of agents, the duration of their walks, 
# and whether they start at random positions or a central origin. 
# It pre-allocates matrices for storing the agents' changing positions, 
# sets up the visualization area, and initializes the starting locations. 
# The simulation visualizes the individual trajectories of these agents 
# as they randomly move across a 2D space.

# Initialize parameters
n_agents <- 10 # number of agents in the simulation
n_walks <- 500 # number of steps each agent takes
buffer_size <- 1 # controls how often the plot updates (steps between updates)
random_starts <- TRUE # if TRUE, agents begin at random positions; if FALSE, all start at (0,0)
start_range <- 50 # if random_starts is TRUE, agents start within a square of this side length 

# Pre-allocate matrices for agents' positions
agents_x <- matrix(0, nrow = n_walks + 1, ncol = n_agents)
agents_y <- matrix(0, nrow = n_walks + 1, ncol = n_agents)

# Setup the plot area
par(mfrow = c(1, 1), pty = "s")
matplot(0, type = "n", xlab = "X", ylab = "Y", xlim = c(-n_walks/5, n_walks/5), ylim = c(-n_walks/5, n_walks/5)) 
abline(h = 0, lty = "dashed")
abline(v = 0, lty = "dashed")
title(paste("2D Random Walk Simulation:", n_agents, "agents"))

# Initialize agents (with random starting positions if desired)
for (j in 1:n_agents) {
  if (random_starts) {
    agents_x[1, j] <- sample(-start_range:start_range, 1) # random x-coordinate
    agents_y[1, j] <- sample(-start_range:start_range, 1) # random y-coordinate
  } else {
    agents_x[1, j] <- 0 # start at (0, 0)
    agents_y[1, j] <- 0 # start at (0, 0)
  }
}

# Simulation loop for each step
for (i in 2:(n_walks+1)) {
  for (j in 1:n_agents) {
    # Random movement in x and y directions
    step_x <- sample(c(-1, 1), 1, TRUE)
    step_y <- sample(c(-1, 1), 1, TRUE)
    agents_x[i, j] <- agents_x[i-1, j] + step_x
    agents_y[i, j] <- agents_y[i-1, j] + step_y
  }
  
  # Update the plot every 'buffer_size' steps
  if (i %% buffer_size == 0 || i == n_walks + 1) {
    if (i > 2) { 
      # Plot the new segment for each agent
      for (j in 1:n_agents) {
        matlines(x = agents_x[(i-1):i, j], y = agents_y[(i-1):i, j], col = j)
      }
    }
  }
  
  Sys.sleep(.05) # pause for animation effect
}
