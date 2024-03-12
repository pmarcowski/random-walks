# -*- coding: utf-8 -*-

__author__ = "Przemyslaw Marcowski"
__copyright__ = "Copyright 2024 Przemyslaw Marcowski"
__license__ = "MIT"
__email__ = "p.marcowski@gmail.com"

"""
Simulate three-dimensional random walks

This script simulates a 3D random walk with independent agents.
Parameters control the number of agents, the duration of their walks, 
and whether they start at random positions or a central origin. 
It visualizes the trajectories of these agents as they move on a 3D grid.

# This code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
"""

import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation

# Initialize parameters
num_agents = 10 # number of agents for simulation
num_steps = 100 # number of steps for each agent
random_starts = True # enable random starts
start_range = 50 # area for randomizing start positions


def random_walk(num_steps, max_step=1, random_starts=False, start_range=10):
    """
    Generates single 3D random walk.

    Args:
        num_steps: Number of steps in the walk.
        max_step: Maximum step size in any direction.
        random_starts: If True, randomizes the starting position.
        start_range: If random_starts is True, defines the area of randomization.

    Returns:
        NumPy array of shape (num_steps, 3) representing the (x, y, z) coordinates. 
    """
    if random_starts:
        start_pos = np.random.randint(-start_range, start_range + 1, size=3)
    else:
        start_pos = np.zeros(3) # start at (0, 0, 0)

    steps = np.random.randint(-max_step, max_step + 1, size=(num_steps, 3))
    walk = start_pos + np.cumsum(steps, axis=0)
    return walk


def update_trajectory(num, walks, lines):
    """
    Updates trajectory of agents in the animation for current frame.

    Args:
        num: Current frame number.
        walks: List of random walk data arrays.
        lines: List of Matplotlib Line3D objects.
    """
    for line, walk in zip(lines, walks):
        line.set_data(walk[:num, :2].T)
        line.set_3d_properties(walk[:num, 2])
    return lines


# Generate random walk data
walks = [random_walk(num_steps, random_starts=random_starts, start_range=start_range) for index in range(num_agents)]

# Set up figure and 3D axes
grid_size = num_steps // 2
fig = plt.figure()
ax = fig.add_subplot(projection="3d")
ax.set(xlim3d=(-grid_size, grid_size), xlabel='X')
ax.set(ylim3d=(-grid_size, grid_size), ylabel='Y')
ax.set(zlim3d=(-grid_size, grid_size), zlabel='Z')

# Create lines for animation
lines = [ax.plot([], [], [])[0] for _ in walks]

# Create animation object
ani = animation.FuncAnimation(
    fig, update_trajectory, num_steps, fargs=(walks, lines), interval=50)

plt.show()