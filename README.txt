Analysis of budding angles in colonies of Knufia petricola (KP)
James Pelletier and Lorna Mitchison-Field 2019

The folder KP_data includes data:
    - DMG: Index of daughter cell, index of mother cell, index of grandmother cell
    - im: Last image in time lapse movie
    - x, y: xy coordinates of cells

Here is a brief description of functions in the order they are used:

Functions to find xy coordinates of cells:
- load_image: Load an image (no longer needed as image stored in KP_data)
- find_cells_manual: Record the xy coordinates of cells in the image
- plot_cells: Show the xy coordinates of cells on the image

Then by watching the movie, the mother of each cell was assigned manually and stored in a table (no function)

Functions to confirm and assign lineage
- plot_edges: Show the lineage on the image, to confirm correct assignments
- grandma_finder: Assigns the grandmother of each cell based on the mother of each cell

Functions to calculate angles between cells in the colony:
- angles_singlebud: Calculate angle at which daughter budded relative to angle at which mother budded, when single daughter bud
- angles_multiplebuds: Calculate angle between multiple daughter buds
- combine_angles: Run the above two functions on all the data

Functions to analyze angular statistics:
- polar_histogram: Plot histogram of angles in polar coordinates
- circular_variance: Calculate the circular mean and variance
- cumulative_distribution: Sort angles in ascending order as another metric for variance
- test_click_accuracy: Estimate errors in angle associated with clicking
